# By Jinxuan Zhu, <zhujinxuan@gmail.com>, Snow @ AUR
# Based on autojump.sh

shell=`echo ${SHELL} | awk -F/ '{ print $NF }'`

# prevent circular loop for sh shells
if [ "${shell}" = "sh" ] ; then 
  return 0
elif [ -s ~/.utopia-documents/etc/profile.d/utopia-documents.${shell} ]; then
  source ~/.utopia-documents/etc/profile.d/utopia-documents.${shell} 
elif [ -s /etc/profile.d/utopia-documents.${shell} ]; then
  source /etc/profile.d/utopia-documents.${shell}
fi
