# Maintainer: Gui||aume <michaudg@gmail.com>

pkgname=rocketchat-client
pkgver=2.0.1
pkgrel=1
pkgdesc="The Ultimate Open Source Web Chat Platform"
arch=('x86_64')
license=('The MIT License (MIT)')
url="https://rocket.chat"
options=()

source_x86_64=("https://github.com/RocketChat/Rocket.Chat.Electron/releases/download/${pkgver}/rocketchat-${pkgver}-linux-x64.deb")
md5sums_x86_64=('13a107f1235ba98968e1a774f27dfc3e')

depends=('libnotify' 'gconf')
optdepends=()

package() {
  cd "${srcdir}"

	tar xf data.tar.xz -C "${pkgdir}"

	chmod 755 $pkgdir/opt
	chmod 755 $pkgdir/usr
	chmod 755 $pkgdir/usr/share
	chmod 755 $pkgdir/usr/share/applications
}

