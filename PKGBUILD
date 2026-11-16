# Maintainer: tee < teeaur at duck dot com >
pkgname=eidos-lite-bin
pkgver=0.34.0
pkgrel=1
pkgdesc="A single-file relational spreadsheet for you and your agent, built on standard SQLite"
arch=(x86_64)
url="https://eidos.space"
license=('AGPL-3.0-or-later')
depends=('glib2' 'cairo' 'gtk3' 'hicolor-icon-theme')
_src="https://github.com/mayneyao/eidos"
source=("$_src/releases/download/lite-v$pkgver/Eidos.Lite-$pkgver-linux-amd64.deb")
b2sums=('a8177bc3a02bb851f4accfc427bff57c0510c23307f2783aee53cffca77ce76946ea721ecebf4bd9a225a78941080fbe3f4c1a7e2ff800327e5acc231d9dccdb')

package(){
  tar -xf data.tar.xz -C "$pkgdir"
}
