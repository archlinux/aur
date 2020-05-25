# Maintainer: Sudhip Nashi <sudhip at nashi dot us>
pkgname=peacock
pkgver=2.3.5
pkgrel=1
epoch=
pkgdesc="Open source experimental private-by-default web browser."
arch=('any')
url="https://github.com/peacockweb/peacock"
license=('OSL 3.0')
groups=()
depends=('electron')
source=("https://github.com/peacockweb/peacock/releases/download/v"$pkgver"/"$pkgname"_"$pkgver"_amd64.deb")
noextract=('$pkgname_$pkgver_amd64.deb')
md5sums=('31f82ad8a0d978949402cae678607b6d')

package() {
	ar -xvf "$pkgname"_"$pkgver"_amd64.deb
	tar -xvf "$srcdir"/data.tar.xz -C "$pkgdir"
}
