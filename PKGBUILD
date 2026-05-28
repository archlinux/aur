# Maintainer: Augustin Gjini <augustin.gjini@gmail.com>

pkgname=comtrya-bin
_pkgname=comtrya

pkgver=0.9.2
pkgrel=1
pkgdesc="Configuration Management for Localhost / dotfiles (precompiled binary)"
arch=('x86_64')
url="https://github.com/comtrya/comtrya-dotfiles"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

_asset="comtrya-x86_64-unknown-linux-gnu"

source_x86_64=("${_asset}-${pkgver}::${url}/releases/download/v${pkgver}/${_asset}")
sha256sums_x86_64=('95a62e3e3c15c9a38488d56766649a9e490762d7da9aab2761b7ecdd5c21c84c')

package() {
    install -Dm755 "${srcdir}/${_asset}-${pkgver}" "${pkgdir}/usr/bin/comtrya"
}
