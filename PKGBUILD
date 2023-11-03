# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=montagu-slab
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name ttf-$_name-variable)
pkgver=1.000
_pkgver=1.0.0
pkgrel=1
pkgdesc='a slab-serif display typeface by Florian Karsten inspired by from 19th-century classic designs with weight and optical size axis'
arch=(any)
url="https://github.com/floriankarsten/$_name"
license=(OFL)
_archive="MontaguSlab-$_pkgver"
source=("https://github.com/floriankarsten/montagu-slab/releases/download/$_pkgver/$_archive.zip")
sha256sums=('10f5a002dda88518d7394aebcbb8a5f62d73c6bfeca517fab266ebc729bba5e4')

package_otf-montagu-slab() {
	cd "$_archive"
	provides=("$pkgbase")
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" otf/*.otf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

package_ttf-montagu-slab() {
	cd "$_archive"
	provides=("$pkgbase")
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" ttf/*.ttf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

package_ttf-montagu-slab-variable() {
	cd "$_archive"
	provides=("$pkgbase")
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" ttf-variable/*.ttf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}
