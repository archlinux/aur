# Maintainer: Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

_appname=whalebird
pkgname="$_appname-bin"
pkgver=0.6.2
pkgrel=1
pkgdesc='An Electron based Mastodon client for Windows, Mac and Linux'
arch=(x86_64)
url='https://whalebird.org/'
license=(MIT)
depends=(alsa-lib gconf gtk2 libxss libxtst nss)
source=("$url/releases/download/$pkgver/Whalebird-$pkgver-linux-x64.rpm")
sha256sums=('c624d9e1666c22c479d0e7baa7d82a33693e2114ea4506b4cdf102e641b731f1')

package() {
  cp -R opt/ usr/ $pkgdir
}
