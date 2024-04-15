# Maintainer: Jat <chat@jat.email>

pkgname=obs-multi-rtmp
pkgver=0.6.0.1
pkgrel=1
pkgdesc='Multiple RTMP outputs plugin for OBS Studio.'
arch=('x86_64')
url='https://github.com/sorayuki/obs-multi-rtmp'
license=('GPL')
depends=('obs-studio')
source=("${url}/releases/download/${pkgver}/${pkgname}-0.6.0.0-x86_64-linux-gnu.tar.xz")
sha256sums=('981d303686b16587d6f785f2805791cf917239d13229dd31374935ffff028f52')

package() {
    cd "${pkgdir}"

    mkdir -p usr/lib/obs-plugins
    mkdir -p usr/share/obs/obs-plugins/obs-multi-rtmp

    prefix="${srcdir}/obs-multi-rtmp"
    cp -a "${prefix}/bin/64bit/"* usr/lib/obs-plugins
    cp -a "${prefix}/data/"* usr/share/obs/obs-plugins/obs-multi-rtmp
}
