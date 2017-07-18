# Maintainer: Bryn Edwards <bryn@protonmail.ch>

pkgname=antibody
pkgver=3.1.3
pkgrel=1
pkgdesc="A faster and simpler antigen written in Golang."
arch=('i686' 'x86_64')
url="http://getantibody.github.io/"
license=('MIT')
depends=('zsh')
source_x86_64=("https://github.com/get$pkgname/$pkgname/releases/download/v$pkgver/${pkgname}_Linux_x86_64.tar.gz")
source_i686=("https://github.com/get$pkgname/$pkgname/releases/download/v$pkgver/${pkgname}_Linux_i386.tar.gz")
sha256sums_i686=('6e6e784596a53369d3c41ba96976f6d8a51b896e7c22ed9cd9f9e46a02cf95a6')
sha256sums_x86_64=('98e184d5d09d3b591b4417962e6a719b1b0d3487d5d6e80114266c9ee346b321')

package() {
	  cd "$srcdir/"

	  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
	  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
