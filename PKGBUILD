# Maintainer: XYenon <i at xyenon dot bid>

pkgname=go-cqhttp-bin

pkgver=v1.0.0_beta8_fix2
pkgrel=1

pkgdesc="Lightweight, native cross-platform implementation of cqhttp in Golang."
arch=("i686" "x86_64" "armv7h" "aarch64")
url="https://github.com/Mrs4s/go-cqhttp/releases"
license=("AGPL3")

optdepends=("ffmpeg: support voice sending in any format")

provides=('go-cqhttp')

source_i686=("${pkgname}-i686-${pkgver//_/-}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${pkgver//_/-}/go-cqhttp_linux_386.tar.gz")
source_x86_64=("${pkgname}-x86_64-${pkgver//_/-}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${pkgver//_/-}/go-cqhttp_linux_amd64.tar.gz")
source_armv7h=("${pkgname}-armv7h-${pkgver//_/-}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${pkgver//_/-}/go-cqhttp_linux_armv7.tar.gz")
source_aarch64=("${pkgname}-aarch64-${pkgver//_/-}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${pkgver//_/-}/go-cqhttp_linux_arm64.tar.gz")

sha512sums_i686=('c352f35fd68dd1a308dfa9e189cfd1d419adf08b98d631e3c0b92eba5e00573e6f6a4a709fe41fd6568e16a96920c2594b3ea0aa7e86b395436dcd2ac875d31b')
sha512sums_x86_64=('a4a9d5daa74acd1119be364f330dd6c14b4c46065da34c1451f1557efc6181dbd06decbba5a320c94eab23cd22580c74b6283c9b9755859c771f3deeb5010853')
sha512sums_armv7h=('0ccc622ed9acf82df1c8d20e720d8370c34a91f2aa28f4f3590739bb62b7600145269df36515f5daac053bd1ec9462ec355268a60241f65759bf977c3e688ddc')
sha512sums_aarch64=('f62ac5f09ee462cdd2547c5aa5641ce2ae05cbbd28344d24e6f8b501f8b24155f55a0d66baa271413a705bf299bb0050fb42d0330b99b4031bcafbeb7aebe104')

package() {
    cd ${srcdir}
    install -Dm755 "go-cqhttp" "${pkgdir}/usr/bin/go-cqhttp"
}
