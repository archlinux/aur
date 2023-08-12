# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fname=raqq
pkgbase=$_fname-font
pkgname=ttf-$_fname
pkgver=1.00
pkgrel=1
pkgdesc='A manuscript Kufic typeface'
arch=(any)
url="https://github.com/aliftype/$_fname"
license=(AGPL3)
provides=("$pkgbase")
_archive="${_fname^}-$pkgver"
source=("$url/releases/download/v$pkgver/$_archive.zip")
sha256sums=('f0fa8d53e7c4d02389f1c653ae8a8a22b46074fd2d9c457d23c38991ad6b915b')

package_ttf-raqq() {
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README*.txt
}
