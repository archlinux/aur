# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=ghi
pkgver=1.2.1
pkgrel=2
pkgdesc='GitHub Issues on the command line'
arch=('any')
url="https://github.com/drazisil/${pkgname}"
license=('MIT')
depends=('ruby')
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('83fbc4918ddf14df77ef06b28922f481747c6f4dc99b865e15d236b1db98c0b8')

package() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    install -Dm755 -t "${pkgdir}"/usr/bin ghi
    install -Dm644 -t "${pkgdir}"/usr/share/man/man1 man/ghi.1
    install -Dm644 -t "${pkgdir}"/usr/share/licenses/${pkgname} LICENSE
}
