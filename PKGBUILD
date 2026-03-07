# Maintainer: kobe-koto <k [at] koto [dot] cc>
pkgname=preaur-bin
pkgver=0.0.3
pkgrel=1
pkgdesc="PreAUR, build AUR (not only) pkgbuilds ahead of time. (prebuilt binary)"
arch=('x86_64')
url="https://github.com/kobe-koto/preaur"
license=('AGPL-3.0-only')
depends=(
  'bun'
  'git'
  'devtools'
  'base-devel'
)
provides=('preaur')
conflicts=('preaur')
source=(
  "${pkgname}-${pkgver}.min.js::${url}/releases/download/v${pkgver}/preaur.min.js"
  )
sha256sums=('df589367b59563e0f5e119c86e19f0429c588fbf6b388db98053fe41ac153470')

package() {
  install -Dm755 "$srcdir/${pkgname}-${pkgver}.min.js" "$pkgdir/usr/bin/preaur"
}
