# Maintainer: Parker Johansen <johansen.parker@gmail.com>
pkgname=kubelogin
pkgver=1.9.1
pkgrel=1
pkgdesc="Kubectl plugin for Kubernetes OpenID Connect authentication (oidc-login)"
arch=('x86_64')
url="https://github.com/int128/kubelogin"
license=('Apache')
depends=('kubectl')
source_x86_64=(${pkgname}-${pkgver}.zip::https://github.com/int128/kubelogin/releases/download/v${pkgver}/kubelogin_linux_amd64.zip)
sha512sums_x86_64=('4d3400fedf738ca69d74d9e8d9cbb3e38057e3c1ea7f14f63ffc91049c38bdca4070e1589fc8278878db585c550c9f726f8c47c98243e5221f4f7026177584ab')

package() {
    install ${srcdir}/kubelogin -Dm755 "${pkgdir}/usr/bin/kubelogin"
    install ${srcdir}/kubelogin -Dm755 "${pkgdir}/usr/bin/kubectl-oidc_login"
}
