# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: yaa110 <yaa110@gmail.com>

pkgname=nomino-bin
_pkgname="${pkgname%-bin}"
pkgver=1.2.1
pkgrel=1
pkgdesc='Batch rename utility for developers'
arch=('x86_64')
url="https://github.com/yaa110/nomino"
license=('Apache' 'MIT')
depends=('gcc-libs')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('LICENSE')
source_x86_64=("$_pkgname-$pkgver-x86_64::$url/releases/download/$pkgver/$_pkgname-linux-64bit")
sha256sums=('c61849f2f67590dc6e6a865e273accfd56a337ae29bc30c93ecaf50bc7bab77f')
sha256sums_x86_64=('bbbcefb8a8f1ece37c66f20d901725069fcbed8f5e3664467992ae2ec8296bb6')

package() {
	install -D "$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
