pkgname=nginx-config-formatter
pkgver=1.3.0
pkgrel=1
pkgdesc="nginx config file formatter/beautifier written in Python. "
depends=('python')
provides=('nginx-config-formatter')
license=('Apache 2.0')
arch=('any')
url="https://github.com/slomkowski/nginx-config-formatter"
source=(${url}/archive/refs/tags/v${pkgver}.zip)
sha256sums=('295e6a90bb5fbc63fa5dc21e797803c1b56e3f01d2dd05779220b165d79344e0')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 nginxfmt.py "${pkgdir}/usr/bin/nginxfmt.py"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    install LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
