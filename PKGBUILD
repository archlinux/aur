# Maintainer: Michael Polidori <michaelapolidori at gmail dot com>
# Author: Michael Polidori

pkgname=pykgbuild
pkgver=0.1.7
pkgrel=1
pkgdesc="A tool to check if a user's AUR Python package(s) are up to date with the PyPI."
url="https://github.com/mpolidori/pykgbuild"
depends=('python')
license=('MIT')
arch=('any')
source=('git+https://github.com/mpolidori/pykgbuild.git')
md5sums=(SKIP)

package() {
    cd $pkgname
    mv pykgbuild.py pykgbuild
    install -Dm 0755 -t ${pkgdir}/usr/bin pykgbuild
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
