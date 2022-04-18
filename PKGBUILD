# Maintainer: Hisbaan Noorani <hisbaan@gmail.com>
pkgname=didyoumean-bin
pkgver=1.1.0
pkgrel=1
epoch=
pkgdesc="A CLI spelling corrector"
arch=('x86_64')
url="https://github.com/hisbaan/didyoumean"
license=('GPL3')
depends=('xorg-server' 'wayland')
provides=('dym')
replaces=('dym')
source=("https://github.com/hisbaan/didyoumean/releases/download/v1.1.0/dym-1.1.0-x86_64.tar.gz")
sha256sums=("df03a3297bcc7e769d8a32ad0b427624527a40a9ef7d07d97215a5171b9a408e")

package() {
    cd "$srcdir/"

    install -Dm755 dym -t "${pkgdir}/usr/bin/"
}
