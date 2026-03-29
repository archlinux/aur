# Maintainer: Tu Nombre <tu@email.com>
pkgname=tofu-bin
pkgver=0.0.2
pkgrel=1
pkgdesc="Offline, encrypted TOTP manager for the terminal. Trust On First Use."
arch=('x86_64')
url="https://github.com/Thecloudff7/tofu"
license=('MIT')
provides=('tofu')
conflicts=('tofu' 'tofu-git')
source=("tofu-${pkgver}::$url/releases/download/v${pkgver}/tofu-linux-x64")
sha256sums=('f8c3ff43f99b297424d484f75e06d461228d134541c745cba1b816f4bc56b3ba')

package() {
    install -Dm755 "$srcdir/tofu-${pkgver}" "$pkgdir/usr/bin/tofu"
}
