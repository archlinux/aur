# Maintainer: Adrian Zankich <azankich@pivotal.io>
pkgname=kapp-bin
pkgdesc="kapp is a simple deployment tool focused on the concept of 'Kubernetes application' — a set of resources with the same label"
pkgver=0.29.0
pkgrel=1
url="https://get-kapp.io/"
arch=('x86_64')
license=('apache')
groups=('k14s-bin')
provides=('kapp')
conflicts=('kapp')
_binary=kapp-linux-amd64
source=("${_binary}-v${pkgver}::https://github.com/k14s/kapp/releases/download/v${pkgver}/${_binary}")
sha256sums=("24b235f9929c7ce700b53682264793c3f977dc6475e4d9c8566419400cf6cb27")

package() {
  install -Dm 755 "${srcdir}/${_binary}-v${pkgver}" "${pkgdir}/usr/bin/kapp"
}
