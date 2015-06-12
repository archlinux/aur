# Maintainer: lava <lava.mailbox@gmail.com>

pkgname=mc-skin-modarin-debian
pkgver=1.2
pkgrel=2
_debian_mc_version=4.8.1-3
pkgdesc='Debian Wheezy version of 256-color skin for Midnight Commander (only extends the original skin with additional thin skins)'
arch=(any)
depends=(mc)
license=('GPL')
optdepends=('mc-skin-modarin: Original skin for mc < 4.8.9-1')
url=("https://launchpad.net/debian/+source/mc/3:$_debian_mc_version")
source=("http://launchpad.net/debian/+archive/primary/+files/mc_$_debian_mc_version.debian.tar.gz")
md5sums=('4e7a86e379ddf05cc1d5ead120203b79')

package() {
    cd $srcdir
    mkdir -p $pkgdir/usr/share/mc/skins
    cp $srcdir/debian/skins/modarin-$pkgver-thin/* $pkgdir/usr/share/mc/skins/
}

