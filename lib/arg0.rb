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

    class << self; alias values value_for; end

    def self.value(switch_name)
      ARGV.each_with_index {|arg, index|
        if [switch_name].flatten.include? arg
          return ARGV[index + 1]
        end
      }
      nil
    end

    def self.keyring
      key_vals = {}
      ARGV.each {|arg|
        last_key = key_vals.keys.last
        if arg.match(/^-.*/)
          key_vals[arg] = true
        elsif key_vals[last_key] == true
          key_vals[last_key] = arg
        else
          key_vals[arg] = :data
        end
      }
      key_vals
    end
  end
end
