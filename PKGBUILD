pkgname=git-mr
pkgver=1.0.0
pkgrel=1
arch=(any)
pkgdesc=""
license=("MIT")
depends=('git')
# makedepends=()
url="https://gitlab.com/glensc/${pkgname}/"
source=("https://gitlab.com/glensc/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('d596acf623ebdb55a38d2e6d1d1b1cbad0d822323f4c6a5c22f84b986988a5b9')

package() {
    ls
    cd ${pkgname}-${pkgver}
    install -D git-mr "$pkgdir/usr/bin/git-mr"
    install -D git-pr "$pkgdir/usr/bin/git-pr"
    install -D LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
