# Maintainer: tee < teeaur at duck dot com >
pkgname=eidos-lite-bin
pkgver=0.23.1
pkgrel=1
pkgdesc="A single-file relational spreadsheet for you and your agent, built on standard SQLite"
arch=(x86_64)
url="https://eidos.space"
license=('AGPL-3.0-or-later')
depends=('glib2' 'cairo' 'gtk3' 'hicolor-icon-theme')
_src="https://github.com/mayneyao/eidos"
source=("$_src/releases/download/lite-v$pkgver/Eidos.Lite-$pkgver-linux-amd64.deb")
b2sums=('a6abd477f362a5eccc4fd2e156f920f9318a3cd615a8b1947359abe0fb2682eab4190f8e741083c49e82ef9844f69bfba592717d378958e5d3909cc02df09cb4')

package(){
	cd "$pkgdir"
	tar -xf "$srcdir"/data.tar.xz
}
