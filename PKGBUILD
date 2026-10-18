# Maintainer: Gabriel M. Dutra <gabrieldutra@tutanota.com>

_name=dz6
pkgname=dz6-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Fast Vim-inspired TUI hex editor"
arch=('x86_64')
url="https://github.com/mentebinaria/dz6"
license=("GPL-3.0")
source=("https://github.com/mentebinaria/${_name}/releases/download/v${pkgver}/${_name}-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('4d4e1862f90ee787f04e29da5fd48bfd90729f2584fbd8922ee5a41d1c74c528')

package() {
  cd "${srcdir}"
  install -Dm755 ${srcdir}/${_name}-x86_64-unknown-linux-gnu/${_name} ${pkgdir}/usr/bin/${_name}
}

