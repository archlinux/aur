# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=k8s-ldap-auth-bin
pkgdesc="Kubernetes webhook token authentication plugin implementation using ldap."
pkgver=1.0.0
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://github.com/vbouchaud/k8s-ldap-auth"
license=('apache')
conflicts=('k8s-ldap-auth')
provides=('k8s-ldap-auth')

sha256sums_x86_64=(
    730673f18d3b8fce33317f54c0eb7fbd21ee219994f3e0f30e8c1a1096ffef20
)
sha256sums_armv7l=(
    743d589300041e64fd64496f38b60bd002840276d78d1295c2f0a93e150d61ab
)
sha256sums_armv7h=(
    "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
    987410efa223063e09ce66c858ec42aad1e3da71f6f3da7599a7c6a562621e64
)

source_x86_64=(
    "k8s-ldap-auth::https://github.com/vbouchaud/k8s-ldap-auth/releases/download/v${pkgver}/k8s-ldap-auth.linux.amd64"
)
source_armv7l=(
    "k8s-ldap-auth::https://github.com/vbouchaud/k8s-ldap-auth/releases/download/v${pkgver}/k8s-ldap-auth.linux.arm"
)
source_armv7h=(
  "${source_armv7l}"
)
source_aarch64=(
    "k8s-ldap-auth::https://github.com/vbouchaud/k8s-ldap-auth/releases/download/v${pkgver}/k8s-ldap-auth.linux.arm64"
)

package() {
  install -D -m0755 "${srcdir}/k8s-ldap-auth" "${pkgdir}/usr/bin/k8s-ldap-auth"
}
