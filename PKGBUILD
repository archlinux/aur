# Maintainer: Chris Mustola <chris.mustola at gmail dot com>
pkgname=sysupdate
pkgver=1.0
pkgrel=1
pkgdesc="A simple script that checks for available updates and let's you install them too"
arch=('any')
license=('GPL3')
depends=('pacman-contrib' 'pacaur')
makedepends=('git')
provides=('sysupdate')
url="https://gitlab.com/Bettehem/sysupdate"
source=("sysupdate::git+https://gitlab.com/Bettehem/sysupdate.git")
md5sums=('SKIP')

build(){
	cd "$pkgname"
}


package() {
	cd "$pkgname"
	install -Dm755 sysupdate.sh "$pkgdir/usr/bin/sysupdate"
}
