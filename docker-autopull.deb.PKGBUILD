# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
source PKGBUILD
pkgname=skywire-docker-autopull
_pkgname=${pkgname}
pkgdesc="Skywire Docker deployment auto-updater: pulls latest image and recreates containers - debian package"
_pkgver=${pkgver}
_pkgrel=${pkgrel}
arch=('any')
_pkgarch='all'
url="https://github.com/skycoin/skywire"
makedepends=('dpkg')
depends=()
_debdeps=""
# Clear inherited sources
unset source_x86_64 source_i686 source_aarch64 source_armv8 source_arm source_armv7 source_armv7l source_armv7h source_riscv64
unset sha256sums_x86_64 sha256sums_i686 sha256sums_aarch64 sha256sums_armv8 sha256sums_arm sha256sums_armv7 sha256sums_armv7l sha256sums_armv7h
unset backup _source _desktop _icon _service _script _binarchive _release_url _binaryscript _appscript install

build() {
	_msg2 "Creating DEBIAN/control file for ${_pkgarch}"
	echo "Package: ${_pkgname}" > ${srcdir}/${_pkgarch}.control
	echo "Version: ${_pkgver}-${_pkgrel}" >> ${srcdir}/${_pkgarch}.control
	echo "Priority: optional" >> ${srcdir}/${_pkgarch}.control
	echo "Section: web" >> ${srcdir}/${_pkgarch}.control
	echo "Architecture: ${_pkgarch}" >> ${srcdir}/${_pkgarch}.control
	echo "Depends: ${_debdeps}" >> ${srcdir}/${_pkgarch}.control
	echo "Maintainer: Skycoin" >> ${srcdir}/${_pkgarch}.control
	echo "Description: ${pkgdesc}" >> ${srcdir}/${_pkgarch}.control
	cat ${srcdir}/${_pkgarch}.control

	echo '#!/bin/bash
	systemctl daemon-reload
	systemctl enable --now skywire-docker-autopull.timer
' > ${srcdir}/postinst.sh
}

package() {
  _debpkgdir="${_pkgname}-${pkgver}-${_pkgrel}-${_pkgarch}"
  _pkgdir="${pkgdir}/${_debpkgdir}"
  _systemddir="etc/systemd/system"

  mkdir -p "${_pkgdir}/usr/bin"
  mkdir -p "${_pkgdir}/${_systemddir}"

  _msg2 "Installing scripts"
  install -Dm755 "${srcdir}/../docker-autopull.sh" "${_pkgdir}/usr/bin/skywire-docker-autopull"

  _msg2 "Installing systemd service and timer"
  install -Dm644 "${srcdir}/../docker-autopull.service" "${_pkgdir}/${_systemddir}/skywire-docker-autopull.service"
  install -Dm644 "${srcdir}/../docker-autopull.timer" "${_pkgdir}/${_systemddir}/skywire-docker-autopull.timer"

  _msg2 "Installing control file and postinst script"
  install -Dm755 ${srcdir}/${_pkgarch}.control ${_pkgdir}/DEBIAN/control
  install -Dm755 ${srcdir}/postinst.sh ${_pkgdir}/DEBIAN/postinst

  _msg2 "Creating the debian package"
  cd $pkgdir
  if command -v tree &> /dev/null ; then
    _msg2 'package tree'
    tree -a ${_debpkgdir}
  fi
  dpkg-deb --build -z9 ${_debpkgdir}
  mv *.deb ../../
  rm -rf ${srcdir}
  exit
}

_msg2() {
	(( QUIET )) && return
	local mesg=$1; shift
	printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
sha256sums=('40c80ccce9e89ae559050b943be1f09d905476c614a72d74fac2a58c821ac058'
            '00da5a9afdf5a8c7033978d2074039ba1ff7bc7a7221fbd278eb1270bdeb8eae'
            'c74e72d1d9484fd91d9a67a64bfc92a811bba0f99e5d216cc2aac0aa830a7555'
            'ec24750a99f5cda8d8a8dc94743943218e1b2088c2b2c7dc1644ee78d954fe7e'
            'a6941680b5858ca3e0c85d9bf5824455a0c95524b61e42352462f2abbb750495'
            '459c78b3a9a6751a0eb9186bf2d509b5485d4ff46f938bbd03ec344ebd0ca6a2'
            '74bf6258bc2453a12c8c778869f4f042368596babaa594dcb3096013a5dc8f32'
            'b2be9ad04aece39759299c2333c51e81bf543fb7a6ee8f52046d499003cadf83'
            '2e0daf72fffbf81e9aa65ba0818195f9d3d43c6eb3f4656f40a4cf2f204aba4a'
            '78e80a8272d3d3fb952e249b88a55514bb419f8f9b0dc3335a9ca1d6ae01c5c5'
            '57740e8fecb39e4e4af2714214cadff6325868cf6846d9a2de4e998d8a0463e2'
            'ea6001f9dea428a6bd877676b42a2c7d6acdd36124eab2ec9d980645a55a115c'
            '0a24b82c6ac7775b541af426912091fecb34ad5cd9e741a8c6de3ac1c0ee3218'
            '03ee60eecd19c5d5260f3ae40f535c20488f045fea2f8d72d76f2778b6470809'
            'a7b8ae8fdd1c0410402cb732a2c5adc5c8dc948f5f8721efa08a77bf1b9216cb'
            '5181895a720e1db40026d970be311b4410f3bc45752f833652844d84c73cb54e'
            '483353f172cb12c8d726dce8e0cd284ff6bf6a69b2912274559bc199b1c7f3e3'
            '60cd97d7ff821f793de68f38aad4468fc83fcddf31449397227d16a746cc8a92'
            '2f1511abbd2b42f4bfebf2a872295de5992fe98d81163ac9ab7744d61608af5e')
