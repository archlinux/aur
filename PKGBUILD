# Maintainer: Parker Johansen <johansen.parker@gmail.com>
pkgname=kubelogin
pkgver=1.14.3
pkgrel=1
pkgdesc="Kubectl plugin for Kubernetes OpenID Connect authentication (oidc-login)"
arch=('x86_64')
url="https://github.com/int128/kubelogin"
license=('Apache')
depends=('kubectl')
source_x86_64=(${pkgname}-${pkgver}.zip::https://github.com/int128/kubelogin/releases/download/v${pkgver}/kubelogin_linux_amd64.zip)
sha256sums_x86_64=('06f427e05ef35286d43f19a30ba41df0db8380d0eeb4c178c6906704faee1e80')

package() {
    install ${srcdir}/kubelogin -Dm755 "${pkgdir}/usr/bin/kubelogin"
    install ${srcdir}/kubelogin -Dm755 "${pkgdir}/usr/bin/kubectl-oidc_login"
}
