# Maintainer: pzl <alsoelp@gmail.com>

pkgname=pacvcs
pkgver=1.0.1
pkgrel=0
epoch=1
pkgdesc="Pacman VCS version checker"
arch=('any')
url="https://github.com/pzl/pacvcs"
license=('MIT')
depends=('bash')
optdepends=('git' 'bzr')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pzl/pacvcs/archive/v1.0.1.tar.gz")
md5sums=('1b0d7876a44506533f4d0a231a6ca88f')
sha256sums=('37067466db30d6ce4aabc3e1a1684e23542d14bd0c19377c566b8be358fd6a71')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -D -m755 "$pkgname" "${pkgdir}/usr/bin/$pkgname"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
