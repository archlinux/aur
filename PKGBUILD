# Maintainer: Alexander Daum <alexander.daum@mailbox.org>

pkgname=modustoolbox-gcc-system
pkgver=1.0
pkgrel=1
pkgdesc="Configures modustoolbox to use the system install of the arm-none-eabi gcc and binutils"
arch=('x86_64')
license=("LicenseRef-${pkgname}")
depends=('modustoolbox' 'arm-none-eabi-gcc' 'arm-none-eabi-newlib')
url=""
source=("file://${pkgname}.sh")
sha256sums=('a22c791de9d7002feb2c443b77bc57d9a6431b4c67b375a0c40274a981ddf895')
options=('!strip')

package() {
    cp "${pkgname}.sh" "${pkgdir}/etc/profile.d/${pkgname}.sh"
}
