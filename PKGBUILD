# Maintainer: 1Conan <me@1conan.com>

pkgname=checkra1n-cli
pkgver=0.9.8.1
pkgrel=2
pkgdesc="checkra1n is a semi-tethered jailbreak, developed primarily by Luca Todesco (qwertyoruiop). It's based on the checkm8 bootrom exploit released by axi0mx. checkra1n supports iOS 12.3 and newer."
license=('unknown')
url="https://checkra.in"
conflicts=('checkra1n')
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')

source_x86_64=('https://assets.checkra.in/downloads/linux/cli/x86_64/3283cab4ad44dd1ded467ed403ba5f603c6de015a7c3bdf0b1f9ef211cd06b6d/checkra1n')
sha256sums_x86_64=('3283cab4ad44dd1ded467ed403ba5f603c6de015a7c3bdf0b1f9ef211cd06b6d')

source_arm=('https://assets.checkra.in/downloads/linux/cli/arm/0848bac6a57dc0d9a64ff129a253e24efcb535434a065373a63b8e9ef4fe63ac/checkra1n')
sha256sums_arm=('0848bac6a57dc0d9a64ff129a253e24efcb535434a065373a63b8e9ef4fe63ac')

source_armv6h=('https://assets.checkra.in/downloads/linux/cli/arm/0848bac6a57dc0d9a64ff129a253e24efcb535434a065373a63b8e9ef4fe63ac/checkra1n')
sha256sums_armv6h=('0848bac6a57dc0d9a64ff129a253e24efcb535434a065373a63b8e9ef4fe63ac')

source_armv7h=('https://assets.checkra.in/downloads/linux/cli/arm/0848bac6a57dc0d9a64ff129a253e24efcb535434a065373a63b8e9ef4fe63ac/checkra1n')
sha256sums_armv7h=('0848bac6a57dc0d9a64ff129a253e24efcb535434a065373a63b8e9ef4fe63ac')

source_aarch64=('https://assets.checkra.in/downloads/linux/cli/arm64/22b44f8b3fb5536d67057951629648bda3e3406c9afb042151de89ff24592ea7/checkra1n')
sha256sums_aarch64=('22b44f8b3fb5536d67057951629648bda3e3406c9afb042151de89ff24592ea7')

source_i686=('https://assets.checkra.in/downloads/linux/cli/i486/f7db665fc668edf610a779102c0d41db6bcfc24df9868064091e4b7993891982/checkra1n')
sha256sums_i686=('f7db665fc668edf610a779102c0d41db6bcfc24df9868064091e4b7993891982')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp checkra1n "${pkgdir}/usr/bin"
  chmod +x "${pkgdir}/usr/bin/checkra1n"
}

