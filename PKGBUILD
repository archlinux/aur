# Maintainer: Adrian Zankich <azankich@pivotal.io>
pkgname=kbld-bin
pkgdesc="kbld seamlessly incorporates image building and image pushing into your development and deployment workflows"
pkgver=0.22.0
pkgrel=2
url="https://get-kbld.io/"
arch=('x86_64')
license=('apache')
groups=('k14s-bin')
provides=('kbld')
conflicts=('kbld')
_binary=kbld-linux-amd64
source=("${_binary}-v${pkgver}::https://github.com/k14s/kbld/releases/download/v${pkgver}/${_binary}")
sha256sums=("eb888079b26330e71b855c3f37c8b81fe55125b9a6e26a43e9eeabfd016051d6")

package() {
  install -Dm 755 "${srcdir}/${_binary}-v${pkgver}" "${pkgdir}/usr/bin/kbld"
}
