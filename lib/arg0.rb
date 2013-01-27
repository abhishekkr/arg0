# arg0
arg0_libs = File.join(File.dirname(File.expand_path __FILE__), 'ci-go-nfo', '*.rb')
Dir.glob(arg0_libs).each do |lib|
    require lib
end

module Arg0
  module Console
    def self.switch?(switch_name)
      ARGV.include? switch_name
    end

    def self.value_for(switch_name)
      values = []
      ARGV.each_with_index {|arg, index|
        if arg === switch_name
          values += [ARGV[index + 1]]
        end
      }
      values.delete nil
      values
    end
  end
end
