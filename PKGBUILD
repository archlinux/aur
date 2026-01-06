# Maintainer: gogamlg3
pkgname=proton-ll-v3-bin
pkgver=10.1
pkgrel=1
pkgdesc="Proton (low-latency fork)"
arch=('x86_64')
url="https://github.com/Ph42oN/proton-ll"
license=('BSD')
depends=()
options=()

_pkgver=10-1
_asset="proton-ll-${_pkgver}-x86_64_v3.tar.xz"

source=("https://github.com/Ph42oN/proton-ll/releases/download/${_pkgver}/${_asset}")
sha256sums=('0e5706362439c0bcba902c009517eddf36cb0bc76f975fea743c3890709843a2')

package() {
    _destdir="$pkgdir/usr/share/steam/compatibilitytools.d/proton-ll-${_pkgver}-x86_64_v3"
    mkdir -p "$_destdir"

    tar -xJf "${srcdir}/${_asset}" -C "$pkgdir/usr/share/steam/compatibilitytools.d/"
    chown -R root:root "$_destdir" || true

}
