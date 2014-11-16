include_recipe 'firefox::default'

version = firefox_version

fail "Firefox version returned is invalid: #{version}" unless version.match(/[\d|.]*/)

log 'firefox version' do
  message version
end
