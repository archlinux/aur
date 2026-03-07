# Maintainer: kobe-koto <k [at] koto [dot] cc>
pkgname=preaur-bin
pkgver=0.0.4
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
sha256sums=('a84a9cdfe025d1a29e58e57bbff23ee4fea43c02068947c8321aa2b728f9c677')

package() {
  install -Dm755 "$srcdir/${pkgname}-${pkgver}.min.js" "$pkgdir/usr/bin/preaur"
}
