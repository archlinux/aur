# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>
pkgname=albafetch-bin
pkgver=4.1
pkgrel=1
pkgdesc="Neofetch, but written in C; both faster and worse than the original (binary build)"
arch=(x86_64 aarch64)
url="https://github.com/alba4k/albafetch"
license=('MIT')
depends_x86_64=(pciutils libcurl-gnutls)
depends_aarch64=()
conflicts=(albafetch-git albafetch)
source_x86_64=("$url/releases/download/v$pkgver/albafetch-linux-x64.zip")
source_aarch64=("$url/releases/download/v$pkgver/albafetch-linux-aarch64-static.zip")

md5sums_x86_64=('b8ca2c656384fdd05e79bbbe5fffcbcb')
md5sums_aarch64=('cce874f24a56f222a9509b0fdeed975f')

package() {
    mkdir -p "$pkgdir/usr/bin/"
    install -Dm 755 "$srcdir/albafetch" "$pkgdir/usr/bin/albafetch"
}

