# Maintainer: tee < teeaur at duck dot com >
pkgname=eidos-lite-bin
pkgver=0.30.0
pkgrel=1
pkgdesc="A single-file relational spreadsheet for you and your agent, built on standard SQLite"
arch=(x86_64)
url="https://eidos.space"
license=('AGPL-3.0-or-later')
depends=('glib2' 'cairo' 'gtk3' 'hicolor-icon-theme')
_src="https://github.com/mayneyao/eidos"
source=("$_src/releases/download/lite-v$pkgver/Eidos.Lite-$pkgver-linux-amd64.deb")
b2sums=('a571844af23f61107f20968d54a389aaab012491c69b0a43694146df28628ded39b0d4bc5a76165c6d2b68c3f48d4ebb77d6a5dbc658989e18d9944f6816cf7a')

package(){
  tar -xf data.tar.xz -C "$pkgdir"
}
