# Maintainer: kobe-koto <k [at] koto [dot] cc>
pkgname=archavenger-bin
pkgver=0.0.3
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
sha256sums=('7117bea540206f0377f8de3301e3af9544630de9569dff5ba414d1a2afa7138f')

package() {
  install -Dm755 "$srcdir/${pkgname}-${pkgver}.min.js" "$pkgdir/usr/bin/archavenger"
}
