#!/usr/bin/env bash
# https://wiki.archlinux.org/index.php?title=Go_package_guidelines&oldid=564399#Sample_PKGBUILDs

# Maintainer: Kenta Yamamoto <ymkjp@jaist.ac.jp>
pkgname=altogether
pkgver=0.1.2
pkgrel=1
epoch=
pkgdesc="A CLI tool to synchronize configuration files between Alfred and Albert"
arch=('x86_64')
url="https://github.com/announce/${pkgname}"
license=('APACHE')
groups=()
depends=()
depends=('glibc>=2.28')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${url}/releases/download/v${pkgver}/linux-amd64.tar.gz")
noextract=()
sha256sums=("b01cd2704f2c86336c70c99105de9752d00e9545af76b0aa4654e33bceafa087")
validpgpkeys=()

package() {
	cd "${srcdir}/linux-amd64"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
