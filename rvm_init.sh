#
# RVM init profile
#
# copys the rvm skeleton to home if it not exists
#

if [ ! -d "$HOME/.rvm" ]; then
  cp -r /etc/skel/.rvm "$HOME"
fi
