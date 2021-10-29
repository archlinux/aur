# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=octofetch-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="GitHub stats fetch tool"
arch=('x86_64')
url="https://github.com/azur1s/octofetch"
license=('unknown')
depends=('gcc-libs' 'openssl')
source_x86_64=("$pkgname-$pkgver::$url/releases/download/$pkgver/octofetch")
sha256sums_x86_64=('b49ba8b2dedebd2375e7d7c8f3b78526e3a0895f5dc92ea70d523fd9a9fc7ef6')

package() {
	install -D "$pkgname-$pkgver" "$pkgdir/usr/bin/octofetch"
}
