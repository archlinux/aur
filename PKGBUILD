# Maintainer: Jat <chat@jat.email>

pkgname=obs-multi-rtmp
pkgver=0.3.0.2
pkgrel=1
pkgdesc='Multiple RTMP outputs plugin'
arch=('x86_64')
url='https://github.com/sorayuki/obs-multi-rtmp'
license=('GPL')
depends=('obs-studio')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}-linux-x86_64.deb")
sha256sums=('28749e3e5312a23096a5d417fe4a19dc6ce2979ea7203ecc45fa102fba35991c')

package() {
    cd "${srcdir}"
    tar -xf data.tar.gz -C "${pkgdir}"

    cd "${pkgdir}"
    mv usr/lib/x86_64-linux-gnu/obs-plugins usr/lib
    rm -r usr/lib/x86_64-linux-gnu
}
