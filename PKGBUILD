# Maintainer: Yusuf Aktepe <yusuf@yusufaktepe.com>

pkgname=i3-wallpaper-manager-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Per-workspace wallpaper setter for i3-wm"
arch=(x86_64)
url="https://gitnet.fr/deblan/i3-wallpaper-manager"
license=('GPL')
depends=('i3-wm')
optdepends=( 'feh: default wallpaper setter' )
source=("$url/releases/download/v$pkgver/i3-wallpaper-manager-$pkgver-linux-amd64")
sha256sums=('0d6b83426c4eb48fb7eac4078549e42088825d095fa6712ce40920d211ba897e')

package() {
	install -vDm755 "i3-wallpaper-manager-$pkgver-linux-amd64" "$pkgdir/usr/bin/i3-wallpaper-manager"
}
