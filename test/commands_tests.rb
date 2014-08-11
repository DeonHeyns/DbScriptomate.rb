require 'minitest/autorun'
require '../lib/dbscriptomate/command'


class CommandsTests < Minitest::Test

  def setup
    @args = []
    # setup argv how we need it for a good run
    'generate -h 127.0.0.1 -d test -u postgres -p password -o 14332'.split(' ').each_with_index do |arg, idx|
      @args[idx] = arg
    end
  end

  def test_operation_is_parsed_from_arguments
    command = DbScriptomate::Command.new @args
    assert_equal 'generate', command.operation

    @args[0] = 'setupdb'
    command = DbScriptomate::Command.new @args
    assert_equal 'setupdb', command.operation

    @args[0] = 'migrate'
    command = DbScriptomate::Command.new @args
    assert_equal 'migrate', command.operation
  end

  def test_parameters_are_parsed_and_can_be_accessed
    command = DbScriptomate::Command.new @args
    assert_equal true, command.parameters.any?
  end

end