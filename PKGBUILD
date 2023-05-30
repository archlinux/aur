# Maintainer: Fernando Vasquez <fmorataya.04@gmail.com>

pkgname=shopify-ejson-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Shopify's ejson is a utility for managing a collection of secrets in source control."
arch=('x86_64')
url="https://github.com/Shopify/ejson/"
license=('MIT')
source=(
	"ejson_${pkgver}_linux_amd64.tar.gz::${url}releases/download/v${pkgver}/ejson_${pkgver}_linux_amd64.tar.gz"
)
sha256sums=('0aef9295c79d280a954460e5057c24ce0a567faaef9fcdf18051b821e48d99a9')

package() {
  cd "${srcdir}"
  install -Dm755 "ejson" "$pkgdir/usr/bin/ejson"
}
