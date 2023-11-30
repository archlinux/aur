# Maintainer: Jat <chat@jat.email>

pkgname=obs-multi-rtmp
pkgver=0.5.0.4
pkgrel=1
pkgdesc='Multiple RTMP outputs plugin'
arch=('x86_64')
url='https://github.com/sorayuki/obs-multi-rtmp'
license=('GPL')
depends=('obs-studio')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}-x86_64-linux-gnu.deb")
sha256sums=('40a29f6e83d132b16ecb6b85c826af7b497e625a4c3bddc670ab885109931c87')

package() {
    cd "${srcdir}" || exit
    tar -xf data.tar.gz -C "${pkgdir}"

    cd "${pkgdir}" || exit
    mv usr/lib/x86_64-linux-gnu/obs-plugins usr/lib
    rm -r usr/lib/x86_64-linux-gnu
}
