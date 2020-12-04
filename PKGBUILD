# Maintainer : Ben Ellis benx45h@gmail.com

pkgname=renode-bin
pkgver=1.11.0
pkgrel=1
pkgdesc="The Renode Framework"
url="https://www.renode.io"
arch=('x86_64')
license=('MIT')
provides=('renode')
depends=('mono'
         'gtk-sharp-2'
         'screen'
         'polkit'
         'gcc'
         'python3'
         'python-pip'
         'zeromq')

source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/renode/renode/releases/download/v${pkgver}/renode-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz")

# checksum from package at time of pkgbuild
md5sums=('723dab329330ef99e5db25a43e1967c8')

package() {
    cp -r opt $pkgdir
    cp -r usr $pkgdir
}


