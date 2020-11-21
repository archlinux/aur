# Maintainer: 1Conan <me@1conan.com>

pkgname=checkra1n-cli
pkgver=0.12.1
pkgrel=1
pkgdesc="checkra1n is a semi-tethered jailbreak, developed primarily by Luca Todesco (qwertyoruiop). It's based on the checkm8 bootrom exploit released by axi0mx. checkra1n supports iOS 12.0 and newer."
license=('unknown')
url="https://checkra.in"
conflicts=('checkra1n')
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')

sha256sums_x86_64=('63282886157dd08079c8e41522fdc6d58cfecda783ea8cca79ffc1116f13c355')
source_x86_64=("https://assets.checkra.in/downloads/linux/cli/x86_64/${sha256sums_x86_64[0]}/checkra1n")

sha256sums_arm=('1e0082c5ea7c62f17c54ce4cc709a4daf452b93bea7e9d9bc23799656ee56df9')
source_arm=("https://assets.checkra.in/downloads/linux/cli/arm/${sha256sums_arm[0]}/checkra1n")

sha256sums_armv6h=($sha256sums_arm)
source_armv6h=($source_arm)

sha256sums_armv7h=($sha256sums_arm)
source_armv7h=($source_arm)

sha256sums_aarch64=('bf5a0f30e208ec525617e1658dde27513fcca6e37ede1b6b361b7bae1ec7754b')
source_aarch64=("https://assets.checkra.in/downloads/linux/cli/arm64/${sha256sums_aarch64[0]}/checkra1n")

sha256sums_i686=('7ea7cc69d58308e2e96bc9f40f63f4f135d3b8fafd49a1bb4f4a849876f49fdb')
source_i686=("https://assets.checkra.in/downloads/linux/cli/i486/${sha256sums_i686[0]}/checkra1n")

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mv checkra1n* "${pkgdir}/usr/bin/checkra1n"
  chmod +x "${pkgdir}/usr/bin/checkra1n"
}
