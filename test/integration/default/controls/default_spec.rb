# frozen_string_literal: true

title 'Firefox default resource'

control 'firefox-install-01' do
  impact 1.0
  title 'Firefox is installed'

  case os.family
  when 'darwin'
    describe command('/Applications/Firefox.app/Contents/MacOS/firefox -v') do
      its('stdout') { should match(/Mozilla Firefox /) }
      its('exit_status') { should eq 0 }
    end
  when 'windows'
    describe registry_key('HKLM\SOFTWARE\Mozilla\Mozilla Firefox') do
      its('CurrentVersion') { should match(/\d+\.\d+\.\d+ \(x64 en-US\)/) }
    end
  else
    describe command('firefox -v') do
      its('stdout') { should match(/Mozilla Firefox /) }
      its('exit_status') { should eq 0 }
    end
  end
end
