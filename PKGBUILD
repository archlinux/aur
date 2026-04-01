# Maintainer: Gabriel M. Dutra <gabrieldutra@tutanota.com>

_name=dz6
pkgname=dz6-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Fast Vim-inspired TUI hex editor"
arch=('x86_64')
url="https://github.com/mentebinaria/dz6"
license=("GPL-3.0")
source=("https://github.com/mentebinaria/${_name}/releases/download/v${pkgver}/${_name}-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('6ee1b16cdf5ee4429ae70ccfd1681c5856ba0b7a9934efdd0dfe665d07dd316e')

package() {
  cd "${srcdir}"
  install -Dm755 ${srcdir}/${_name}-x86_64-unknown-linux-gnu/${_name} ${pkgdir}/usr/bin/${_name}
}

