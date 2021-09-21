# Maintainer: XYenon <i at xyenon dot bid>

pkgname=go-cqhttp-bin

pkgver=v1.0.0_beta7_fix2
pkgrel=1

pkgdesc="Lightweight, native cross-platform implementation of cqhttp in Golang."
arch=("i686" "x86_64" "armv7h" "aarch64")
url="https://github.com/Mrs4s/go-cqhttp/releases"
license=("AGPL3")

optdepends=("ffmpeg: support voice sending in any format")

source_i686=("${pkgname}-i686-${pkgver//_/-}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${pkgver//_/-}/go-cqhttp_linux_386.tar.gz")
source_x86_64=("${pkgname}-x86_64-${pkgver//_/-}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${pkgver//_/-}/go-cqhttp_linux_amd64.tar.gz")
source_armv7h=("${pkgname}-armv7h-${pkgver//_/-}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${pkgver//_/-}/go-cqhttp_linux_armv7.tar.gz")
source_aarch64=("${pkgname}-aarch64-${pkgver//_/-}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${pkgver//_/-}/go-cqhttp_linux_arm64.tar.gz")

sha512sums_i686=('569bf29953547d72dc032fd7ef87935797e80e118174243a5d0068b662ab8c584a4e8de958838deefb2c8f4afacace2b38b26f2f1159afdd9c6d1cd837344544')
sha512sums_x86_64=('e435965ad9a2f45df63a939d41fccbffd70cf9dd49e85ab16d1d2c8999323f8e0cb2db3c27fed7050a59acdcdf82f08c975e3646f97210f120fd992fca880012')
sha512sums_armv7h=('e75b888eadf22dbe3bc6090093bff4fdbf224a8e224a7cb51b1ebcd222152c66374cbb23f8ec03981b7f17597812b7f1ec61dd29b7efb2ea8334adf9e2be762e')
sha512sums_aarch64=('8d061e1ebff5b1863cc89d487202e8a80b0a6a288a2018e34b94b03fb0e32917a34d6bd85e4968e45bedea7529cb2bbe103f2caf0238e3d51f424a18a6840e98')

package() {
    cd ${srcdir}
    install -Dm755 "go-cqhttp" "${pkgdir}/usr/bin/go-cqhttp"
}
