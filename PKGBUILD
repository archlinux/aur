# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fname=reem-kufi
_pname=ReemKufi
pkgbase=$_fname-font
pkgname=(otf-$_fname ttf-$_fname)
pkgver=1.0
pkgrel=1
pkgdesc='A Kufic typeface based on early Kific modeles retrofitted to the Fatimid Kufic grid'
arch=(any)
url="https://github.com/aliftype/$_fname"
license=(AGPL3)
provides=("$pkgbase")
provides=("$pkgbase")
source=("$url/releases/download/v$pkgver/$_pname-$pkgver.zip")
sha256sums=('3b6ff7c96e3488640a7e73a3750c95a491fb07f7ffe3f050f0aab61af3bd084e')

package_otf-reem-kufi() {
	cd "$_pname-$pkgver"
	install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF" *.otf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.txt
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

package_ttf-reem-kufi() {
	cd "$_pname-$pkgver"
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF" ttf/*.ttf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.txt
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}
