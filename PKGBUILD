# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=k8s-ldap-auth-bin
pkgdesc="Kubernetes webhook token authentication plugin implementation using ldap."
pkgver=3.1.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/vbouchaud/k8s-ldap-auth"
license=('MPL2')
conflicts=('k8s-ldap-auth')
provides=('k8s-ldap-auth')

sha256sums_x86_64=(
    1cecd0967683822edb47beb8a5345a4ac5427d9a803c5a6cbbb3c951cd3c3fdf
)
sha256sums_aarch64=(
    4ccfa6fdf3f5177d72198ae2f51b8fffdf70b2924e0429a13df899080755a6d0
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
