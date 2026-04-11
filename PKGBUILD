# Maintainer: kobe-koto <k [at] koto [dot] cc>
pkgname=archavenger-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="Archavenger is a simple tool for cleaning up Arch Linux package repositories. (prebuilt binary)"
arch=('x86_64')
url="https://github.com/kobe-koto/archavenger"
license=('AGPL-3.0-only')
depends=(
  'bun'
)
provides=('archavenger')
conflicts=('archavenger')
source=(
  "${pkgname}-${pkgver}.min.js::${url}/releases/download/v${pkgver}/archavenger.min.js"
  )
sha256sums=('ee02f00b661bf4aa6f242115d5e92dbedfc09cba6a95ddbf39bbd7a856c74a24')

package() {
  install -Dm755 "$srcdir/${pkgname}-${pkgver}.min.js" "$pkgdir/usr/bin/archavenger"
}
