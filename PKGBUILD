# Maintainer: Gui||aume <michaudg@gmail.com>

pkgname=rocketchat-client
pkgver=1.0.0
pkgrel=3
pkgdesc="The Ultimate Open Source Web Chat Platform"
arch=('x86_64')
license=('The MIT License (MIT)')
url="https://rocket.chat"
options=()

source_x86_64=("https://github.com/RocketChat/Rocket.Chat.Electron/releases/download/v${pkgver}/rocketchat-${pkgver}-linux.deb")
md5sums_x86_64=('9c59da2397d0bafc7a4a4ca3c551e70c')

depends=()
optdepends=()

package() {
  cd "${srcdir}"

	tar xf data.tar.xz -C "${pkgdir}"

	chmod 755 $pkgdir/opt
	chmod 755 $pkgdir/usr
	chmod 755 $pkgdir/usr/share
	chmod 755 $pkgdir/usr/share/applications
}

