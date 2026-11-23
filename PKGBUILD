# Maintainer: tee < teeaur at duck dot com >
pkgname=eidos-lite-bin
pkgver=0.39.0
pkgrel=1
pkgdesc="A single-file relational spreadsheet for you and your agent, built on standard SQLite"
arch=(x86_64)
url="https://eidos.space"
license=('AGPL-3.0-or-later')
depends=('glib2' 'cairo' 'gtk3' 'hicolor-icon-theme')
_src="https://github.com/mayneyao/eidos"
source=("$_src/releases/download/lite-v$pkgver/Eidos.Lite-$pkgver-linux-amd64.deb")
b2sums=('a49c76076a3c7e1dfee7448fe1f2ce4fc1008555f82e105abec4a0ef8f9815d9b84801b5f07494409bb9b4539461136aa23fc0f74401469f026a3b3cf42d24d3')

package(){
  tar -xf data.tar.xz -C "$pkgdir"
}
