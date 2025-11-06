# Maintainer: Damglador <damglador@gmail.com>

pkgname=dolphin-compress-media
pkgver=1.1.0
pkgrel=1
pkgdesc="Compress media to target size from context menu or cli"
arch=("any")
url="https://github.com/Damglador/dolphin-compress-media"
license=("GPL-3.0")
depends=("dolphin" "kdialog" "ffmpeg" "imagemagick")
provides=("kf6-servicemenus-compress-media")
makedepends=("git")
source=("git+$url.git#tag=${pkgver}")
sha256sums=('7bc91e33215da32a7b42b3d08a5574522371e2c97e430941710d0747a0654e2f')

package() {
    cd "dolphin-compress-media"
    install -Dm755 compress-media           "$pkgdir/usr/bin/compress-media"
    install -Dm755 compress-media.desktop   "$pkgdir/usr/share/kio/servicemenus/compress-media.desktop"
}
