$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'support/mocks.rb'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'estimate'
