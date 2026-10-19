# Maintainer: tee < teeaur at duck dot com >
pkgname=eidos-lite-bin
pkgver=0.25.1
pkgrel=1
pkgdesc="A single-file relational spreadsheet for you and your agent, built on standard SQLite"
arch=(x86_64)
url="https://eidos.space"
license=('AGPL-3.0-or-later')
depends=('glib2' 'cairo' 'gtk3' 'hicolor-icon-theme')
_src="https://github.com/mayneyao/eidos"
source=("$_src/releases/download/lite-v$pkgver/Eidos.Lite-$pkgver-linux-amd64.deb")
b2sums=('8fa68d53d8dd289c7ca3d337942e0d9dc636bfe451d2da1008a8cd2111b47b586d6164abdf245c907c54f61bf08fb536fa11473368bf78a69323c3935ee98235')

package(){
	cd "$pkgdir"
	tar -xf "$srcdir"/data.tar.xz
}
