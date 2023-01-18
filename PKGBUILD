# Maintainer: Cebtenzzre <cebtenzzre (AT) gmail (DOT) com>
# Contributor: onefire <onefire.myself@gmail.com>
pkgname=p99
pkgver=20170629
pkgrel=1
pkgdesc="Preprocessor macros and functions for C99."
arch=('any')
url='https://gustedt.gitlabpages.inria.fr/p99/'
license=('GPL')
makedepends=('git')
_commit=132b203160e20fe6676b3e466c52c45ffd2c31f0
source=("git+https://gitlab.inria.fr/gustedt/${pkgname}.git#commit=${_commit}")
sha512sums=('SKIP')

package() {
  cd "${pkgname}/p99"

  mkdir -p "${pkgdir}"/usr/include/"${pkgname}"
  mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"

  install -m 644 *.h "${pkgdir}"/usr/include/"${pkgname}"

  install -m 644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"
}
