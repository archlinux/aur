# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=python-mojimoji
_pkgname=mojimoji
pkgver=0.0.5
pkgrel=1
pkgdesc="A lightweight converter between hankaku(half-width) and zenkaku(full-width) characters"
url="https://github.com/studio-ousia/mojimoji"
arch=('x86_64' 'i686')
license=('Apache')
depends=('python')
source=("https://github.com/studio-ousia/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('9f8deef6b0b82e5376f3c10e5cef39ae4ea2e25b34ad436edecc01939075de95f51c63f3377e55c2e8f079e18d3e4a68e4f2487178f54374429fc41452334563')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}/
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}/
  python setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
