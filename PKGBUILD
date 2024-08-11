# Maintainer: Yusuf Aktepe <yusuf@yusufaktepe.com>

pkgname=i3-wallpaper-manager-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Per-workspace wallpaper setter for i3-wm"
arch=(x86_64)
url="https://gitnet.fr/deblan/i3-wallpaper-manager"
license=('GPL')
depends=('i3-wm')
optdepends=( 'feh: default wallpaper setter' )
source=("$url/releases/download/v$pkgver/i3-wallpaper-manager-$pkgver-linux-amd64")
sha256sums=('b0efa7484c63e0ecff8657d2648f74fea01d01a959eb4f1e0a7d5e447db3e8e3')

package() {
	install -vDm755 "i3-wallpaper-manager-$pkgver-linux-amd64" "$pkgdir/usr/bin/i3-wallpaper-manager"
}
