# Maintainer: Fernando Vasquez <fmorataya.04@gmail.com>

pkgname=shopify-ejson2env-bin
pkgver=2.0.5
pkgrel=2
pkgdesc="Shopify's ejson2env is a tool to simplify storing secrets that should be accessible in the shell environment in your git repo."
arch=('x86_64')
url="https://github.com/Shopify/ejson2env/"
license=('MIT')
source=(
	"ejson2env_${pkgver}_linux_amd64.tar.gz::${url}releases/download/v${pkgver}/ejson2env_${pkgver}_linux_amd64.tar.gz"
)
sha256sums=('777f28023c5dd7bbb22827cb851d3c43c1f3fe0c2677f7d90521bea13596f971')

package() {
  cd "${srcdir}"
  install -Dm755 "ejson2env" "$pkgdir/usr/bin/ejson2env"
}
