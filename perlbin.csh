# Set path to cperl scriptdirs if they exist
# https://wiki.archlinux.org/index.php/Perl_Policy#Binaries_and_scripts
# Added /usr/bin/*_cperl dirs for scripts
# Remove /usr/lib/cperl/*_cperl/bin in next release

[ -d /usr/bin/site_cperl ] && setenv PATH ${PATH}:/usr/bin/site_cperl
[ -d /usr/lib/cperl/site_cperl/bin ] && setenv PATH ${PATH}:/usr/lib/cperl/site_cperl/bin

[ -d /usr/bin/vendor_cperl ] && setenv PATH ${PATH}:/usr/bin/vendor_cperl
[ -d /usr/lib/cperl/vendor_cperl/bin ] && setenv PATH ${PATH}:/usr/lib/cperl/vendor_cperl/bin

[ -d /usr/bin/core_cperl ] && setenv PATH ${PATH}:/usr/bin/core_cperl

# If you have modules in non-standard directories you can add them here.
#export PERLLIB=dir1:dir2
