# Maintainer: 1Conan <me@1conan.com>

pkgname=checkra1n-cli
pkgver=0.9.8.2
pkgrel=1
pkgdesc="checkra1n is a semi-tethered jailbreak, developed primarily by Luca Todesco (qwertyoruiop). It's based on the checkm8 bootrom exploit released by axi0mx. checkra1n supports iOS 12.3 and newer."
license=('unknown')
url="https://checkra.in"
conflicts=('checkra1n')
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')

source_x86_64=('https://assets.checkra.in/downloads/linux/cli/x86_64/9f215d8c5a1b6cea717c927b86840b9d1f713d42a24626be3a0408a4f6ba0f4d/checkra1n')
sha256sums_x86_64=('9f215d8c5a1b6cea717c927b86840b9d1f713d42a24626be3a0408a4f6ba0f4d')

source_arm=('https://assets.checkra.in/downloads/linux/cli/arm/c5cbb125c6948b39383702b62cec4f184263c8db50f49b9328013213126dae78/checkra1n')
sha256sums_arm=('c5cbb125c6948b39383702b62cec4f184263c8db50f49b9328013213126dae78')

source_armv6h=('https://assets.checkra.in/downloads/linux/cli/arm/c5cbb125c6948b39383702b62cec4f184263c8db50f49b9328013213126dae78/checkra1n')
sha256sums_armv6h=('c5cbb125c6948b39383702b62cec4f184263c8db50f49b9328013213126dae78')

source_armv7h=('https://assets.checkra.in/downloads/linux/cli/arm/c5cbb125c6948b39383702b62cec4f184263c8db50f49b9328013213126dae78/checkra1n')
sha256sums_armv7h=('c5cbb125c6948b39383702b62cec4f184263c8db50f49b9328013213126dae78')

source_aarch64=('https://assets.checkra.in/downloads/linux/cli/arm64/1985cee5704ed152d7a59efbcda5dab409824eeed5ebb23779965511b1733e28/checkra1n')
sha256sums_aarch64=('1985cee5704ed152d7a59efbcda5dab409824eeed5ebb23779965511b1733e28')

source_i686=('https://assets.checkra.in/downloads/linux/cli/i486/4785390cf41dfbf4478bce4b69a00ec00a82ebab0a1c8dc364a8fe1b6fc664c0/checkra1n')
sha256sums_i686=('4785390cf41dfbf4478bce4b69a00ec00a82ebab0a1c8dc364a8fe1b6fc664c0')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp checkra1n "${pkgdir}/usr/bin"
  chmod +x "${pkgdir}/usr/bin/checkra1n"
}

