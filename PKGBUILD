# Maintainer: Colin Woodbury <colin@fosskers.ca>

pkgname=cljfmt-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="A formatter for Clojure code"
arch=('x86_64')
url="https://github.com/weavejester/cljfmt"
license=("EPL-1.0")
provides=("cljfmt")
conflicts=("cljfmt")
source=("https://github.com/weavejester/cljfmt/releases/download/${pkgver}/cljfmt-${pkgver}-linux-amd64-static.tar.gz")
sha256sums=('296049162f0c203ccd6fbb86f4967561e5876662642fddc566a6ed8bbf2cd03e')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
