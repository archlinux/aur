# Maintainer: tee < teeaur at duck dot com >
pkgname=eidos-lite-bin
pkgver=0.29.0
pkgrel=1
pkgdesc="A single-file relational spreadsheet for you and your agent, built on standard SQLite"
arch=(x86_64)
url="https://eidos.space"
license=('AGPL-3.0-or-later')
depends=('glib2' 'cairo' 'gtk3' 'hicolor-icon-theme')
_src="https://github.com/mayneyao/eidos"
source=("$_src/releases/download/lite-v$pkgver/Eidos.Lite-$pkgver-linux-amd64.deb")
b2sums=('908e22c0157560938c4b85aecc08f825c0b8b21294d45ed74c5372df907386fec1aef3a0deacae099ab22f692edc41f78f660030ef1ad31f4af80e48e16550ec')

package(){
  tar -xf data.tar.xz -C "$pkgdir"
}
