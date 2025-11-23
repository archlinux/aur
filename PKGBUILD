# Maintainer: Colin Woodbury <colin@fosskers.ca>

pkgname=cljfmt-bin
pkgver=0.15.6
pkgrel=1
pkgdesc="A formatter for Clojure code"
arch=('x86_64')
url="https://github.com/weavejester/cljfmt"
license=("EPL-1.0")
provides=("cljfmt")
conflicts=("cljfmt")
source=("https://github.com/weavejester/cljfmt/releases/download/${pkgver}/cljfmt-${pkgver}-linux-amd64-static.tar.gz")
sha256sums=('168a898d87211cd1c0c60dbb403b93a3846622daacc78066ec6fb99df101b4af')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
