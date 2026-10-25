# Maintainer: tee < teeaur at duck dot com >
pkgname=eidos-lite-bin
pkgver=0.28.0
pkgrel=1
pkgdesc="A single-file relational spreadsheet for you and your agent, built on standard SQLite"
arch=(x86_64)
url="https://eidos.space"
license=('AGPL-3.0-or-later')
depends=('glib2' 'cairo' 'gtk3' 'hicolor-icon-theme')
_src="https://github.com/mayneyao/eidos"
source=("$_src/releases/download/lite-v$pkgver/Eidos.Lite-$pkgver-linux-amd64.deb")
b2sums=('80825f1c4683d25c485371178860061abe971eeaea8a27cc105a53707ecdcbec724dc64d0fa100d16bcbdedd4a73480dd8950d91b1994604092cde4813ff458d')

package(){
  tar -xf data.tar.xz -C "$pkgdir"
}
