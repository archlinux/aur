# Maintainer : Phillip K. Samuel <pintert3 at protonmail dot com>
# Contributor : Ben Ellis benx45h@gmail.com

pkgname=renode-bin
pkgver=1.13.1
pkgrel=1
pkgdesc="A virtual development framework for multinode embedded networks"
url="https://www.renode.io"
arch=('x86_64')
license=('MIT')
provides=('renode'
          'libllvm-disas.so')
depends=('mono'
         'gtk-sharp-2'
         'screen'
         'polkit'
         'gcc'
         'python'
         'python-pip'
         'zeromq')

source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/renode/renode/releases/download/v${pkgver}/renode-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz")

# checksum from package at time of pkgbuild
sha256sums=('6b7996d680ccf2f3c1320e95f478706f73d3a7a2fb127b7e6d0257b6109d78c3')

package() {
    cp -a opt $pkgdir
    cp -a usr $pkgdir
}


