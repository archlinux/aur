# Maintainer: Mohammad Abdolirad <m.abdolirad@gmail.com>

pkgname=wait4x-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Waiting for a port to enter into specify state"
arch=('x86_64')
url="https://github.com/atkrad/wait4x"
license=('Apache')
provides=('wait4x')
conflicts=('wait4x')
depends=('glibc')
source=("${pkgname}-$pkgver::https://github.com/atkrad/wait4x/releases/download/v$pkgver/wait4x-linux-amd64")
sha256sums=('1a802405923fe6fd49fb5d463c6ff7fac77a5b64cb5fb31de2a2e5edf50cff6a')

package() {
        install -Dm 755 "${pkgname}-$pkgver" "$pkgdir/usr/bin/wait4x"
}
