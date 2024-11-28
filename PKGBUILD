# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=k8s-ldap-auth-bin
pkgdesc="Kubernetes webhook token authentication plugin implementation using ldap."
pkgver=4.0.0
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://github.com/HopopOps/k8s-ldap-auth"
license=('MPL2')
conflicts=('k8s-ldap-auth')
provides=('k8s-ldap-auth')

sha256sums_x86_64=(
    c590c1c71b66fbe886a79bf1829d254199d3ca1f5ff3d58a3a366fa07ac3ee49
)
sha256sums_armv7l=(
    88c5f41bdd2a4ab944b8f1adfc3662ec5b1a0cb2e4830bd98e4fcc5e2673c3f3
)
sha256sums_armv7h=(
    "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
    c936b6100fd60044204d3731cabb436d244fbaaad22d7b2870f8d0303a5553bf
)

source_x86_64=(
    "k8s-ldap-auth::https://github.com/HopopOps/k8s-ldap-auth/releases/download/v${pkgver}/k8s-ldap-auth.linux.amd64"
)
source_armv7l=(
    "k8s-ldap-auth::https://github.com/HopopOps/k8s-ldap-auth/releases/download/v${pkgver}/k8s-ldap-auth.linux.arm"
)
source_armv7h=(
    "${source_armv7l}"
)
source_aarch64=(
    "k8s-ldap-auth::https://github.com/HopopOps/k8s-ldap-auth/releases/download/v${pkgver}/k8s-ldap-auth.linux.arm64"
)

package() {
    install -D -m0755 "${srcdir}/k8s-ldap-auth" "${pkgdir}/usr/bin/k8s-ldap-auth"
}
