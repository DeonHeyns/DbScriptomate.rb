begin
  require 'rubygems'
rescue LoadError
end

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
module DbScriptomate
  VERSION = '0.0.1'
end