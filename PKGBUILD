# Maintainer: Steffen Hansen <steffengrundsoe@gmail.com>
_pkgname=quickgui
pkgname=$_pkgname-bin
pkgver=1.2.6
pkgrel=1
pkgdesc="A Flutter frontend for quickget and quickemu"
arch=('x86_64')
url="https://github.com/quickgui/quickgui"
license=('GPL')
depends=('quickemu' 'zenity')
options=('!strip' '!emptydirs')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname_$pkgver.kinetic1.0_amd64.deb"::"https://github.com/quickemu-project/$_pkgname/releases/download/v1.2.5/${_pkgname}_$pkgver.kinetic1.0_amd64.deb")
sha256sums=('d6a7060828d7095de714cd7d1dcca916f938d09f5c04bf983901010d01835291')

package() {
  tar -xf data.tar.zst -C "$pkgdir"
  install -D -m644 "${pkgdir}/usr/share/doc/quickgui/copyright" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
