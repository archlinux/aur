# Maintainer: lava <lava.mailbox@gmail.com>

pkgname=mc-skin-modarin-debian
pkgver=1.3
pkgrel=1
_debian_mc_version=4.8.13-3
pkgdesc='Debian Jessie version of 256-color skin for Midnight Commander (only extends the original skin with additional thin skins)'
arch=(any)
depends=(mc)
license=('GPL')
url=("https://launchpad.net/debian/+source/mc/3:$_debian_mc_version")
source=("https://launchpad.net/debian/+archive/primary/+files/mc_$_debian_mc_version.debian.tar.xz")
sha256sums=('c3878b83ce8cea7b7f138ef80bec8703f8d2f6d07e041de9ddaa90f1eb5a71f7')

package() {
    cd $srcdir
    mkdir -p $pkgdir/usr/share/mc/skins
    cp $srcdir/debian/skins/modarin-1.2-thin/* $pkgdir/usr/share/mc/skins/
}

