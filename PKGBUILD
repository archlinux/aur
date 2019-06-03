# Maintainer: Parker Johansen <johansen.parker@gmail.com>
pkgname=kubelogin
pkgver=1.11.0
pkgrel=1
pkgdesc="Kubectl plugin for Kubernetes OpenID Connect authentication (oidc-login)"
arch=('x86_64')
url="https://github.com/int128/kubelogin"
license=('Apache')
depends=('kubectl')
source_x86_64=(${pkgname}-${pkgver}.zip::https://github.com/int128/kubelogin/releases/download/v${pkgver}/kubelogin_linux_amd64.zip)
sha512sums_x86_64=('80ac9fba3fcb0446042bdedc15e13c7bb0b54cf43c4bbbac46308a0c3567740b637756802804fc9285dac26e5efe8fef6fe4ed66688565e4d39d8c2b7d27a28c')

package() {
    install ${srcdir}/kubelogin -Dm755 "${pkgdir}/usr/bin/kubelogin"
    install ${srcdir}/kubelogin -Dm755 "${pkgdir}/usr/bin/kubectl-oidc_login"
}
