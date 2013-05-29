require 'active_support/core_ext/string'

module ContentTruncate
  module String
    def content_truncate limit_length, *separators
      sub_string = self.dup
      sep = separators.shift
      if sep
        sub_string.send(:smart_truncate, limit_length, sep, separators)
      else
        sub_string.truncate(limit_length, separator: sep)
      end
    end
    
    private
    def smart_truncate limit_length, sep, *separators
      while sep
        index = self.index(sep)
        if index <= limit_length
          while index && index <= limit_length
            prev_index, index = index, self.index(sep, index+1)
          end
          return self[0..(prev_index+sep.length)].strip
        else
          sep = separators.shift
        end
      end
    end
  end
end

class String
  include ContentTruncate::String
end