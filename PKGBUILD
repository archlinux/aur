# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=anirem
pkgver=1.1.0
pkgrel=1
pkgdesc="A tool to passivly check for updates on seasons, for proxer.me"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/SeasonProxer"
license=('BSD')
depends=('qt5-base' 'qt5-datasync' 'qt5-restclient')
provides=('seasonproxer')
conflicts=('seasonproxer')
source=("https://install.skycoder42.de/pkg/${pkgname}-${pkgver}.tar.xz")
sha256sums=('a1a4a1714857b0b0fb29851aa96afad2bec08da8b4eab13dd4245a9f470de54f')

package() {
	#create symlink for backward compabiliy
	ln -s /usr/bin/anirem ./usr/bin/SeasonProxer

	cp -r ./usr "$pkgdir/"
}
