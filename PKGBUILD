# Maintainer: 1Conan <me@1conan.com>

pkgname=checkra1n-cli
pkgver=0.12.2
pkgrel=1
pkgdesc="checkra1n is a semi-tethered jailbreak, developed primarily by Luca Todesco (qwertyoruiop). It's based on the checkm8 bootrom exploit released by axi0mx. checkra1n supports iOS 12.0 and newer."
license=('unknown')
url="https://checkra.in"
conflicts=('checkra1n')
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')

sha256sums_x86_64=('4bf2f7e1dd201eda7d6220350db666f507d6f70e07845b772926083a8a96cd2b')
source_x86_64=("https://assets.checkra.in/downloads/linux/cli/x86_64/${sha256sums_x86_64[0]}/checkra1n")

sha256sums_arm=('f060f8e27005b553de42b04abd0af6b18eeacd005e68b126e991c6096f51b0b7')
source_arm=("https://assets.checkra.in/downloads/linux/cli/arm/${sha256sums_arm[0]}/checkra1n")

sha256sums_armv6h=($sha256sums_arm)
source_armv6h=($source_arm)

sha256sums_armv7h=($sha256sums_arm)
source_armv7h=($source_arm)

sha256sums_aarch64=('11c0a214dc0fc19050a8103ed5b0ebf4874df3191e34491e177f3af3baced0e7')
source_aarch64=("https://assets.checkra.in/downloads/linux/cli/arm64/${sha256sums_aarch64[0]}/checkra1n")

sha256sums_i686=('7926a90f4d0b73bdc514bd813e1443e4fc579e1674e34622b4bd1002a3322e0f')
source_i686=("https://assets.checkra.in/downloads/linux/cli/i486/${sha256sums_i686[0]}/checkra1n")

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mv checkra1n* "${pkgdir}/usr/bin/checkra1n"
  chmod +x "${pkgdir}/usr/bin/checkra1n"
}
