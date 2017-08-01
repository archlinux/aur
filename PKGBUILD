# Maintainer: pzl <alsoelp@gmail.com>

pkgname=pacvcs
pkgver=1.0.0
pkgrel=1
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
source=('https://github.com/pzl/pacvcs/archive/v1.0.0.tar.gz')
md5sums=('a76e87abe366daaa3d39036a69cde8ea')
sha256sums=('d1b0222099b57dec2b041b6dc446416bac3e8db43f1787b908102110934589ee')


package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -D -m755 "$pkgname" "${pkgdir}/usr/bin/$pkgname"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
