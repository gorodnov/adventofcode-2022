# frozen_string_literal: true

module AdventOfCode
  class Day7 < Day
    def solution1
      filesystem
        .map { |_, v| v[:size] }
        .keep_if { |size| size < 100000 }
        .sum
    end

    def solution2
      space_needed = filesystem['./'][:size] + 30000000 - 70000000
      filesystem
        .map { |_, v| v[:size] }
        .keep_if { |size| size >= space_needed }
        .min
    end

    private

    def filesystem
      @filesystem ||= traverse(input, 0, nil, {}).then { |x| calc_size('./', x); x }
    end

    def calc_size(current, context)
      dirs = context[current][:dirs] || []
      files = context[current][:files] || []
      context[current][:size] = files.sum + dirs.reduce(0) { |s, d| s + calc_size(descriptor(current, d), context) }
    end

    def descriptor(parent, dir)
      [parent, dir].join('.')
    end

    def traverse(input, pos, parent, context)
      return context if pos + 1 > input.length
      next_parent =
        case input[pos].split
        in ['$', 'cd', '..']
          context[parent][:parent]
        in ['$', 'cd', dir]
          descriptor = descriptor(parent, dir)
          context[descriptor] = { parent: }
          descriptor
        in ['$', 'ls']
          parent
        in ['dir', dir]
          (context[parent][:dirs] ||= []) << dir
          parent
        in [filesize, *]
          (context[parent][:files] ||= []) << filesize.to_i
          parent
        else
          raise 'Something wrong'
        end
      traverse(input, pos + 1, next_parent, context)
    end
  end
end
