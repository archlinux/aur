# Maintainer: Damglador <damglador@gmail.com>

pkgname=dolphin-compress-media
pkgver=1.0.0
pkgrel=1
pkgdesc="Compress media to target size from context menu or cli"
arch=("any")
url="https://github.com/Damglador/dolphin-compress-media"
license=("GPL-3.0")
depends=("dolphin" "kdialog" "ffmpeg" "imagemagick")
provides=("kf6-servicemenus-compress-media")
makedepends=("git")
source=("git+$url.git#tag=${pkgver}")
sha256sums=('c8c46ca8ae9aa9b87a362f271a4745256fe58cf6fac8cb437fa86a41616e33fe')

package() {
    cd "dolphin-compress-media"
    install -Dm755 compress-media           "$pkgdir/usr/bin/compress-media"
    install -Dm755 compress-media.desktop   "$pkgdir/usr/share/kio/servicemenus/compress-media.desktop"
}
