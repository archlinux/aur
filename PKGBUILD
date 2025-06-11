# Maintainer: Felix Schindler <aut at felixschindler dot net>

pkgname=syncthing-resolve-conflicts
pkgver=1.2.0
pkgrel=0
pkgdesc="A tool to handles synchronization conflicts that necessarily pop up when using Syncthing, inspired by pacdiff."
arch=('x86_64')
url=""
license=('GPL-3')
depends=('bash')
source=("https://github.com/dschrempf/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f4e3b54297ff0a647b64d0d34618e8ac60ce1ffe412a4a3f4cb300d9dbab6598')

build() {
  echo "There is nothing to build"
}

package() {
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
