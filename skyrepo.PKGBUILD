source PKGBUILD #sets version only
pkgname=skyrepo
_pkgname=skyrepo
_skyrepourl="http://deb.skywire.skycoin.com"
_skyrepokeyid="48F19E5157BE6014D80A47328D6D51BC4AD7AE64"
pkgdesc="Skycoin apt repo configuration ${_skyrepourl} & repo signing key - debian package"
#pkgver='1.3.11'
_pkgver=${pkgver}
_pkgrel=${pkgrel}
arch=( 'any' )
_pkgarches=('amd64' 'arm64' 'armhf' 'armel')
_pkgpath="github.com/skycoin/${_pkgname}"
url="https://${_pkgpath}"
makedepends=('dpkg')
depends=()
_debdeps=""
unset source
unset source_x86_64
unset source_aarch64
unset source_armv8
unset source_arm
unset source_armv7
unset source_armv7l
unset source_armv7h
unset sha256sums
unset sha256sums_x86_64
unset sha256sums_aarch64
unset sha256sums_armv8
unset sha256sums_armv7
unset sha256sums_armv7l
unset sha256sums_armv7h
unset sha256sums_arm
build() {
	#create the apt repo config
	echo "deb ${_skyrepourl} sid main
	# deb-src ${_skyrepourl} sid main" | tee ${srcdir}/skycoin.list
	#create the pubkey file
	gpg --export ${_skyrepokeyid} | tee ${srcdir}/skycoin.gpg
	#create the update script
	echo "#!/bin/bash
		apt update -o Dir::Etc::sourcelist=/etc/apt/sources.list.d/skycoin.list &&	apt -qq --yes reinstall skywire-bin && systemctl is-active --quiet install-skywire && systemctl disable install-skywire 2> /dev/null" | tee ${srcdir}/install-skywire.sh
	#create the update service
	echo "[Unit]
	Description=install skywire service
	After=network-online.target
	Wants=network-online.target

	[Service]
	Type=simple
	ExecStart=/bin/install-skywire

	[Install]
	WantedBy=multi-user.target
	" | tee ${srcdir}/install-skywire.service

echo '#!/bin/bash
##/usr/bin/skywire-chrootconfig
#called by the postinstall script of the skyrepo .deb package
#################################################################
#meant to run when the skyrepo package is installed in chroot
	if [[ $INSTALLFIRSTBOOT == "1" ]] ; then
		if [[ -f /etc/systemd/system/install-skywire.service ]] ; then
			systemctl enable install-skywire.service
		fi
	fi
	# create envfile
	if [[ ! -f /etc/profile.d/skyenv.sh && -d /etc/profile.d ]] ; then
		touch /etc/profile.d/skyenv.sh
	fi
	# SKYBIAN=true enables autostart of skywire via skywire-autoconfig - on ARM architectures
	if [[ $(cat /etc/profile.d/skyenv.sh | grep SKYBIAN ) != *"SKYBIAN"* ]] ; then
		if [[ $(dpkg --print-architecture) == *"amd64"* ]] ; then
			echo "#SKYBIAN=true" | tee -a /etc/profile.d/skyenv.sh
		else
			echo "SKYBIAN=true" | tee -a /etc/profile.d/skyenv.sh
		fi
	fi
	# VPNSERVER=1 enables autostart of the vpn server - on ARM architectures
	if [[ $(cat /etc/profile.d/skyenv.sh | grep VPNSERVER ) != *"VPNSERVER"* ]] ; then
		if [[ $(dpkg --print-architecture) == *"amd64"* ]] ; then
			echo "#export VPNSERVER=1" | tee -a /etc/profile.d/skyenv.sh
		else
			echo "export VPNSERVER=1" | tee -a /etc/profile.d/skyenv.sh
		fi
	fi
' | tee ${srcdir}/skywire-chrootconfig.sh
	#create the postinstall script
	echo '#!/bin/bash
	#skybian post install script ; executed by dpkg upon package installation or updates
	/usr/bin/skywire-chrootconfig
' | tee ${srcdir}/postinst.sh
	#create the DEBIAN/control files
  for _i in ${_pkgarches[@]}; do
		_msg2 "_pkgarch=${_i}"
	  local _pkgarch=${_i}
		_msg2 "Creating DEBIAN/control file for ${_pkgarch}"
		echo "Package: ${_pkgname}" > ${srcdir}/${_pkgarch}.control
		echo "Version: ${_pkgver}-${_pkgrel}" >> ${srcdir}/${_pkgarch}.control
		echo "Priority: optional" >> ${srcdir}/${_pkgarch}.control
		echo "Section: web" >> ${srcdir}/${_pkgarch}.control
		echo "Architecture: ${_pkgarch}" >> ${srcdir}/${_pkgarch}.control
		echo "Replaces: skybian" >> ${srcdir}/${_pkgarch}.control
		echo "Depends: ${_debdeps}" >> ${srcdir}/${_pkgarch}.control
		echo "Maintainer: Skycoin" >> ${srcdir}/${_pkgarch}.control
		echo "Description: ${pkgdesc}" >> ${srcdir}/${_pkgarch}.control
		cat ${srcdir}/${_pkgarch}.control
	done
}

package() {
  for _i in ${_pkgarches[@]}; do
  _msg2 "_pkgarch=${_i}"
  local _pkgarch=${_i}
   echo ${_pkgarch}
  #set up to create a .deb package with dpkg
  _debpkgdir="${_pkgname}-${pkgver}-${_pkgrel}-${_pkgarch}"
  _pkgdir="${pkgdir}/${_debpkgdir}"
  #########################################################################
  #package normally here using ${_pkgdir} instead of ${pkgdir}
  _msg2 "Creating dirs"
  mkdir -p ${_pkgdir}/etc/apt/sources.list.d/
  mkdir -p ${_pkgdir}/etc/apt/trusted.gpg.d/
  mkdir -p ${_pkgdir}/usr/bin/
	mkdir -p ${_pkgdir}/etc/systemd/system/
	_msg2 "Installing install-skywire.sh skywire installation script"
	install -Dm755 ${srcdir}/install-skywire.sh ${_pkgdir}/usr/bin/install-skywire
	_msg2 "Installing install-skywire.service service for install-skywire.sh"
	install -Dm644 ${srcdir}/install-skywire.service ${_pkgdir}/etc/systemd/system/install-skywire.service
  _msg2 "Installing skywire-chrootconfig" #called by postinstall
  install -Dm755 ${srcdir}/skywire-chrootconfig.sh ${_pkgdir}/usr/bin/skywire-chrootconfig
  _msg2 "Installing apt repository configuration to:\n    /etc/apt/sources.list.d/skycoin.list"
  install -Dm644 ${srcdir}/skycoin.list ${_pkgdir}/etc/apt/sources.list.d/skycoin.list
  _msg2 "Installing apt repository signing key to:\n    /etc/apt/trusted.gpg.d/skycoin.gpg"
  install -Dm644 ${srcdir}/skycoin.gpg ${_pkgdir}/etc/apt/trusted.gpg.d/skycoin.gpg
  #########################################################################
  _msg2 'Installing control file and postinst script'
  install -Dm755 ${srcdir}/${_pkgarch}.control ${_pkgdir}/DEBIAN/control
  install -Dm755 ${srcdir}/postinst.sh ${_pkgdir}/DEBIAN/postinst
  _msg2 'Creating the debian package'
  cd $pkgdir
	if command -v tree &> /dev/null ; then
	_msg2 'package tree'
	  tree -a ${_debpkgdir}
	fi
	dpkg-deb --build -z9 ${_debpkgdir}
  mv *.deb ../../
  done
	#clean up manually just in case
	rm -rf ${srcdir}
  #exit so the arch package doesn't get built
  exit
}

_msg2() {
	(( QUIET )) && return
	local mesg=$1; shift
	printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
