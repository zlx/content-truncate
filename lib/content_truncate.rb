# encoding: utf-8

module ContentTruncate
  module String
    def content_truncate limit_length, *separators
      sub_string = self.dup
      sep = separators.shift
      if sep
        sub_string.send(:smart_truncate, limit_length, sep, *separators)
      else
        sub_string.send(:smart_truncate, limit_length, "<br/>", "\n", "。", ".", " ")
      end
    end
    
    private
    def smart_truncate limit_length, sep, *separators
      while sep
        position = self.index(sep)||limit_length+1
        if position <= limit_length
          while position && position <= limit_length
            prev_index, position = position, self.index(sep, position+1)
          end
          return self[0...(prev_index+sep.length)].strip
        end
        sep = separators.shift
      end
      return self[0...limit_length].strip
    end
  end
end

class String
  include ContentTruncate::String
end