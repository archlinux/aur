# Maintainer: Adrian Zankich <azankich@pivotal.io>
pkgname=ytt-bin
pkgdesc="ytt is a templating tool that understands YAML structure allowing you to focus on your data instead of how to properly escape it"
pkgver=0.27.1
pkgrel=1
url="https://get-ytt.io/"
arch=('x86_64')
license=('apache')
groups=('k14s-bin')
_binary=ytt-linux-amd64
source=("${_binary}-v${pkgver}::https://github.com/k14s/ytt/releases/download/v${pkgver}/${_binary}")
sha256sums=("b53674a21d99576b8d69483113e1ec73d9a3ed7381170a421c9afcf8aa551f15")

package() {
  install -Dm 755 "${srcdir}/${_binary}-v${pkgver}" "${pkgdir}/usr/bin/ytt"
}
