# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=anirem
pkgver=1.1.0
pkgrel=2
pkgdesc="A tool to passivly check for updates on seasons, for proxer.me"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/SeasonProxer"
license=('BSD')
depends=('qt5-base' 'qt5-datasync' 'qt5-restclient')
provides=('seasonproxer')
conflicts=('seasonproxer')
source=("https://install.skycoder42.de/pkg/${pkgname}-${pkgver}.tar.xz")
sha256sums=('41fabf5507905ccfe86909b2c6fe53e31ffa5b7a7d1f313c401c9b20d1d6da82')

package() {
	#create symlink for backward compabiliy
	ln -s /usr/bin/anirem ./usr/bin/SeasonProxer

	cp -r ./usr "$pkgdir/"
}
