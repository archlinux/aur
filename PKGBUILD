# Maintainer: Damglador <damglador@gmail.com>

pkgname=dolphin-compress-media
pkgver=1.2.1
pkgrel=1
pkgdesc="Compress media to target size from context menu or cli"
arch=("any")
url="https://github.com/Damglador/dolphin-compress-media"
license=("GPL-3.0")
depends=("dolphin" "kdialog" "ffmpeg" "imagemagick")
provides=("kf6-servicemenus-compress-media")
makedepends=("git")
source=("git+$url.git#tag=${pkgver}")
sha256sums=('49999a660307da59b1c2c83cf09734f49f3b75e9a93fde54887e5f386999d670')

package() {
    cd "dolphin-compress-media"
    install -Dm755 compress-media           "$pkgdir/usr/bin/compress-media"
    install -Dm755 compress-media.desktop   "$pkgdir/usr/share/kio/servicemenus/compress-media.desktop"
}
