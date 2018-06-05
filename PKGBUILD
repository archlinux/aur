# Maintainer: Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

_appname=whalebird
pkgname="$_appname-bin"
pkgver=1.3.0
pkgrel=1
pkgdesc='An Electron based Mastodon client for Windows, Mac and Linux'
arch=(x86_64)
url='https://whalebird.org/'
license=(MIT)
depends=(alsa-lib gconf gtk2 libxss libxtst nss)
source=("https://github.com/h3poteto/whalebird-desktop/releases/download/$pkgver/Whalebird-$pkgver-linux-x64.rpm")
sha256sums=('972898f78e75eea7f3f2f26184e5e361cb9a763ddda4a691db288a7f04b63903')

package() {
  cp -R opt/ usr/ $pkgdir
  mkdir $pkgdir/usr/bin
  ln -s "$pkgdir/opt/Whalebird for Mastodon/whalebird" $pkgdir/usr/bin/whalebird
}
