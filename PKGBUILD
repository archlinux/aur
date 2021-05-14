# Maintainer: Daniel Fernández Rodríguez <gmail.com daferoes>
pkgname=kauthproxy
pkgver=1.1.1
pkgrel=1
pkgdesc="Local authentication proxy for Kubernetes Dashboard"
arch=('x86_64')
url="https://github.com/int128/kauthproxy"
license=('Apache')
depends=('kubectl' 'glibc')
source=(${pkgname}-${pkgver}.zip::https://github.com/int128/kauthproxy/releases/download/v${pkgver}/kauthproxy_linux_amd64.zip)
sha256sums=('331ff9ed096806181e7cb026b937107b10c1aaa9851df949f7a9c7b4a7f5a237')
package() {
    install ${srcdir}/kauthproxy -Dm755 "${pkgdir}/usr/bin/kauthproxy"
    install ${srcdir}/kauthproxy -Dm755 "${pkgdir}/usr/bin/kubectl-auth_proxy"
}
