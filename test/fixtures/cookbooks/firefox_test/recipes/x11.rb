# X11 allows for visual GUI verification.
#
# The following link provides information about setting up x11 with vagrant:
# https://coderwall.com/p/ozhfva/run-graphical-programs-within-vagrantboxes
#
# Ignore the following errors when connecting as this seems normal for firefox or is necessary to avoid other issues.
#
# $ ssh -X -p2222 vagrant firefox # ubuntu with no dbus-x11 package to avoid x11 hanging after closing window
#   /usr/bin/xauth:  file /home/vagrant/.Xauthority does not exist
#
#   (process:6095): GLib-CRITICAL **: g_slice_set_config: assertion 'sys_page_size == 0' failed
#
#   (firefox:6095): LIBDBUSMENU-GLIB-WARNING **: Unable to get session bus: Failed to execute child process "dbus-launch" (No such file or directory)
#
# $ ssh -X -p2200 vagrant firefox # centos
#   /usr/bin/xauth:  file /home/vagrant/.Xauthority does not exist
#
#   (process:18177): GLib-CRITICAL **: g_slice_set_config: assertion `sys_page_size == 0' failed
#   GLib-GIO-Message: Using the 'memory' GSettings backend.  Your settings will not be saved or shared with other applications.
#
package 'xauth'

# ubuntu firefox package installs .mozilla as root instead of vagrant, you can chown it or remove it completely
execute 'chown -R vagrant:vagrant ~/.mozilla' do
  only_if { platform?('ubuntu') }
end
