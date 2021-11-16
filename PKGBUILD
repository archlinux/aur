#Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=ookla-speedtest-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Speedtest CLI by Ookla"
depends=("ca-certificates")
conflicts=("speedtest-cli")
arch=("x86_64" "i686" "aarch64" "arm" "armv6h" "armv7h")
options=(!strip)
url="https://www.speedtest.net/apps/cli"
license=("custom:Ookla EULA")

source_x86_64=("https://install.speedtest.net/app/cli/ookla-speedtest-${pkgver}-x86_64-linux.tgz")
source_i686=("https://install.speedtest.net/app/cli/ookla-speedtest-${pkgver}-i386-linux.tgz")
source_aarch64=("https://install.speedtest.net/app/cli/ookla-speedtest-${pkgver}-aarch64-linux.tgz")
source_arm=("https://install.speedtest.net/app/cli/ookla-speedtest-${pkgver}-arm-linux.tgz")
source_armv6h=("https://install.speedtest.net/app/cli/ookla-speedtest-${pkgver}-arm-linux.tgz")
source_armv7h=("https://install.speedtest.net/app/cli/ookla-speedtest-${pkgver}-armhf-linux.tgz")

sha256sums_x86_64=('fcd58df06eaeaa89237214a735c0b7154d6a0ec3a3b78261da40a765ce41f47f')
sha256sums_i686=('07da43e0d006fe374f0bfb63e7fc4894e18ae4bfb1d0243ac4b105ca7294a6ee')
sha256sums_aarch64=('9323ab0a10b74bc927e00acee48ca5148b2d4bf377a57c41571e19588eb4d285')
sha256sums_arm=('b3b59ec2c6e1f5162ca526ea1e74014b695552feb3e902d07fc0e431d729ed25')
sha256sums_armv6h=('b3b59ec2c6e1f5162ca526ea1e74014b695552feb3e902d07fc0e431d729ed25')
sha256sums_armv7h=('568db87c76a1a04de292dc8f2bf282e7a1172cfea4a58c684daca1bc1046580c')

package() {
  install -Dm755 "${srcdir}/speedtest" "${pkgdir}/usr/bin/speedtest"
  install -Dm644 "${srcdir}/speedtest.5" "${pkgdir}/usr/share/man/man5/speedtest.5"
}
