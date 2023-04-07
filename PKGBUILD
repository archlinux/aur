# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>
pkgname=albafetch
pkgver=4.0
pkgrel=1
pkgdesc="Neofetch, but written in C; both faster and worse than the original"
arch=(x86_64 aarch64)
url="https://github.com/alba4k/albafetch"
license=('MIT')
depends_x86_64=(pciutils libcurl-gnutls)
depends_aarch64=()
conflicts=(albafetch-git)
source_x86_64=("https://github.com/alba4k/albafetch/releases/download/v$pkgver/albafetch-linux-x64-dynamic.zip")
source_aarch64=("https://github.com/alba4k/albafetch/releases/download/v4$pkgver/albafetch-linux-aarch64-static.zip")
md5sums_x86_64=('SKIP')
md5sums_aarch64=('SKIP')

package() {
    mkdir -p "$pkgdir/usr/bin/"
    install -Dm 755 "$srcdir/albafetch" "$pkgdir/usr/bin/albafetch"
}

