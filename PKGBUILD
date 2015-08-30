# Maintainer: Felix Wiegand <koffeinflummi@gmail.com>

pkgname=urxvt-color-tester-git
pkgver=1.0
pkgrel=1
pkgdesc="Color testing script for urxvt"
url="http://crunchbang.org/forums/viewtopic.php?pid=295676#p296114"
license=('unknown')
arch=('any')
depends=('rxvt-unicode')
makedepends=()
optdepends=()
provides=()
conflicts=()
options=()
source=("git+https://gist.github.com/2799a146725f69378dcc.git")
sha256sums=('SKIP')

package() {
    cd ${srcdir}/2799a146725f69378dcc
    mkdir -p ${pkgdir}/usr/bin
    install -m 755 colors ${pkgdir}/usr/bin/colors
}
