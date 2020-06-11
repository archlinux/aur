# Maintainer: Adrian Zankich <azankich@pivotal.io>
pkgname=ytt-bin
pkgdesc="ytt is a templating tool that understands YAML structure allowing you to focus on your data instead of how to properly escape it"
pkgver=0.28.0
pkgrel=1
url="https://get-ytt.io/"
arch=('x86_64')
license=('apache')
groups=('k14s-bin')
provides=('ytt')
conflicts=('ytt')
_binary=ytt-linux-amd64
source=("${_binary}-v${pkgver}::https://github.com/k14s/ytt/releases/download/v${pkgver}/${_binary}")
sha256sums=("52c36853999a378f21f9cf93a443e4d0e405965c3b7d2b8e499ed5fd8d6873ab")

package() {
  install -Dm 755 "${srcdir}/${_binary}-v${pkgver}" "${pkgdir}/usr/bin/ytt"
}
