# Maintainer : Phillip K. Samuel <pintert3 at protonmail dot com>
# Contributor : Ben Ellis benx45h@gmail.com

pkgname=renode-bin
pkgver=1.13.3
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
sha256sums=('e29929963a903f249921bff52b54d7798c758bfdc0f6b9748a21edd9cd199a1b')

package() {
    cp -a opt $pkgdir
    cp -a usr $pkgdir
}


