# Maintainer: kobe-koto <k [at] koto [dot] cc>
pkgname=archavenger-bin
pkgver=0.0.2
pkgrel=1
pkgdesc="Archavenger is a simple tool for cleaning up Arch Linux package repositories. (prebuilt binary)"
arch=('x86_64')
url="https://github.com/kobe-koto/archavenger"
license=('MIT')
depends=(
  'bun'
)
provides=('archavenger')
conflicts=('archavenger')
source=(
  "${pkgname}-${pkgver}.min.js::${url}/releases/download/v${pkgver}/archavenger.min.js"
  )
sha256sums=('e1aa80ad920c74b3801d12076ed3b840278dafffb343fe260498b57e2aa23a70')

package() {
  install -Dm755 "$srcdir/${pkgname}-${pkgver}.min.js" "$pkgdir/usr/bin/archavenger"
}
