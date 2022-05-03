# Maintainer: Namkhai B. <echo hc.9mobkrof@em | rev>

_pkgname=rres
pkgname=${_pkgname}-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='A xrandr replacement to gather display resolutions'
arch=('x86_64')
url="https://gitlab.com/forkbomb9/rres"
license=('GPLv3')
provides=('rres')
conflicts=('rres')
source_x86_64=("https://gitlab.com/forkbomb9/${_pkgname}/uploads/dbd6dea1efc97679f377677f6d1899d6/${_pkgname}-v${pkgver}-${arch}-unknown-linux-musl")
sha256sums_x86_64=('f73969a7a0bc8afd78b06cdd6f20198286092a716bc470200a6da24765c85874')
b3sums_x86_64=('84c52d8027c08aa824109eef6500dfd9284ddf798f4b3b5f38e77e6fa1037d2d')

package() {
    install -Dm755 "${_pkgname}-v${pkgver}-${arch}-unknown-linux-musl" \
        -t "${pkgdir}/usr/bin/rres"
}
