# Maintainer: Francisco Lopes <francisco@oblita.com>
pkgname=continuous-silence
pkgver=1.0.1
pkgrel=1
pkgdesc='Continuous silence hack to ensure short audio playback'
arch=('x86_64')
license=('GPL3')
url='https://unix.stackexchange.com/questions/362223'
depends=('sox')
source=('continuous-silence.service')
md5sums=('e3c10934dc34ae4578f9087f3e626e16')

package() {
    mkdir -p "${pkgdir}/usr/lib/systemd/user"
    install -m 644 "${srcdir}/continuous-silence.service" "${pkgdir}/usr/lib/systemd/user"
}
