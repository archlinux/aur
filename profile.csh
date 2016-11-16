setenv PATH ${PATH}:/opt/activemq/bin/linux-x86-64
if (! "$?ACTIVEMQ_HOME" ) then
  setenv ACTIVEMQ_HOME /opt/activemq
endif
