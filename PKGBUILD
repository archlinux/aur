# Maintainer: Jat <chat@jat.email>

pkgname=obs-multi-rtmp
pkgver=0.3.0.1
pkgrel=1
pkgdesc='Multiple RTMP outputs plugin'
arch=('x86_64')
url='https://github.com/sorayuki/obs-multi-rtmp'
license=('GPL')
depends=('obs-studio')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}-linux-x86_64.deb")
sha256sums=('7ee1e37bd00808cd969ad218018b2b01f0039fcb3c581df6cc7e27f8d9315631')

package() {
    cd "${srcdir}"

    tar -xf data.tar.gz -C "${pkgdir}"
}
