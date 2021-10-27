# Maintainer: Sabu Siyad <ssiyad at disroot dot org>
# This PKGBUILD is maintained at https://github.com/ssiyad/pkgbuilds/

pkgname=shelby-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="A fast, lightweight, minimal, shell prompt written in Go"
arch=('x86_64')
url="https://github.com/athul/shelby"
license=("GPL3")
provides=("shelby")
conflicts=("shelby-git")
source=(
    "shelby_${pkgver}_Linux_x86_64.tar.gz::https://github.com/athul/shelby/releases/download/v${pkgver}/shelby_${pkgver}_Linux_amd64.tar.gz"
)
sha256sums=('ee64a9d7c4b2ac8c9ab805694fd1b7a8712447153a9764ca5e42c2dfbc66c711')

package() {
    install -D "${srcdir}/shelby" "${pkgdir}/usr/local/bin/shelby"
    install -D "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
