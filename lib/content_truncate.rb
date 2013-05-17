require "content_truncate/version"

module ContentTruncate
  # Your code goes here...
  class String

    def content_truncate length, *separator
      sub_string = self.dup
      while sep = separator.pop
        sub_string = sub_string.truncate(length, separator: sep)
      end
    end
  end
end

String.send include ContentTruncate::String
