# Maintainer: Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

_appname=whalebird
pkgname="$_appname-bin"
pkgver=0.5.0
pkgrel=1
pkgdesc='An Electron based Mastodon client for Windows, Mac and Linux'
arch=(x86_64)
url=https://github.com/h3poteto/whalebird-desktop
license=(MIT)
depends=(alsa-lib gconf gtk2 libxss libxtst nss)
source=("$url/releases/download/$pkgver/Whalebird-$pkgver-linux-x64.rpm")
sha256sums=('646ae673c0d19822260871950540f01e2c9d8c5b81cf532bd8d5ad96ab90cdc7')

package() {
  cp -R opt/ usr/ $pkgdir
}
