# Maintainer: Alexander Chaplin Braz <contact@alexchaplinbraz.com>
pkgname='genrepass-bin'
_pkgname='genrepass'
pkgver=1.1.1
pkgrel=1
pkgdesc='Generate a readable password from an ordered list of words extracted from text'
arch=('x86_64' 'i686')
url='https://github.com/AlexChaplinBraz/genrepass-cli'
license=('MIT')
depends=('libxcb' 'gcc-libs' 'glibc')
conflicts=('genrepass' 'genrepass-git')
source_x86_64=("$url/releases/download/$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("$url/releases/download/$pkgver/$_pkgname-$pkgver-i686-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('')
sha256sums_i686=('')

package() {
	install -Dm644 "$srcdir/$_pkgname-$pkgver-*/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "$srcdir/$_pkgname-$pkgver-*/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
