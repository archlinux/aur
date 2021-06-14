# Maintainer: 1Conan <me@1conan.com>

pkgname=checkra1n-cli
pkgver=0.12.4
pkgrel=3
pkgdesc="A semi-tethered jailbreak, developed primarily by Luca Todesco (qwertyoruiop). It's based on the checkm8 bootrom exploit released by axi0mx. Supports iOS 12.0 and newer."
license=('unknown')
url="https://checkra.in"
depends=('usbmuxd')
conflicts=('checkra1n')
options=('!strip')
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')

sha256sums_x86_64=('dac9968939ea6e6bfbdedeb41d7e2579c4711dc2c5083f91dced66ca397dc51d')
source_x86_64=("${pkgname}-${pkgver}-${pkgrel}-x86_64::https://assets.checkra.in/downloads/linux/cli/x86_64/${sha256sums_x86_64[0]}/checkra1n")

sha256sums_arm=('ff05dfb32834c03b88346509aec5ca9916db98de3019adf4201a2a6efe31e9f5')
source_arm=("${pkgname}-${pkgver}-${pkgrel}-arm::https://assets.checkra.in/downloads/linux/cli/arm/${sha256sums_arm[0]}/checkra1n")

sha256sums_armv6h=($sha256sums_arm)
source_armv6h=($source_arm)

sha256sums_armv7h=($sha256sums_arm)
source_armv7h=($source_arm)

sha256sums_aarch64=('43019a573ab1c866fe88edb1f2dd5bb38b0caf135533ee0d6e3ed720256b89d0')
source_aarch64=("${pkgname}-${pkgver}-${pkgrel}-aarch64::https://assets.checkra.in/downloads/linux/cli/arm64/${sha256sums_aarch64[0]}/checkra1n")

sha256sums_i686=('77779d897bf06021824de50f08497a76878c6d9e35db7a9c82545506ceae217e')
source_i686=("${pkgname}-${pkgver}-${pkgrel}-i686::https://assets.checkra.in/downloads/linux/cli/i486/${sha256sums_i686[0]}/checkra1n")

package() {
  install -Dm 755 \
    ${srcdir}/${pkgname}-${pkgver}-${pkgrel}-* \
    ${pkgdir}/usr/bin/checkra1n
}
