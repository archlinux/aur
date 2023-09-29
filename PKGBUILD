# Maintainer: Jan-Philipp Fischer <mail at jpfischer dot de>
_name=focus
pkgname=go-$_name-bin
pkgver=1.3.0 # renovate: datasource=github-tags depName=ayoisaiah/focus
pkgrel=1
pkgdesc="Focus is a cross-platform productivity timer for the command line written in Go."
arch=('x86_64')
url="https://github.com/ayoisaiah/$_name"
license=('MIT')
provides=($_name)
conflicts=($_name)
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ayoisaiah/${_name}/releases/download/v${pkgver}/${_name}_${pkgver}_linux_amd64.tar.gz")
b2sums=('b3ecfaeeea99b47686676452a5130dc5fe138728cac791f750179cc8140ca065249ffdd562e061131d4358b688da8ec5b1ee17a558433fa7c6665e6b6966a1f8')

package() {
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
  install -Dm755 "${_name}" "${pkgdir}/usr/bin/${_name}"
}
