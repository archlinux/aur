# Maintainer: Leon Schumacher <leonsch@protonmail.com>
# vim: ft=sh:
pkgname=arch-package-download
pkgver=2
pkgrel=1
pkgdesc="Download a package using your pacman configuration "
arch=('any')
url="https://github.com/42LoCo42/arch-package-download"
license=('AGPL')
depends=('bash' 'curl')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('af36f2c5ea98bccbb04147a4edad4d1778b69a16e66d19b6dac68fc6ded15c4a')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
