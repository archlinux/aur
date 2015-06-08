pkgname=ttf-roboto-fontconfig
_commit=199ca7fcf1f0606106f8a93d13e42245729f9fcb
pkgver=2.000980
pkgrel=1
pkgdesc='A version of Google’s Roboto font that has fontconfig-compatible metadata'
arch=('any')
url='https://github.com/andreasf/Roboto'
license=('Apache')
provides=('ttf-roboto')
conflicts=('ttf-roboto')
source=("$url/archive/$_commit.tar.gz")
md5sums=('2ffb016cdf382640f4790573b378c69e')

package() {
	cd "$srcdir/Roboto-$_commit"
	_target="$pkgdir/usr/share/fonts/TTF/Roboto"
	install -d "$_target"
	install -m644 *.ttf "$_target"
}