# Maintainer: Bert Peters <bert@bertptrs.nl>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Yamakaky <yamakaky@yamaworld.fr>

pkgname=rust-src
pkgver=1.37.0
pkgrel=1
pkgdesc='Systems programming language focused on safety, speed and concurrency (source code)'
arch=('any')
url='http://rust-lang.org'
license=('Apache' 'MIT')
options=(!strip)
source=("rust-${pkgver}.tar.gz::https://github.com/rust-lang/rust/archive/${pkgver}.tar.gz")
sha256sums=('6fd0af588b896e369e0a7cba84a54bfb4cd01628a3a9b5fb73dc43c2632e2a8b')

package() {
  cd "rust-${pkgver}"

  install -d -m 755 "${pkgdir}/usr/src/rust/"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE-*

  cp -p -r * "${pkgdir}/usr/src/rust/"
}

# vim: ts=2 sw=2 et:
