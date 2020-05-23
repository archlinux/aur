# Maintainer: 1Conan <me@1conan.com>

pkgname=checkra1n-cli
pkgver=0.10.2
pkgrel=1
pkgdesc="checkra1n is a semi-tethered jailbreak, developed primarily by Luca Todesco (qwertyoruiop). It's based on the checkm8 bootrom exploit released by axi0mx. checkra1n supports iOS 12.3 and newer."
license=('unknown')
url="https://checkra.in"
conflicts=('checkra1n')
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')

sha256sums_x86_64=('607faa865e90e72834fce04468ae4f5119971b310ecf246128e3126db49e3d4f')
source_x86_64=("https://assets.checkra.in/downloads/linux/cli/x86_64/${sha256sums_x86_64[0]}/checkra1n")

sha256sums_arm=('1ed46fb34c72ee942a1af185fd5347b999f4bba667d594dd56554e3b3d3ea417')
source_arm=("https://assets.checkra.in/downloads/linux/cli/arm/${sha256sums_arm[0]}/checkra1n")

sha256sums_armv6h=($sha256sums_arm)
source_armv6h=($source_arm)

sha256sums_armv7h=($sha256sums_arm)
source_armv7h=($source_arm)

sha256sums_aarch64=('32cc7d1bd687800d1b5bc5cfc4f4ca15f393dada7570e78742eab068b1f2a3e2')
source_aarch64=("https://assets.checkra.in/downloads/linux/cli/arm64/${sha256sums_aarch64[0]}/checkra1n")

sha256sums_i686=('53d45283b5616d9f0daa8a265362b65a33ce503b3088528cc2839544e166d4c6')
source_i686=("https://assets.checkra.in/downloads/linux/cli/i486/${sha256sums_i686[0]}/checkra1n")

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp checkra1n-* "${pkgdir}/usr/bin/checkra1n"
  chmod +x "${pkgdir}/usr/bin/checkra1n"
}
