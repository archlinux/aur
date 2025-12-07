pkgname=fastfetch-theme-manager
pkgver=2.0.0
pkgrel=1
pkgdesc="A theme manager for Fastfetch made by Tasavvuf"
arch=('any')
url="https://github.com/itz-dev-tasavvuf/fastfetch-theme-manager"
license=('MIT')
depends=('python')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 ftm.py "${pkgdir}/usr/bin/ftm"
    install -Dm755 install.sh "${pkgdir}/usr/share/${pkgname}/install.sh"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
