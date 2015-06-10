# Maintainer: Francois Boulogne <fboulogne at april dot org>
# Contributor: Josip <josipponjavic at gmail dot com>

pkgname=gtk-theme-dark-linux
pkgver=0.7
pkgrel=1
pkgdesc="Improved gnome theme from my earlier no-name-jet version theme..."
arch=("any")
url="http://metak.deviantart.com/art/Dark-linux-0-6-150406617"
license=("GPL")
depends=()
replaces=("dark-linux")

source=(http://www.deviantart.com/download/150406617/Dark_linux_0_7_by_metak.zip)
md5sums=('719b0d95ddb9415a4a9919f759609b20')

build() {
	mkdir -p $pkgdir/usr/share/themes/
    mkdir -p $pkgdir/usr/share/emerald/themes/
	cd $srcdir/
	cp -r "Dark-linux-0.7" "$pkgdir/usr/share/themes"
	cp -r "$srcdir/Dark-linux-0.7" "$pkgdir/usr/share/emerald/themes/"
}

