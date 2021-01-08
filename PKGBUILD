# Maintainer: Antonio Tauro <eye at eyenx.ch>
pkgname=whalebrew
pkgver=0.3.0
pkgrel=1
pkgdesc="Homebrew, but with Docker images"
arch=('x86_64')
url="https://github.com/bfirsh/whalebrew"
license=('Apache License 2.0')
provides=('whalebrew')
depends=('docker')
conflicts=('whalebrew')
source=("https://github.com/bfirsh/whalebrew/releases/download/${pkgver}/whalebrew-Linux-x86_64")
sha256sums=('aa201e450cab16fb7b12dbbcdc34394fa7281752095f706935b033a1d74b8880')

package() {
  install -D -m755 "$srcdir"/whalebrew-Linux-x86_64 "$pkgdir/usr/bin/whalebrew"
}
