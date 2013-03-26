#!/usr/bin/env ruby

require 'test/unit'
require_relative '../lib/arg0.rb'

class TestArg0Console < Test::Unit::TestCase
  def setup;   end
  def teardown; ARGV.clear; end

  def test_switch_empty
    assert_equal Arg0::Console.switch?('-h'), false
  end

  def test_switch_on
    ARGV.push '-h'
    assert_equal Arg0::Console.switch?('-h'), true
    assert_equal Arg0::Console.switch?(['-h', '--help']), true
    assert_equal Arg0::Console.switch?(['-info', '-h', '--help']), true
  end

  def test_switch_off
    ARGV.push '--help'
    assert_equal Arg0::Console.switch?('-h'), false
    assert_equal Arg0::Console.switch?(['-h', '-help']), false
  end

  def test_value_for
    assert_equal Arg0::Console.value_for('-src'), []
    ARGV.push '--log', 'a0.log', '-src', File.dirname(__FILE__), '-v', '-l', 'a2.log'
    src01 = Arg0::Console.value_for('-src')
    src02 = Arg0::Console.value_for(['-s', '-src', '--source'])
    log = Arg0::Console.value_for(['-l', '--log'])
    assert_equal src01, src02
    assert_not_equal src01, log
    assert_equal log, ['a0.log', 'a2.log']
  end

  def test_values
    ARGV.push '--log', 'a0.log', '-src', File.dirname(__FILE__), '-v', '-l', 'a2.log'
    src01 = Arg0::Console.values('-src')
    src02 = Arg0::Console.values(['-s', '-src', '--source'])
    log = Arg0::Console.values(['-l', '--log'])
    assert_equal src01, src02
    assert_not_equal src01, log
    assert_equal log, ['a0.log', 'a2.log']
  end

  def test_value
    assert_equal Arg0::Console.value(['-l', '--log']), nil
    ARGV.push '--log', 'a0.log', '-src', File.dirname(__FILE__), '-v', '-l', 'a2.log'
    assert_equal Arg0::Console.value(['-l', '--log']), 'a0.log'
  end

  def test_keyring
    assert_equal Arg0::Console.keyring, {}
    ARGV.push '--log', 'a0.log', '-src', File.dirname(__FILE__), '-v', '-l', 'a2.log'
    key_vals = Arg0::Console.keyring
    assert_equal key_vals, {"--log"=>"a0.log", "-src"=>File.dirname(__FILE__), "-v"=>true, "-l"=>"a2.log"}
  end
end
