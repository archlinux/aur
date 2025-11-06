pkgname="qoder"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="qoder beta"
arch=("x86_64")
source=("qoder_x86_64.rpm")
sha256sums=("SKIP")
options=('!strip' '!debug')
source=(https://download.qoder.com/release/latest/qoder_x86_64.rpm)

package() {
  cd "$srcdir"
  cp -a --no-preserve=ownership usr "$pkgdir/"
}
