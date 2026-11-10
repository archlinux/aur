# Maintainer: tee < teeaur at duck dot com >
pkgname=eidos-lite-bin
pkgver=0.33.0
pkgrel=1
pkgdesc="A single-file relational spreadsheet for you and your agent, built on standard SQLite"
arch=(x86_64)
url="https://eidos.space"
license=('AGPL-3.0-or-later')
depends=('glib2' 'cairo' 'gtk3' 'hicolor-icon-theme')
_src="https://github.com/mayneyao/eidos"
source=("$_src/releases/download/lite-v$pkgver/Eidos.Lite-$pkgver-linux-amd64.deb")
b2sums=('3ad233f7daa353e7ba27920d2fbf96f0dac223dbc71bbb66bdea2db1a7c402b4fb3d8262074acf8121d681d02d99463be3ad4730f92cf40bb5b236eace08942b')

package(){
  tar -xf data.tar.xz -C "$pkgdir"
}
