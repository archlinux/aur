# Maintainer: 1Conan <me@1conan.com>

pkgname=checkra1n-cli
pkgver=0.10.1
pkgrel=2
pkgdesc="checkra1n is a semi-tethered jailbreak, developed primarily by Luca Todesco (qwertyoruiop). It's based on the checkm8 bootrom exploit released by axi0mx. checkra1n supports iOS 12.3 and newer."
license=('unknown')
url="https://checkra.in"
conflicts=('checkra1n')
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')

sha256sums_x86_64=('b0edbb87a5e084caf35795dcb3b088146ad5457235940f83e007f59ca57b319c')
source_x86_64=("https://assets.checkra.in/downloads/linux/cli/x86_64/${sha256sums_x86_64[0]}/checkra1n-x86_64")

sha256sums_arm=('1ed46fb34c72ee942a1af185fd5347b999f4bba667d594dd56554e3b3d3ea417')
source_arm=("https://assets.checkra.in/downloads/linux/cli/arm/${sha256sums_arm[0]}/checkra1n-armel")

sha256sums_armv6h=($sha256sums_arm)
source_armv6h=($source_arm)

sha256sums_armv7h=($sha256sums_arm)
source_armv7h=($source_arm)

sha256sums_aarch64=('ed074035bea72ae6a15a37c5900ed5bb4d0a74ccca5bc8c02f4575b45daecc3e')
source_aarch64=("https://assets.checkra.in/downloads/linux/cli/arm64/${sha256sums_aarch64[0]}/checkra1n-aarch64")

sha256sums_i686=('9b7a5c7821c8e06a334b854c5ffad7b28c56a5ac261afe3c6b647c9ba7185aee')
source_i686=("https://assets.checkra.in/downloads/linux/cli/i486/${sha256sums_i686[0]}/checkra1n-i486")

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp checkra1n-* "${pkgdir}/usr/bin/checkra1n"
  chmod +x "${pkgdir}/usr/bin/checkra1n"
}

