# arg0
arg0_libs = File.join(File.dirname(File.expand_path __FILE__), 'arg0', '*.rb')
Dir.glob(arg0_libs).each do |lib|
    require lib
end

module Arg0
  module Console
    def self.switch?(switch_name)
      ! [switch_name].flatten.select {|switch|
        ARGV.include? switch
      }.empty?
    end

    def self.value_for(switch_name)
      values = []
      ARGV.each_with_index {|arg, index|
        if [switch_name].flatten.include? arg
          values += [ARGV[index + 1]]
        end
      }
      values.delete nil
      values
    end
  end
end
