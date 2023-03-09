# Maintainer: Max Strübing <mxstrbng@gmail.com>
pkgname=dotenv-linter-bin
pkgver=v3.3.0
pkgrel=1
pkgdesc="Linter for .env files. Written in Rust"
arch=('x86_64')
url="https://github.com/dotenv-linter/dotenv-linter"
license=('MIT')
provides=('dotenv-linter')
conflicts=('dotenv-linter-git')
makedepends=('curl')
md5sums=('SKIP')

source=("https://github.com/dotenv-linter/dotenv-linter/releases/download/${pkgver}/dotenv-linter-linux-x86_64.tar.gz")

package() {
  # Extract binary
  tar xzf dotenv-linter-linux-x86_64.tar.gz
  # Install binary
  install -Dm 755 "dotenv-linter" "${pkgdir}/usr/bin/dotenv-linter"
}
