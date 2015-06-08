# Maintainer: Christian Wieden <wiedenchr at gmail dot com>
# Contributer: Martin Chaine <aur at casimir-lab dot net>
pkgname=hstr-bin
pkgver=1.17
pkgrel=1
pkgdesc="A command line utility that brings improved BASH command completion from the history. It aims to make completion easier and more efficient than Ctrl-r."
arch=('x86_64')
provides=('hh');
url="https://github.com/dvorka/hstr"
license=('Apache')
conflicts=('hstr-git' 'hh')
depends=('libtinfo' 'readline')
source=(https://github.com/dvorka/hstr/releases/download/${pkgver}/hh-${pkgver}-bin-64b.tgz
        https://raw.githubusercontent.com/dvorka/hstr/${pkgver}/man/hh.1)
md5sums=('378794935db6ef9188bac2d00abb3380'
         'SKIP')

package() {
    install -Dm 755 hh $pkgdir/usr/bin/hh
    install -Dm 644 hh.1 $pkgdir/usr/share/man/man1/hh.1
}
