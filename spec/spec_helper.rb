require 'chefspec'
require 'chefspec/berkshelf'
require_relative '../libraries/default'

at_exit { ChefSpec::Coverage.report! }
