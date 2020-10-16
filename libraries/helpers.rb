module Firefox
  module Cookbook
    module Helpers
      def firefox_package_name
        case node['platform_family']
        when 'suse'
          'MozillaFirefox'
        when 'debian'
          platform?('debian') ? 'firefox-esr' : 'firefox'
        else
          'firefox'
        end
      end
    end
  end
end
Chef::DSL::Recipe.include ::Firefox::Cookbook::Helpers
Chef::Resource.include ::Firefox::Cookbook::Helpers
