# Maintainer: Bert Peters <bert@bertptrs.nl>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Yamakaky <yamakaky@yamaworld.fr>

pkgname=rust-src
pkgver=1.39.0
pkgrel=1
pkgdesc='Systems programming language focused on safety, speed and concurrency (source code)'
arch=('any')
url='http://rust-lang.org'
license=('Apache' 'MIT')
options=(!strip)
source=("rust-${pkgver}.tar.gz::https://github.com/rust-lang/rust/archive/${pkgver}.tar.gz")
sha256sums=('c2261f54f4b9e038712fd11f72f6583c12243f60fd9d2832eb6272ce8d804a5e')

package() {
  cd "rust-${pkgver}"

  install -d -m 755 "${pkgdir}/usr/src/rust/"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE-*

  cp -p -r * "${pkgdir}/usr/src/rust/"
}

# vim: ts=2 sw=2 et:
