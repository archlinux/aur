# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=k8s-ldap-auth-bin
pkgdesc="Kubernetes webhook token authentication plugin implementation using ldap."
pkgver=2.0.1
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://github.com/vbouchaud/k8s-ldap-auth"
license=('MPL2')
conflicts=('k8s-ldap-auth')
provides=('k8s-ldap-auth')

sha256sums_x86_64=(
    370546e3a65b2cf1f6ebb0398585f4ebf50d29afe187a37887d39393530e7c27
)
sha256sums_armv7l=(
    c890efc0ec27896d59aa8bfeb8feeb479918e5675913e19a9be52d831f187fff
)
sha256sums_armv7h=(
    "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
    416d2ee1ff7630b19a03aae54acde2d734d971e1d342d11cd055619e7db727b9
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
