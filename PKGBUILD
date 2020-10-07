# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Limao Luo <luolimao+AUR at gmail dot com>

pkgname=xfce-theme-bluebird
_pkgname=Bluebird
pkgver=1.3
pkgrel=1
pkgdesc="A light blue Xfce theme, introduced in the release of Xubuntu 10.10."
arch=(any)
url=https://github.com/shimmerproject/Bluebird
license=(CCPL:by-sa-3.0 GPL)
depends=(gtk-engine-murrine)
optdepends=('elementary-xfce-icons: matching icon set; use the dark icon theme'
    'gtk-engine-unico: required for gtk3 support'
    'shimmer-wallpapers: contains the Bluebird wallpaper, among others')
source=($pkgname-$pkgver.tar.gz::https://github.com/shimmerproject/$_pkgname/archive/v$pkgver.tar.gz)
sha256sums=('b8da767c0ed66e2c0e8c2f78a8c827d8757634179b114a1352590f4e6d0b32c8')

package() {
    install -d "$pkgdir"/usr/share/themes/
    cp -rf $_pkgname-$pkgver/ "$pkgdir"/usr/share/themes/$_pkgname/
    rm "$pkgdir"/usr/share/themes/$_pkgname/.gitignore
}
