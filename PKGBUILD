# Maintainer: Adrian Zankich <azankich@pivotal.io>
pkgname=kapp-bin
pkgdesc="kapp is a simple deployment tool focused on the concept of 'Kubernetes application' — a set of resources with the same label"
pkgver=0.30.0
pkgrel=1
url="https://get-kapp.io/"
arch=('x86_64')
license=('apache')
groups=('k14s-bin')
provides=('kapp')
conflicts=('kapp')
_binary=kapp-linux-amd64
source=("${_binary}-v${pkgver}::https://github.com/k14s/kapp/releases/download/v${pkgver}/${_binary}")
sha256sums=("031020e3cd83883900695959f067d8afc64369c09d127a0ed34eeee3e264e422")

package() {
  install -Dm 755 "${srcdir}/${_binary}-v${pkgver}" "${pkgdir}/usr/bin/kapp"
}
