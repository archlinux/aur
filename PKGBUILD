# Maintainer: taotieren <admin@taotieren.com>

pkgname=metaphyuni-wallpapers
pkgver=0.0.2
pkgrel=1
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/taotieren/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('62c1e8943080696885e6888ab0c44beebdd7184c2763a82d1d72b9096140ab62')

package() {
    cd ${pkgname}-${pkgver}
    install -Dm644 -t "$pkgdir/usr/share/backgrounds/metaphyuni/" metaphyuni.stw wallpaper/*
    install -Dm644 -t "$pkgdir/usr/share/gnome-background-properties/" metaphyuni-backgrounds.xml
}
