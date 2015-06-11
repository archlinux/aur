setenv PATH ${PATH}:/opt/activemq/bin/linux
if (! "$?ACTIVEMQ_HOME" ) then
  setenv ACTIVEMQ_HOME /opt/activemq
endif
