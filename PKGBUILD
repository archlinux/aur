# Maintainer: Jat <chat@jat.email>

pkgname=obs-multi-rtmp
pkgver=0.4.0.3
pkgrel=1
pkgdesc='Multiple RTMP outputs plugin'
arch=('x86_64')
url='https://github.com/sorayuki/obs-multi-rtmp'
license=('GPL')
depends=('obs-studio')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}-linux-x86_64.deb")
sha256sums=('072e52d05a78e7abd3ab37b9816ecda046057c59cae44045ba02f34cf21812d0')

package() {
    cd "${srcdir}"
    tar -xf data.tar.gz -C "${pkgdir}"

    cd "${pkgdir}"
    mv usr/lib/x86_64-linux-gnu/obs-plugins usr/lib
    rm -r usr/lib/x86_64-linux-gnu
}
