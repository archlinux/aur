# Maintainer: Damglador <damglador@gmail.com>

pkgname=dolphin-compress-media
pkgver=1.2.0
pkgrel=1
pkgdesc="Compress media to target size from context menu or cli"
arch=("any")
url="https://github.com/Damglador/dolphin-compress-media"
license=("GPL-3.0")
depends=("dolphin" "kdialog" "ffmpeg" "imagemagick")
provides=("kf6-servicemenus-compress-media")
makedepends=("git")
source=("git+$url.git#tag=${pkgver}")
sha256sums=('6d89ec4a8dfb8c91aff2824a00e1cbc01642afa65f06296034e502f47129e561')

package() {
    cd "dolphin-compress-media"
    install -Dm755 compress-media           "$pkgdir/usr/bin/compress-media"
    install -Dm755 compress-media.desktop   "$pkgdir/usr/share/kio/servicemenus/compress-media.desktop"
}
