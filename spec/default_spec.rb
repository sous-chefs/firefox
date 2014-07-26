require 'spec_helper'

describe 'firefox::default' do
  let(:chef_run) do
    runner = ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04')
    runner.converge 'firefox::default'
  end
  subject { chef_run }

end
