# Maintainer: Francisco Lopes <francisco@oblita.com>
pkgname=continuous-silence
pkgver=1.0.0
pkgrel=1
pkgdesc='Continuous silence hack to ensure short audio playback'
arch=('x86_64')
license=('GPL3')
url='https://unix.stackexchange.com/questions/362223'
depends=('sox')
source=('continuous-silence.service')
md5sums=('618ebd045a15c5742885435a79ba1b5c')

package() {
    mkdir -p "${pkgdir}/usr/lib/systemd/user"
    install -m 644 "${srcdir}/continuous-silence.service" "${pkgdir}/usr/lib/systemd/user"
}
