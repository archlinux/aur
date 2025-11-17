# Maintainer: Colin Woodbury <colin@fosskers.ca>

pkgname=cljfmt-bin
pkgver=0.15.5
pkgrel=1
pkgdesc="A formatter for Clojure code"
arch=('x86_64')
url="https://github.com/weavejester/cljfmt"
license=("EPL-1.0")
provides=("cljfmt")
conflicts=("cljfmt")
source=("https://github.com/weavejester/cljfmt/releases/download/${pkgver}/cljfmt-${pkgver}-linux-amd64-static.tar.gz")
sha256sums=('b3dcd6e8ef319517cd2a9e4149d16a9a1b432fd7a49c4fcaecf6617f82181639')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
