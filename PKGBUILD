# Maintainer: Adrian Zankich <azankich@pivotal.io>
pkgname=kbld-bin
pkgdesc="kbld seamlessly incorporates image building and image pushing into your development and deployment workflows"
pkgver=0.21.0
pkgrel=1
url="https://get-kbld.io/"
arch=('x86_64')
license=('apache')
groups=('k14s-bin')
_binary=kbld-linux-amd64
source=("${_binary}-v${pkgver}::https://github.com/k14s/kbld/releases/download/v${pkgver}/${_binary}")
sha256sums=("618f7e97389d75ae65c73cdad7a068d1f5b22e296042992c8498d0e16e727f78")

package() {
  install -Dm 755 "${srcdir}/${_binary}-v${pkgver}" "${pkgdir}/usr/bin/kbld"
}
