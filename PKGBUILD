# Maintainer: Nogweii <me@aether.earth>
# shellcheck shell=bash disable=SC2034
pkgname=alpm-reboot-required
pkgver=0.2.0
pkgrel=1
pkgdesc="Hook that creates an empty file to indicate a reboot is required"
arch=(any)
url=""
license=('GPL3')
depends=('pacman')
source=("reboot-required.hook")

sha512sums=('200b9ada0d80d525d1635513346b2aa09580723a8cfb24ce5a2b434117e5b57a42e00a32375b4b9059b0d8ff669def317c5f12c7fa0de72e856932182a8d30f0')
b2sums=('408d6e3ab0d55f715fe60e8c407c9a2e14e6f8f420a84c5f57cc1efde8a6bcfee14a52734986a86ccf8607c4cdcb9147886b94683e718a6c83b5e99a5e428e68')

build() {
    # nothing to do
    :
}

package() {
    cd "${srcdir}/"

    install -D -m 0644 reboot-required.hook -t "${pkgdir}/usr/share/libalpm/hooks/"
}
