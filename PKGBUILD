# Maintainer: Jat <chat@jat.email>

pkgname=obs-multi-rtmp
pkgver=0.6.0.1
pkgrel=2
pkgdesc='Multiple RTMP outputs plugin for OBS Studio.'
arch=('x86_64')
url='https://github.com/sorayuki/obs-multi-rtmp'
license=('GPL')
depends=('obs-studio')
source=("${url}/releases/download/${pkgver}-obs31/${pkgname}-${pkgver}-x86_64-linux-gnu.tar.xz")
sha256sums=('3840bd312208163661c4c78420b9ab844d88fa06098ffcd7fe1c451d8e3da888')

package() {
    cd "${pkgdir}"

    mkdir -p usr/lib/obs-plugins
    mkdir -p usr/share/obs/obs-plugins/obs-multi-rtmp

    prefix="${srcdir}/obs-multi-rtmp"
    cp -a "${prefix}/bin/64bit/"* usr/lib/obs-plugins
    cp -a "${prefix}/data/"* usr/share/obs/obs-plugins/obs-multi-rtmp
}
