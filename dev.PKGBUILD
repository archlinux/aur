source deb.PKGBUILD
source git.PKGBUILD
pkgdesc="Skywire Mainnet Node implementation; develop branch - Debian package."
makedepends=("${makedepends[@]}" "dpkg")
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
sha256sums=('SKIP'
            'SKIP')
