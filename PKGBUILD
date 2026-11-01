# Maintainer: tee < teeaur at duck dot com >
pkgname=eidos-lite-bin
pkgver=0.29.6
pkgrel=1
pkgdesc="A single-file relational spreadsheet for you and your agent, built on standard SQLite"
arch=(x86_64)
url="https://eidos.space"
license=('AGPL-3.0-or-later')
depends=('glib2' 'cairo' 'gtk3' 'hicolor-icon-theme')
_src="https://github.com/mayneyao/eidos"
source=("$_src/releases/download/lite-v$pkgver/Eidos.Lite-$pkgver-linux-amd64.deb")
b2sums=('47ee7e196ad74c2ab3e5dae53cb13d4e52d7ee506903496eefe27fa65cba53f46334e8185f483d1a6ad260daab705ffac3a30574a0a976b71d9a0f82ad0db2f7')

package(){
  tar -xf data.tar.xz -C "$pkgdir"
}
