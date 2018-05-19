# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=anirem
pkgver=2.0.1
pkgrel=1
pkgdesc="A tool to passivly check for updates on seasons, for proxer.me"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/AniRem"
license=('BSD')
depends=('qt5-base' 'qt5-datasync' 'qt5-mvvmwidgets' 'qt5-restclient>=2.0.0' 'qt5-mvvmdatasyncwidgets' 'qt5-svg')
provides=('seasonproxer')
conflicts=('seasonproxer')
source=("https://install.skycoder42.de/pkg/${pkgname}-${pkgver}.tar.xz")
sha256sums=('0c0f1777324020f3c2c14801ae1a6457b5bcbe6ef5221983871bdcf453488756')

package() {
	#create symlink for backward compabiliy
	cp -r ./usr "$pkgdir/"
	ln -s Ani-Rem "$pkgdir/usr/bin/SeasonProxer"
}
