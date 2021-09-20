# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname1=mohave
_pkgname2=mohave-dark
pkgname=plank-theme-mohave
pkgver=1.0.1
pkgrel=1
pkgdesc='Mohave Theme for Plank'
arch=(any)
url='https://www.gnome-look.org/p/1315686'
_url="https://github.com/MMcQueenGNU"
license=('cc-by-sa')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('cfdc48be3abb93427535a9eabeb2fb7c6546722195efe99ab0abcbfc9a485104')

build() {
	true
}

package() {
	
	mkdir -p $pkgdir/usr/share/plank/themes/$_pkgname1
	cd "$srcdir/$pkgname-$pkgver/$_pkgname1"
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/$_pkgname1
	mkdir -p $pkgdir/usr/share/plank/themes/$_pkgname2
	cd "$srcdir/$pkgname-$pkgver/$_pkgname2"
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/$_pkgname2

}
