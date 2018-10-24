# Maintainer: Michael Polidori <michaelapolidori@gmail.com>
# Author: Michael Polidori

pkgname=pykgbuild
_pkgname=py-pkgbuild-version
pkgver=0.1.1
pkgrel=1
pkgdesc="Compare PyPI packages with users PKGBUILD versions"
url="https://github.com/mpolidori/py-pkgbuild-version"
depends=('python')
license=('MIT')
arch=('any')
source=('git+https://github.com/mpolidori/py-pkgbuild-version.git')
md5sums=(SKIP)

package() {
    cd $_pkgname
    mv checker.py pykgbuild
    install -Dm 0755 -t ${pkgdir}/usr/bin pykgbuild
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
