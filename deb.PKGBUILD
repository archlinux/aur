# Maintainer: Moses Narrow <moses@skycoin.com>
source PKGBUILD
pkgdesc="Skywire Mainnet Node implementation. Develop Banch. Debian package"
_pkgarch=$(dpkg --print-architecture)
arch=('any')
_pkgrel=${pkgrel}
makedepends=("${makedepends[@]}" "dpkg")
_debdeps=""

package() {
#set up to create a .deb package
_debpkgdir="${_pkgname}-${pkgver}${_rc}-${_pkgrel}-${_pkgarch}"
_pkgdir="${pkgdir}/${_debpkgdir}"
_systemddir="etc/systemd/system"
_skywirebin="skywire-bin/"

_packagedeb
if command -v tree &> /dev/null ; then
_msg2 'package tree'
  tree -a ${pkgdir}
fi
#exit so the arch package doesn't get built
exit
}

#_packagedeb adds the debian-specific files and creates the .deb package
_packagedeb() {
_package
_msg2 'installing control file and install scripts'
#install -Dm755 ${srcdir}/${_scripts}/preinst.sh ${_pkgdir}/DEBIAN/preinst
install -Dm755 ${srcdir}/${_skywirebin}postinst.sh ${_pkgdir}/DEBIAN/postinst
install -Dm755 ${srcdir}/${_skywirebin}prerm.sh ${_pkgdir}/DEBIAN/prerm
#install -Dm755 ${srcdir}/${_scripts}/postrm.sh ${_pkgdir}/DEBIAN/postrm
### CONTROL FILES CREATION ###
#create control file for the debian package
echo -e "Package: skywire
Version: ${_pkgver}-${_pkgrel}
Priority: optional
Section: web
Architecture: ${_pkgarch}
Depends: ${_debdeps}
Maintainer: skycoin
Description: ${pkgdesc}" | tee ${pkgdir}/control
install -Dm755 ${pkgdir}/control ${_pkgdir}/DEBIAN/control
rm ${pkgdir}/control
_msg2 'creating the debian package'
#create the debian package
cd $pkgdir
dpkg-deb --build -z9 ${_debpkgdir}
mv *.deb ../../
}
sha256sums=('e05e46b2315e4dea3b843425004e0e501f999b727265f434a60cd3874e2216e9'
            'SKIP'
            '73f3d759c8fa3ff7237d78662bf37f0e886f19879f8c541bfed5e750a1810fc3'
            '891562be2c32a3f8603d812b0569c6035f384196709335debf5b40dbf3726389')
