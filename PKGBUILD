# Maintainer: Adrian Zankich <azankich@pivotal.io>
pkgname=ytt-bin
pkgdesc="ytt is a templating tool that understands YAML structure allowing you to focus on your data instead of how to properly escape it"
pkgver=0.27.2
pkgrel=1
url="https://get-ytt.io/"
arch=('x86_64')
license=('apache')
groups=('k14s-bin')
provides=('ytt')
conflicts=('ytt')
_binary=ytt-linux-amd64
source=("${_binary}-v${pkgver}::https://github.com/k14s/ytt/releases/download/v${pkgver}/${_binary}")
sha256sums=("64bcc36df4270e3413fd26b68683a353089c3b15c411904307e93c12f80556ab")

package() {
  install -Dm 755 "${srcdir}/${_binary}-v${pkgver}" "${pkgdir}/usr/bin/ytt"
}
