# Maintainer: Adrian Zankich <azankich@pivotal.io>
pkgname=kapp-bin
pkgdesc="kapp is a simple deployment tool focused on the concept of 'Kubernetes application' — a set of resources with the same label"
pkgver=0.26.0
pkgrel=1
url="https://get-kapp.io/"
arch=('x86_64')
license=('apache')
groups=('k14s-bin')
_binary=kapp-linux-amd64
source=("${_binary}-v${pkgver}::https://github.com/k14s/kapp/releases/download/v${pkgver}/${_binary}")
sha256sums=("7c4d525b02e0241dab13fd729735875ea2b15e2f504bd94d1480edd3072ccf96")

package() {
  install -Dm 755 "${srcdir}/${_binary}-v${pkgver}" "${pkgdir}/usr/bin/kapp"
}
