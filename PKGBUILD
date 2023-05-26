# Maintainer: Caleb Maclennan <caleb@alerque.com>

# https://github.com/tokotype/PlusJakartaSans/issues/33

_name=plus-jakarta-sans
_proj=PlusJakartaSans
pkgbase=$_name-font
pkgname=(ttf-$_name ttf-$_name-variable)
pkgver=2.7.1
pkgrel=1
pkgdesc='an open-source font designed for Jakarta "City of collaboration" program in 2020'
arch=(any)
url="https://github.com/tokotype/$_proj"
license=(OFL)
_archive="$_proj-$pkgver"
source=("$url/releases/download/$pkgver/$_archive.zip")
sha256sums=('5bb7df5de8a0cbdd6950066080c28e2f2acf9091b6cdd77c644a2ca011c06079')

package_ttf-plus-jakarta-sans() {
	provides=("$pkgbase")
	cd "$_archive"
	# install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" ttf/*.ttf
}

package_ttf-plus-jakarta-sans-variable() {
	provides=("$pkgbase-variable")
	cd "$_archive"
	# install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" variable/*.ttf
}
