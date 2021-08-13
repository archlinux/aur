# Maintainer: K4YT3X <aur@k4yt3x.com>
pkgname=nspawn
pkgver=0.1
pkgrel=2
pkgdesc="A wrapper around machinectl for easy-deployment of nspawn.org containers"
arch=('any')
url="https://github.com/nspawn/nspawn"
license=('GPL3')
depends=('systemd')
makedepends=('git')
source=("git+${url}.git#commit=a051af90cb01a87dcccd4f808fbdb9729470314f")
md5sums=('SKIP')

package() {
	cd "$pkgname"
	install -D -m 755 nspawn "$pkgdir/usr/bin/nspawn"
	install -D -m 755 nspawn-builder "$pkgdir/usr/bin/nspawn-builder"
}
