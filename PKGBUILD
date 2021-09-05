# Maintainer: Leon Schumacher <leonsch@protonmail.com>
# vim: ft=sh:
pkgname=arch-package-download
pkgver=1
pkgrel=1
pkgdesc="Download a package using your pacman configuration "
arch=('any')
url="https://github.com/42LoCo42/arch-package-download"
license=('AGPL')
depends=('bash' 'curl')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ddbfbf62447ccb66c4c3665fc960e72f24d887f76da5b910b37550b43409ba86')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
