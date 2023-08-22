source PKGBUILD
_pkgver=${pkgver}
_pkgrel=${pkgrel}
pkgdesc="Emercoin is a digital currency and blockchain service platform. Debian package."
_pkgarch=$(dpkg --print-architecture)
arch=('any')
makedepends=('dpkg')
_debdeps="libboost-filesystem1.74.0 (>= 1.74.0), libc6 (>= 2.30), libdb5.3++, libevent-2.1-7 (>= 2.1.8-stable), libevent-pthreads-2.1-7 (>= 2.1.8-stable), libgcc-s1 (>= 3.0), libleveldb1d, libminiupnpc17 (>= 1.9.20140610), libqrencode4 (>= 3.2.0), libqt5core5a (>= 5.15.1), libqt5dbus5 (>= 5.0.2), libqt5gui5 (>= 5.14.1) | libqt5gui5-gles (>= 5.14.1), libqt5network5 (>= 5.0.2), libqt5widgets5 (>= 5.15.1), libsqlite3-0 (>= 3.7.15), libstdc++6 (>= 9), libzmq5 (>= 4.0.1+dfsg)"
#noextract=(
#"${_archive}.tar.xz"
#)

build() {
    #create control file for the debian package
    echo "Package: ${pkgname}" > ${srcdir}/control
    echo "Version: ${pkgver}-${_pkgrel}" >> ${srcdir}/control
    echo "Priority: optional" >> ${srcdir}/control
    echo "Section: web" >> ${srcdir}/control
    echo "Architecture: amd64" >> ${srcdir}/control
    echo "Depends: ${_debdeps}" >> ${srcdir}/control
    echo "Provides: ${_pkgname}" >> ${srcdir}/control
    echo "Maintainer: ${_githuborg}" >> ${srcdir}/control
    echo "Description: ${pkgdesc}" >> ${srcdir}/control
}

package() {
#set up to create a .deb package
_debpkgdir="${pkgname}-${pkgver}-${pkgrel}-${_pkgarch}"
_pkgdir="${pkgdir}/${_debpkgdir}"
[[ -d "${_pkgdir}" ]] && rm -rf "${_pkgdir}"
_systemddir="etc/systemd/system"
_package
install -Dm755 "${srcdir}/control" "${_pkgdir}/DEBIAN/control"
#create the debian package!
cd "${pkgdir}"
dpkg-deb --build -z9 "${_debpkgdir}"
mv *.deb ../../
#exit so the arch package doesn't get built
exit
}
