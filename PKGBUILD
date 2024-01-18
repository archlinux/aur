# Maintainer: Andrew O'Neill <andrew at haunted dot sh>

_pkgname=mini
pkgname=cpp-${_pkgname}
pkgver=0.9.15
pkgrel=1
pkgdesc="Tiny, header only C++ library for manipulating INI files."
arch=('any')
license=('MIT')
conflicts=('mini-git')
url="https://github.com/metayeti/mINI"
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('241e105ab074827ab8b40582aa7b04c6191f84b244603969965c0874ad4f942c')

package() {
  cd "mINI-${pkgver}"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m644 src/mini/ini.h "${pkgdir}/usr/include/mini/ini.h"
}
