# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=subuid-register
pkgver=1.0
pkgrel=1
pkgdesc="A simple tool to let user to register subuid / subgid range."
url="https://github.com/adrien1018/subuid-register"
arch=('i686' 'x86_64')
provides=('subuid-register')
source=('Makefile' 'subuid-register.cpp')
sha256sums=(
  'e55c8d5f1a8948aa4535042a1db2e67938cc99d37619305a0254a45fdddd89a5'
  '48ba9e0a504631e83339bc4873771b34388ae829f6bff235e2bb6fc3b6c2d919'
)

build() {
  cd "$srcdir"
  make
}

package() {
  install -D -m4755 "${srcdir}/subuid-register" "${pkgdir}/usr/bin/subuid-register"
}
