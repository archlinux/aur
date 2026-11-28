# Maintainer: tee < teeaur at duck dot com >
pkgname=eidos-lite-bin
pkgver=0.40.1
pkgrel=1
pkgdesc="A single-file relational spreadsheet for you and your agent, built on standard SQLite"
arch=(x86_64)
url="https://eidos.space"
license=('AGPL-3.0-or-later')
depends=('glib2' 'cairo' 'gtk3' 'hicolor-icon-theme')
_src="https://github.com/mayneyao/eidos"
source=("$_src/releases/download/lite-v$pkgver/Eidos.Lite-$pkgver-linux-amd64.deb")
b2sums=('4bc3a784a445728150e14809d7103343b003b976d9e3a343888c10a2b097f003306a93b75d15ec77020458d6039aecb872e1aabf7002ebc73a5fc3469eae08ff')

package(){
  tar -xf data.tar.xz -C "$pkgdir"
}
