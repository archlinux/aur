# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Contributor: locked_sh <locked.sh@disroot.org>
# Contributor: Nicholas Wang <me@nicho1as.wang>

pkgname=emercoin-git
_pkgname=emercoin
pkgver=0.7.11
_pkgver=${pkgver}
pkgrel=8
_pkgrel=${pkgrel}
pkgdesc="Digital currency and blockchain service platform - debian package"
arch=('i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm')
_pkgarch=$(dpkg --print-architecture)
url="https://github.com/${_pkgname}/${_pkgname}"
license=('GPL')
depends=()
#depends=('boost-libs' 'miniupnpc' 'qt5-base' 'protobuf' 'qrencode' 'libevent')
_debdeps="libboost-filesystem1.74.0 (>= 1.74.0), libc6 (>= 2.30), libdb5.3++, libevent-2.1-7 (>= 2.1.8-stable), libevent-pthreads-2.1-7 (>= 2.1.8-stable), libgcc-s1 (>= 3.0), libleveldb1d, libminiupnpc17 (>= 1.9.20140610), libqrencode4 (>= 3.2.0), libqt5core5a (>= 5.15.1), libqt5dbus5 (>= 5.0.2), libqt5gui5 (>= 5.14.1) | libqt5gui5-gles (>= 5.14.1), libqt5network5 (>= 5.0.2), libqt5widgets5 (>= 5.15.1), libsqlite3-0 (>= 3.7.15), libstdc++6 (>= 9), libzmq5 (>= 4.0.1+dfsg)"
makedepends=('boost' 'qt5-tools' 'dpkg')
source=("git+${url}.git" #branch=${BRANCH:-0.7.11}"
"emercoin.install"
"emercoind.service"
"emc48.png"
"com.emercoin.Emercoin.desktop")
sha256sums=('SKIP'
            '9ab66d1537081746f5eec016628bc810d216ed393f062368decbeea3756bca35'
            '9e0832225a161a0c2694890e4d1791eedf943f96556db153e3cd5e40906ef5ed'
            '99d13ec06eb0d09662632e9eb6309ee38e03162f09513b23747f189602552132'
            'dfa7a4c2f717bbc29ba4273d65f80e0ee5853379e0632e458ae12df1ace72fcf')

build() {
  cd ${srcdir}/${_pkgname}
  #git pull -f
  git checkout ${pkgver}
  git pull --tags -f
	./autogen.sh
	./configure --prefix=/usr --with-gui=qt5 --with-incompatible-bdb --with-openssl --with-libressl=no --enable-tests=no --disable-dependency-tracking --disable-tests --disable-util-tx --disable-gui-tests --enable-bip70 --disable-hardening --disable-debug
	make
  mkdir -p ${srcdir}/usr
  make DESTDIR=${srcdir}/usr install
  ### CONTROL FILES CREATION ###
  #create control file for the debian package
  echo "Package: ${_pkgname}" > ${srcdir}/control
  echo "Version: ${_pkgver}-${_pkgrel}" >> ${srcdir}/control
  echo "Priority: optional" >> ${srcdir}/control
  echo "Section: web" >> ${srcdir}/control
  echo "Architecture: ${_pkgarch}" >> ${srcdir}/control
  echo "Depends: ${_debdeps}" >> ${srcdir}/control
  echo "Maintainer: Moses Narrow" >> ${srcdir}/control
  echo "Description: ${pkgdesc}" >> ${srcdir}/control
}

package() {
  _debpkgdir="${_pkgname}-${pkgver}-${_pkgrel}-${_pkgarch}"
  echo "${_debpkgdir}"
  _pkgdir="${pkgdir}/${_debpkgdir}"
  mkdir -p ${_pkgdir}/
  install -Dm644 ${srcdir}/emercoind.service ${_pkgdir}/usr/lib/systemd/system/emercoind.service
	install -Dm644 ${srcdir}/com.emercoin.Emercoin.desktop ${_pkgdir}/usr/share/applications/com.emercoin.Emercoin.desktop
	install -Dm644 ${srcdir}/emc48.png ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/emercoin.png
	install -Dm755 ${srcdir}/usr/usr/bin/emercoind ${_pkgdir}/usr/bin/emercoind
	install -Dm755 ${srcdir}/usr/usr/bin/emercoin-qt ${_pkgdir}/usr/bin/emercoin-qt
	install -Dm755 ${srcdir}/usr/usr/bin/emercoin-cli ${_pkgdir}/usr/bin/emercoin-cli

  _msg2 'installing control file'
  install -Dm755 ${srcdir}/control ${_pkgdir}/DEBIAN/control

  _msg2 'creating the debian package'
  #create the debian package
  cd ${pkgdir}
  dpkg-deb --build -z9 ${_debpkgdir}
  mv *.deb ../../
  #exit so the arch package doesn't get built
  exit

}

_msg2() {
	(( QUIET )) && return
	local mesg=$1; shift
	printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
