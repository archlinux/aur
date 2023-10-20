# Maintainer : Phillip K. Samuel <pintert3 at protonmail dot com>
# Contributor : Ben Ellis benx45h@gmail.com

pkgname=renode-bin
pkgver=1.14.0
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

source=("$pkgname-$pkgver-$pkgrel.tar.xz::https://github.com/renode/renode/releases/download/v${pkgver}/renode-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz")

# checksum from package at time of pkgbuild
sha256sums=('9036e8aee81363757ba318d55fd4c2a9b3c3dc2f6f58fda446d2b4f22af4e431')

package() {
    cp -a opt $pkgdir
    cp -a usr $pkgdir
}


