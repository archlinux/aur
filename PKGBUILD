# Maintainer: Colin Woodbury <colin@fosskers.ca>

pkgname=cljfmt-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="A formatter for Clojure code"
arch=('x86_64')
url="https://github.com/weavejester/cljfmt"
license=("EPL-1.0")
provides=("cljfmt")
conflicts=("cljfmt")
source=("https://github.com/weavejester/cljfmt/releases/download/${pkgver}/cljfmt-${pkgver}-linux-amd64-static.tar.gz")
sha256sums=('88eb01fd6b0e47263b2fe91f679ca9aa284d37c30e57bce3de9244799a8c7bde')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
