v = firefox_version

fail "Firefox version returned is invalid: #{v}" unless v.match(/[\d|.]*/)

log 'firefox version' do
  message v
end
