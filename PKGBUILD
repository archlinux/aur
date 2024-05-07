# Maintainer: taotieren <admin@taotieren.com>

pkgname=metaphyuni-wallpapers
pkgver=0.0.1
pkgrel=0
pkgdesc="metaphyuni-wallpapers (玄派壁纸)"
arch=(any)
url="https://metaphyuni.com/pc/wallpaper"
license=('unknow')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=()
makedepends=()
optdepends=('wallutils: support the simple timed wallpaper format')
backup=()
options=()
install=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/taotieren/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8f5e00db4c416ea085d4f8ee68c17460f472ba25e6efaa6e29cbc5841066a159')

package() {
    cd ${pkgname}-${pkgver}
    install -Dm644 -t "$pkgdir/usr/share/backgrounds/metaphyuni/" metaphyuni.stw wallpaper/*
    install -Dm644 -t "$pkgdir/usr/share/gnome-background-properties/" metaphyuni-backgrounds.xml
}
