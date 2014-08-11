require 'optparse'

module DbScriptomate
  class Command

    COMMAND_REGEX = /^[a-zA-Z]*/
    attr_reader :parameters, :help, :operation

    def initialize(args)
      @parameters = {}
      @operation = '' << args[0] if args[0] =~ COMMAND_REGEX
      @opt_parser = OptionParser.new do |opt|
        opt.banner = 'Usage: dbscriptomate COMMAND [OPTIONS]'
        opt.separator ''
        opt.separator 'Commands'
        opt.separator '     setupdb:    will setup the database for initial user. A journaling table will be created'
        opt.separator '     migrate:    run all the migration files'
        opt.separator '     generate:   generate a new migration script'
        opt.separator ''
        opt.separator 'Options'

        opt.on('-h', '--host [HOST]', String, 'the IP address or machine name of where the database is running') do |host|
          @parameters[:host] = host
        end

        opt.on('-n', '--dbname [DBNAME]', String, 'the database against which we need to run the scripts') do |dbname|
          @parameters[:dbname] = dbname
        end

        opt.on('-u', '--username [USERNAME]', String,'username used to connect to the database') do |username|
          @parameters[:username] = username
        end

        opt.on('-p', '--password [PASSWORD]', String,'password of the user used to connect to the database') do |password|
          @parameters[:password] = password
        end

        opt.on('-o', '--port [PORT]', String,'the port used to connect to the database') do |port|
          @parameters[:port] = port
        end

        opt.on_tail('-?', '--help', 'Show this message') do
          puts opt
          exit
        end
      end
      @help = @opt_parser.help
      parse! args
    end

    def execute
    end

    def parse!(args)
      @opt_parser.parse! args
    end

  end
end