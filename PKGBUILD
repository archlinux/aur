# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=k8s-ldap-auth-bin
pkgdesc="Kubernetes webhook token authentication plugin implementation using ldap."
pkgver=3.2.1
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/vbouchaud/k8s-ldap-auth"
license=('MPL2')
conflicts=('k8s-ldap-auth')
provides=('k8s-ldap-auth')

sha256sums_x86_64=(
    bfbcee0eebfc62b67804b269b2dbe89e3508479b1d2279fe813a2d21f4a608e8
)
sha256sums_aarch64=(
    f2f6da736725da7551361124fb8bf433f2f3cb2bb83560bbc924fa9932dbc3b6
)

source_x86_64=(
    "k8s-ldap-auth::https://github.com/vbouchaud/k8s-ldap-auth/releases/download/v${pkgver}/k8s-ldap-auth.linux.amd64"
)
source_aarch64=(
    "k8s-ldap-auth::https://github.com/vbouchaud/k8s-ldap-auth/releases/download/v${pkgver}/k8s-ldap-auth.linux.arm64"
)

package() {
  install -D -m0755 "${srcdir}/k8s-ldap-auth" "${pkgdir}/usr/bin/k8s-ldap-auth"
}
