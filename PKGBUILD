# Maintainer: Colin Woodbury <colin@fosskers.ca>

pkgname=cljfmt-bin
pkgver=0.13.4
pkgrel=1
pkgdesc="A formatter for Clojure code"
arch=('x86_64')
url="https://github.com/weavejester/cljfmt"
license=("EPL-1.0")
provides=("cljfmt")
conflicts=("cljfmt")
source=("https://github.com/weavejester/cljfmt/releases/download/${pkgver}/cljfmt-${pkgver}-linux-amd64-static.tar.gz")
sha256sums=('ec6734af06a253f70c64482e7f6d944623308467d1a6bd1d10370dd9fff2f55b')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
