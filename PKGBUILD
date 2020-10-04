# Maintainer: 1Conan <me@1conan.com>

pkgname=checkra1n-cli
pkgver=0.11.0
pkgrel=2
pkgdesc="checkra1n is a semi-tethered jailbreak, developed primarily by Luca Todesco (qwertyoruiop). It's based on the checkm8 bootrom exploit released by axi0mx. checkra1n supports iOS 12.0 and newer."
license=('unknown')
url="https://checkra.in"
conflicts=('checkra1n')
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')

sha256sums_x86_64=('fa08102ba978746ff38fc4c1a0d2e8f231c2cbf79c7ef6d7b504e4683a5b7d05')
source_x86_64=("https://assets.checkra.in/downloads/linux/cli/x86_64/${sha256sums_x86_64[0]}/checkra1n")

sha256sums_arm=('d751f4b245bd4071c571654607ca4058e9e7dc4a5fa30639024b6067eebf5c3b')
source_arm=("https://assets.checkra.in/downloads/linux/cli/arm/${sha256sums_arm[0]}/checkra1n")

sha256sums_armv6h=($sha256sums_arm)
source_armv6h=($source_arm)

sha256sums_armv7h=($sha256sums_arm)
source_armv7h=($source_arm)

sha256sums_aarch64=('b48774e5d240ce192016a3fa97df7ef855220576f0704c83ed627d092cb2e224')
source_aarch64=("https://assets.checkra.in/downloads/linux/cli/arm64/${sha256sums_aarch64[0]}/checkra1n")

sha256sums_i686=('6f3885184dbdb5af4fec8c57e5684f914b9838ce7d6f78db5e9d2687d741b8f1')
source_i686=("https://assets.checkra.in/downloads/linux/cli/i486/${sha256sums_i686[0]}/checkra1n")

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp checkra1n* "${pkgdir}/usr/bin/checkra1n"
  chmod +x "${pkgdir}/usr/bin/checkra1n"
}
