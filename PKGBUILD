# Maintainer: aksr <aksr at t-com dot me>
pkgname=neatroff_dat
_pkgname=neatroff
pkgver=0.5
pkgrel=1
epoch=
pkgdesc="The set of basic troff macros and an output device for neatroff."
arch=('any')
url="http://litcave.rudi.ir/"
license=('Lucent Public License')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://litcave.rudi.ir/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('da45fc94ca4f16d4465a0808dfa21d10')
sha1sums=('ddef3d2da01d0c601efa511c885849bb44934765')
sha256sums=('4534e91f2f00fc1f14451187b1b063f91cd2d4de8867baead07258e7a1561051')

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 README $pkgdir/usr/share/neatroff/README
  cp -a font tmac $pkgdir/usr/share/neatroff
}

