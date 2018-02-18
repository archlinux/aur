# Maintainer: Dennis Stengele <dennis@stengele.me>

pkgname=gdcp
pkgver=0.7.13
pkgrel=1
pkgdesc="scp like tool to interact with Google Drive from the command-line"
arch=('any')
url="https://github.com/ctberthiaume/gdcp"
license=('GPL3')
depends=('python2-pydrive' 'python2-backoff')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ctberthiaume/gdcp/archive/v${pkgver}.tar.gz")
sha256sums=('909c80d1df04269408efa18150e899107f3b19acc3cac5a05c2c68ba77e2d695')

package() {
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/gdcp" "${pkgdir}/usr/bin/gdcp"
}
