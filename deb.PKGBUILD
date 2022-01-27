pkgname=emercoin-bin
_pkgname=emercoin-bin
pkgver=0.7.11
_pkgver=${pkgver}
pkgrel=1
_pkgrel=${pkgrel}
pkgdesc="Emercoin is a digital currency and blockchain service platform. Debian package."
arch=('x86_64')
_pkgarch=$(dpkg --print-architecture)
depends=("libevent>=2.1.8" "qt5-base" "dbus>=1.10.14" "miniupnpc>=2.0.20170509" "expat>=2.2.0" "freetype2>=2.7.1" "protobuf")
_debdeps="libboost-filesystem1.74.0 (>= 1.74.0), libc6 (>= 2.30), libdb5.3++, libevent-2.1-7 (>= 2.1.8-stable), libevent-pthreads-2.1-7 (>= 2.1.8-stable), libgcc-s1 (>= 3.0), libleveldb1d, libminiupnpc17 (>= 1.9.20140610), libqrencode4 (>= 3.2.0), libqt5core5a (>= 5.15.1), libqt5dbus5 (>= 5.0.2), libqt5gui5 (>= 5.14.1) | libqt5gui5-gles (>= 5.14.1), libqt5network5 (>= 5.0.2), libqt5widgets5 (>= 5.15.1), libsqlite3-0 (>= 3.7.15), libstdc++6 (>= 9), libzmq5 (>= 4.0.1+dfsg)"
makedepends=('dpkg')
provides=('emercoin')
conflicts=('emercoin')
url="http://emercoin.com/"
license=('GPL3')
install='emercoin.install'
_archive="emercoin-${pkgver}-x86_64-linux-gnu"
source_x86_64=("https://github.com/emercoin/emercoin/releases/download/v${pkgver}emc/${_archive}.tar.bz2"
"emercoin.install"
"emercoind.service"
"emc48.png"
"com.emercoin.Emercoin.desktop")
sha256sums_x86_64=('b2dfbd5016ab20965fcd0e245dc17e502b17a39e9c070fc094607888b8d84313'
                   '9ab66d1537081746f5eec016628bc810d216ed393f062368decbeea3756bca35'
                   '9e0832225a161a0c2694890e4d1791eedf943f96556db153e3cd5e40906ef5ed'
                   '99d13ec06eb0d09662632e9eb6309ee38e03162f09513b23747f189602552132'
                   'dfa7a4c2f717bbc29ba4273d65f80e0ee5853379e0632e458ae12df1ace72fcf')

build() {
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
	######
	install -Dm644 ${srcdir}/emercoind.service ${_pkgdir}/usr/lib/systemd/system/emercoind.service
	install -Dm644 "${srcdir}"/com.emercoin.Emercoin.desktop ${_pkgdir}/usr/share/applications/com.emercoin.Emercoin.desktop
	install -Dm644 "${srcdir}"/emc48.png ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/emercoin.png
	cd "${_archive}"
	install -Dm755 emercoind $_pkgdir/usr/bin/emercoind
	install -Dm755 emercoin-qt $_pkgdir/usr/bin/emercoin-qt
	install -Dm755 emercoin-cli $_pkgdir/usr/bin/emercoin-cli
	######
	_msg2 'installing control file'
	install -Dm755 ${srcdir}/control ${_pkgdir}/DEBIAN/control

	_msg2 'creating the debian package'
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
