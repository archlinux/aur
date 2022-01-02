# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Contributor: locked_sh <locked.sh@disroot.org>
# Contributor: Nicholas Wang <me@nicho1as.wang>

pkgname=emercoin
_pkgname=${pkgname}
pkgver=0.7.11
_pkgver=${pkgver}
pkgrel=3
_pkgrel=${pkgrel}
pkgdesc="Digital currency and blockchain service platform - debian package"
arch=('i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm')
_pkgarch=$(dpkg --print-architecture)
url="https://emercoin.com/"
license=('GPL')
depends=()
#depends=('boost-libs' 'miniupnpc' 'qt5-base' 'protobuf' 'qrencode' 'libevent')
_debdeps="libboost-filesystem1.74.0 (>= 1.74.0), libc6 (>= 2.30), libdb5.3++, libevent-2.1-7 (>= 2.1.8-stable), libevent-pthreads-2.1-7 (>= 2.1.8-stable), libgcc-s1 (>= 3.0), libleveldb1d, libminiupnpc17 (>= 1.9.20140610), libqrencode4 (>= 3.2.0), libqt5core5a (>= 5.15.1), libqt5dbus5 (>= 5.0.2), libqt5gui5 (>= 5.14.1) | libqt5gui5-gles (>= 5.14.1), libqt5network5 (>= 5.0.2), libqt5widgets5 (>= 5.15.1), libsqlite3-0 (>= 3.7.15), libstdc++6 (>= 9), libzmq5 (>= 4.0.1+dfsg)"
makedepends=('boost' 'qt5-tools' 'dpkg')
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}emc.tar.gz"
        "Fix-missing-include.patch"
        "Fix-deadlock-while-switching-from-SSLv3-to-TLS.patch"
        "emercoin-qt.desktop"
)
sha256sums=('78d11b9308d67e53552d596269ae3be881ee6f88c8fb531a08ec9b77e9f7d024'
            '75b1e7bebb53a48cf93f2b701bbd8d9a1e7005b45c63a804596b68b0e9343c87'
            '1b339af10cbd8e003ce7c44f28b9d2eaf23e01d094078f96f21fa45d1679edef'
            '06645c91c499215866a506e409a8f4a80d77dbb85fdfc0bd9d1db75e2687a508')
prepare() {
	cd "${pkgname}-${pkgver}emc"
	patch -Np1 -i ${srcdir}/Fix-missing-include.patch #See https://doc.qt.io/Qt-5/qintvalidator.html for more details
#	patch -Np1 -i ${srcdir}/Fix-deadlock-while-switching-from-SSLv3-to-TLS.patch #See https://bugs.archlinux.org/task/60235 and https://github.com/bitcoin/bitcoin/issues/14273#issuecomment-424905851 for more details
}

build() {
	cd "${pkgname}-${pkgver}emc"
	./autogen.sh
	./configure --prefix=/usr --with-gui=qt5 --with-incompatible-bdb --with-openssl --with-libressl=no --enable-tests=no
	make
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
	cd ${pkgname}-${pkgver}emc
	make DESTDIR=${_pkgdir}/ install
	install -Dm644 ${srcdir}/emercoin-qt.desktop ${_pkgdir}/usr/share/applications/emercoin.desktop
	install -Dm644 src/qt/res/icons/emercoin.png ${_pkgdir}/usr/share/pixmaps/emercoin.png
#	install -Dm644 contrib/debian/emercoin.conf \
#		"$pkgdir/etc/emercoin.conf"
#	install -Dm644 contrib/debian/emercoind.service \
#		"$pkgdir/usr/lib/systemd/system/emercoind.service"
	install -Dm644 COPYING ${_pkgdir}/usr/share/licenses/${pkgname}/COPYING
  mv  ${_pkgdir}/usr/share/man/man1 ${_pkgdir}/usr/share/man/man2

  _msg2 'installing control file'
  install -Dm755 ${srcdir}/control ${_pkgdir}/DEBIAN/control

  _msg2 'creating the debian package'
  #create the debian package
  cd $pkgdir
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
