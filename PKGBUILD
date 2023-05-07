# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
pkgname=feroxbuster-bin
pkgver=2.10.0
pkgrel=1
pkgdesc="A fast, simple, recursive content discovery tool written in Rust"
url="https://github.com/epi052/feroxbuster"
license=("MIT")
arch=("x86_64")
depends=()
provides=("feroxbuster")
conflicts=("feroxbuster" "feroxbuster-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/epi052/feroxbuster/releases/download/v$pkgver/x86_64-linux-feroxbuster.tar.gz")
b2sums=('3374284d7cbc3792c77835679bb8ccc9390dbc724998e79bbfed8fe3f0f95aa3b8ce399a1dbfb64c8d76be3db553d3668fd82c6acd7c9ddd30672a6923eb7504')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/feroxbuster"
}
