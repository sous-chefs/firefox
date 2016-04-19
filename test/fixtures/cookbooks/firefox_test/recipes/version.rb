include_recipe 'firefox::default'

version = firefox_version

raise "Firefox version returned is invalid: #{version}" unless version =~ /[\d|.]*/

log 'firefox version' do
  message version
end
