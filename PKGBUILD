# Maintainer: msh356 <msh356@yandex.by>
pkgname=pingvin320kg
pkgver=0.1
pkgrel=1
pkgdesc="Wallpapers with a 320kg penguin"
arch=('x86_64')
url="https://t.me/+5717pL3Od2wzNTIy"
license=('GPL')
depends=()
source=(
    "https://www.dropbox.com/scl/fi/a582b8zck7mog2t5sd5o5/wallpaper.jpg?rlkey=qbme6ndet2u54vec3dlnxesql&st=rfamzyhf&dl=1"
)
sha256sums=('0ef90e4954fae1af579aab5370cdb473ed2b7943454d4dba4c7f8dcd4d212d9d')
package() {
    install -Dm644 'wallpaper.jpg?rlkey=qbme6ndet2u54vec3dlnxesql&st=rfamzyhf&dl=1' "$pkgdir/usr/share/wallpapers/pingvin320kg.jpg"
}
