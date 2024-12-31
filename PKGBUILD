pkgname=nginx-config-formatter
pkgver=1.2.3
pkgrel=1
pkgdesc="nginx config file formatter/beautifier written in Python. "
depends=('python')
provides=('nginx-config-formatter')
license=('Apache 2.0')
arch=('any')
url="https://github.com/slomkowski/nginx-config-formatter"
source=(${url}/archive/refs/tags/v${pkgver}.zip)
sha256sums=('4e30bb1c56c215654af7727d61caaf80c6ca6c7fcba1f9ff8a38703244a79d05')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 nginxfmt.py "${pkgdir}/usr/bin/nginxfmt.py"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    install LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
