# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=anirem
pkgver=1.1.0
pkgrel=3
pkgdesc="A tool to passivly check for updates on seasons, for proxer.me"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/SeasonProxer"
license=('BSD')
depends=('qt5-base' 'qt5-datasync' 'qt5-restclient')
provides=('seasonproxer')
conflicts=('seasonproxer')
source=("https://install.skycoder42.de/pkg/${pkgname}-${pkgver}.tar.xz")
sha256sums=('1d8a62cfd5099204e97f6e91144c8efdedc3395e487aad9aabb4a743694cda3f')

package() {
	#create symlink for backward compabiliy
	ln -s /usr/bin/anirem ./usr/bin/SeasonProxer

	cp -r ./usr "$pkgdir/"
}
