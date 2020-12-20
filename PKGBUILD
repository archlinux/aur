# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

_name=distribution
pkgname="python-${_name}"
pkgver=1.3
pkgrel=2
pkgdesc='Short, simple, direct scripts for creating ASCII graphical histograms in the terminal'
url='https://github.com/wizzat/distribution'
arch=('any')
license=('GPL2')
depends=('python')
provides=("${_name}=${pkgver}")
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('d7f2c9beeee15986d24d8068eb132c0a63c0bd9ace932e724cb38c1e6e54f95d')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  install -Dm 775 "${_name}.py" "${pkgdir}/usr/bin/${_name}"
  install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
