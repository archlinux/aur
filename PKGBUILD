# Maintainer: 1Conan <me@1conan.com>

pkgname=checkra1n-cli
pkgver=0.12.0
pkgrel=2
pkgdesc="checkra1n is a semi-tethered jailbreak, developed primarily by Luca Todesco (qwertyoruiop). It's based on the checkm8 bootrom exploit released by axi0mx. checkra1n supports iOS 12.0 and newer."
license=('unknown')
url="https://checkra.in"
conflicts=('checkra1n')
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')

sha256sums_x86_64=('5323e3cf5a2c2d12d39b4e8489bab0250c0c002e9d1c21213987f77936b3de6c')
source_x86_64=("https://assets.checkra.in/downloads/linux/cli/x86_64/${sha256sums_x86_64[0]}/checkra1n")

sha256sums_arm=('f2ae569ff84a0a95697bbf849490b139ecb1aa8133abb29d33e616ac63ae8489')
source_arm=("https://assets.checkra.in/downloads/linux/cli/arm/${sha256sums_arm[0]}/checkra1n")

sha256sums_armv6h=($sha256sums_arm)
source_armv6h=($source_arm)

sha256sums_armv7h=($sha256sums_arm)
source_armv7h=($source_arm)

sha256sums_aarch64=('81047292f1f35e595f2a6bb67f9226a6772ffbc51944aa4c7a7c806fa4698093')
source_aarch64=("https://assets.checkra.in/downloads/linux/cli/arm64/${sha256sums_aarch64[0]}/checkra1n")

sha256sums_i686=('a0d4a5e2046582188d8e1ccfa91579947ebe5ce4e3c27ea718a14ce69a780b88')
source_i686=("https://assets.checkra.in/downloads/linux/cli/i486/${sha256sums_i686[0]}/checkra1n")

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mv checkra1n* "${pkgdir}/usr/bin/checkra1n"
  chmod +x "${pkgdir}/usr/bin/checkra1n"
}
