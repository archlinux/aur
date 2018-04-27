# Maintainer: Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

_appname=whalebird
pkgname="$_appname-bin"
pkgver=0.6.1
pkgrel=1
pkgdesc='An Electron based Mastodon client for Windows, Mac and Linux'
arch=(x86_64)
url=https://github.com/h3poteto/whalebird-desktop
license=(MIT)
depends=(alsa-lib gconf gtk2 libxss libxtst nss)
source=("$url/releases/download/$pkgver/Whalebird-$pkgver-linux-x64.rpm")
sha256sums=('2115f0d15c4a18a89f6eaeae2b611f233b254c0a855a184420d893f3c91cc567')

package() {
  cp -R opt/ usr/ $pkgdir
}
