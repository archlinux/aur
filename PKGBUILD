# Maintainer: Jat <chat@jat.email>

pkgname=obs-multi-rtmp
pkgver=0.5.0.3
pkgrel=1
pkgdesc='Multiple RTMP outputs plugin'
arch=('x86_64')
url='https://github.com/sorayuki/obs-multi-rtmp'
license=('GPL')
depends=('obs-studio')
source=("${url}/releases/download/${pkgver}-OBS30/${pkgname}-${pkgver}-x86_64-linux-gnu.deb")
sha256sums=('0d609f5f67c7ae7f78a5b1ca637d4548b5470adedac3369e70e26786c7ac1e97')

package() {
    cd "${srcdir}" || exit
    tar -xf data.tar.gz -C "${pkgdir}"

    cd "${pkgdir}" || exit
    mv usr/lib/x86_64-linux-gnu/obs-plugins usr/lib
    rm -r usr/lib/x86_64-linux-gnu
}
