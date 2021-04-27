pkgname=nginx-config-formatter
pkgver=1.2.2
pkgrel=1
pkgdesc="nginx config file formatter/beautifier written in Python. "
depends=('python')
provides=('nginx-config-formatter')
license=('Apache 2.0')
arch=('any')
url="https://github.com/slomkowski/nginx-config-formatter"
source=(${url}/archive/refs/tags/v${pkgver}.zip)
sha256sums=('68335b3f80b4d813ac73496546c9a0015f1d6058b40bcfb4ec93cd3d60f3c944')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 nginxfmt.py "${pkgdir}/usr/bin/nginxfmt.py"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    install LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
