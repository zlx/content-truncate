require 'active_support/core_ext/string'

module ContentTruncate
  module String
    def content_truncate limit_length, *separators
      sub_string = self.dup
      sep = separators.pop
      if sep
        while sep
          index = sub_string.index(sep)
          if index <= limit_length
            while index && index <= limit_length
              prev_index, index = index, sub_string.index(sep, index+1)
            end
            return sub_string[0...prev_index].strip
          else
            sep = separators.pop
          end
        end
      else
        sub_string.truncate(limit_length, separator: sep)
      end
    end
  end
end

class String
  include ContentTruncate::String
end