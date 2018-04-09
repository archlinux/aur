# Maintainer: Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

_appname=whalebird
pkgname="$_appname-bin"
pkgver=0.3.1
pkgrel=1
pkgdesc='An Electron based Mastodon client for Windows, Mac and Linux'
arch=(x86_64)
url=https://github.com/h3poteto/whalebird-desktop
license=(MIT)
depends=(alsa-lib gconf gtk2 libxss libxtst nss)
source=("$url/releases/download/$pkgver/Whalebird-$pkgver-linux-x64.rpm")
sha256sums=('3df2baaee7afcecbd73b3248cb41fefc44f4b0cbc087e7a9dbb06d7d05363f26')

package() {
  cp -R opt/ usr/ $pkgdir
}
