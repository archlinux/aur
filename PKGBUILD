# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=k8s-ldap-auth-bin
pkgdesc="Kubernetes webhook token authentication plugin implementation using ldap."
pkgver=2.0.0
pkgrel=2
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://github.com/vbouchaud/k8s-ldap-auth"
license=('MPL2')
conflicts=('k8s-ldap-auth')
provides=('k8s-ldap-auth')

sha256sums_x86_64=(
    82c5ab4eb21eee423443520fd5ee761dff1bb24c79da9a6288c5a089077b6409
)
sha256sums_armv7l=(
    0f5d8de3a4c34a7899f12fce38b9f04de8a6f8d04d7af24a8acfc461579f71f7
)
sha256sums_armv7h=(
    "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
    8848d7c1143b067d859bb899919a2cefaf4deb4dfc3dec69c323299605778497
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
