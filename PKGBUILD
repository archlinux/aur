# Maintainer: Shashoto Nur shashoto.nur@proton.me
pkgname=fahplay
pkgver=1.0.0
pkgrel=1
pkgdesc="Plays 'fahhhhh' when a shell command fails (Bash/Zsh)"
arch=('any')
url="https://github.com/shashotoNur/${pkgname}"
license=('GPL3')
depends=('alsa-utils')
install=${pkgname}.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/shashotoNur/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('76e1a57e1f71caa466ac739e5f790507521aa0042c645b2c5da02a85e6af7e7c')

package() {
    cd "$pkgname-$pkgver"

    install -Dm644 ${pkgname}.wav "${pkgdir}/usr/share/${pkgname}/${pkgname}.wav"
    install -Dm755 ${pkgname}.sh "${pkgdir}/usr/share/${pkgname}/${pkgname}.sh"
}
