# Maintainer: Jat <chat@jat.email>

pkgname=obs-multi-rtmp
pkgver=0.5.0.1
pkgrel=1
pkgdesc='Multiple RTMP outputs plugin'
arch=('x86_64')
url='https://github.com/sorayuki/obs-multi-rtmp'
license=('GPL')
depends=('obs-studio')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}-linux-x86_64.deb")
sha256sums=('5c21b579200c906a3af13d1d71e7d5f3db23c4b5ffce8ade799729fbd5ec23f2')

package() {
    cd "${srcdir}"
    tar -xf data.tar.gz -C "${pkgdir}"

    cd "${pkgdir}"
    mv usr/lib/x86_64-linux-gnu/obs-plugins usr/lib
    rm -r usr/lib/x86_64-linux-gnu
}
