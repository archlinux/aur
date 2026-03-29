# Maintainer: Tu Nombre <tu@email.com>
pkgname=tofu-bin
pkgver=0.0.3
pkgrel=1
pkgdesc="Offline, encrypted TOTP manager for the terminal. Trust On First Use."
arch=('x86_64')
url="https://github.com/Thecloudff7/tofu"
license=('MIT')
provides=('tofu')
conflicts=('tofu' 'tofu-git')
source=("tofu-${pkgver}::$url/releases/download/v${pkgver}/tofu-linux-x64")
sha256sums=('8baad1d3b5830792de3c507cd354f7a3516c134aff33e43bee3befb9e76b6f40')

package() {
    install -Dm755 "$srcdir/tofu-${pkgver}" "$pkgdir/usr/bin/tofu"
}
