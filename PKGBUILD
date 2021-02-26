# Maintainer: Mohammad Abdolirad <m.abdolirad@gmail.com>

pkgname=wait4x-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Waiting for a port to enter into specify state"
arch=('x86_64')
url="https://github.com/atkrad/wait4x"
license=('Apache')
provides=('wait4x')
conflicts=('wait4x')
depends=('glibc')
source=("${pkgname}-$pkgver::https://github.com/atkrad/wait4x/releases/download/v$pkgver/wait4x-linux-amd64")
sha256sums=('902d9b9dbfb14691abd000e4ce2e1bdc84782d5dbf263ace231aad4f36e3f9ad')

package() {
        install -Dm 755 "${pkgname}-$pkgver" "$pkgdir/usr/bin/wait4x"
}
