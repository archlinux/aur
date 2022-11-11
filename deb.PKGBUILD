# Maintainer: Moses Narrow <moses@skycoin.com>
source PKGBUILD
pkgdesc="Skywire Mainnet Node implementation. Develop Banch. Debian package"
_pkgarch=$(dpkg --print-architecture)
arch=('any')
_pkgrel=${pkgrel}
makedepends=("${makedepends[@]}" "dpkg")
_debdeps=""
source=("${_sourcedeb[@]}")
_sourcedeb=( "${source[@]}"
"postinst.sh::https://aur.archlinux.org/cgit/aur.git/plain/postinst.sh?h=skywire-bin"
"prerm.sh::https://aur.archlinux.org/cgit/aur.git/plain/prerm.sh?h=skywire-bin"
)
sha256sums=('56da81239baefeffd0bb607c4d1d3a1efc2e86e029471892970e531a9c269533'
            '08f0c625a3ae8810f0468a45aa2e463425ec307441f71f6ba48114bda2055316'
            'f0300bcde06b6818b637ccc23fa8206a40e67f63815781d265bd10d2cda93e65'
            '0c20dd44eca0266a3a10fab24c657295a833eba9f78c6b1cf06132b093ac3ba8'
            'ec24750a99f5cda8d8a8dc94743943218e1b2088c2b2c7dc1644ee78d954fe7e'
            'a6941680b5858ca3e0c85d9bf5824455a0c95524b61e42352462f2abbb750495'
            '19b74f7a9b245a96617f31d1fef7ce1e0231b2359d6525dd3f35d2b2a9d10d18'
            '55293e05c5d6c877397eb4c52123bb02e8bc92aeaf663ba70e1cfab318ce727c'
            '7b17a55e64d1371fecd24edc3da7c6a762cf2b3d058f6fc4a5dc7c5f9b4cff09'
            '233ccf0e87b37e782828f53960e05e478cf381f61bbfdb16a0cc0254ee8be7c2')

package() {
#set up to create a .deb package
_debpkgdir="${_pkgname}-${pkgver}${_rc}-${_pkgrel}-${_pkgarch}"
_pkgdir="${pkgdir}/${_debpkgdir}"
_systemddir="etc/systemd/system"
_packagedeb
#exit so the arch package doesn't get built
exit
}

#_packagedeb adds the debian-specific files and creates the .deb package
_packagedeb() {
_package
_msg2 'installing control file and install scripts'
#install -Dm755 ${srcdir}/${_scripts}/preinst.sh ${_pkgdir}/DEBIAN/preinst
install -Dm755 ${srcdir}/postinst.sh ${_pkgdir}/DEBIAN/postinst
install -Dm755 ${srcdir}/prerm.sh ${_pkgdir}/DEBIAN/prerm
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
Description: ${pkgdesc}" | tee ${_pkgdir}/DEBIAN/control
install -dm755 ${_pkgdir}/DEBIAN/control
_msg2 'creating the debian package'
#create the debian package
cd $pkgdir
dpkg-deb --build -z9 ${_debpkgdir}
mv *.deb ../../
}
