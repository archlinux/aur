pkgname=tunl
pkgver=0.17.0
pkgrel=1
pkgdesc='Expose your localhost to the public'
arch=('x86_64')
url="https://github.com/pjvds/tunl"
makedepends=()
source=("$url/releases/download/$pkgver/tunl_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('f4acac3c434045f3440a34dde1f985a08b7922f67eb8dfea3e40abc447fa3f68')

package() {
  install -Dm755 $srcdir/tunl $pkgdir/usr/bin/$pkgname
}
