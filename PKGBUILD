# Maintainer: tee < teeaur at duck dot com >
pkgname=eidos-lite-bin
pkgver=0.23.0
pkgrel=1
pkgdesc="A single-file relational spreadsheet for you and your agent, built on standard SQLite"
arch=(x86_64)
url="https://eidos.space"
license=('AGPL-3.0-or-later')
depends=('glib2' 'cairo' 'gtk3' 'hicolor-icon-theme')
_src="https://github.com/mayneyao/eidos"
source=("$_src/releases/download/lite-v$pkgver/Eidos.Lite-$pkgver-linux-amd64.deb")
b2sums=('4a2dbb0cfac983e9fc7863397edd1d035e606f89bf7734eab1070d29b8fa510ca974fac45e8f47e4911273387176e8ca71030edf6a2d168c9bca4f74e54862df')

package(){
	cd "$pkgdir"
	tar -xf "$srcdir"/data.tar.xz
}
