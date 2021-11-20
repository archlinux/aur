#Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=ookla-speedtest-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Speedtest CLI by Ookla"
depends=("ca-certificates")
conflicts=("speedtest-cli")
arch=("x86_64" "i686" "aarch64" "arm" "armv6h" "armv7h")
options=(!strip)
url="https://www.speedtest.net/apps/cli"
license=("custom:Ookla EULA")

source_x86_64=("https://install.speedtest.net/app/cli/ookla-speedtest-${pkgver}-linux-x86_64.tgz")
source_i686=("https://install.speedtest.net/app/cli/ookla-speedtest-${pkgver}-linux-i386.tgz")
source_aarch64=("https://install.speedtest.net/app/cli/ookla-speedtest-${pkgver}-linux-aarch64.tgz")
source_arm=("https://install.speedtest.net/app/cli/ookla-speedtest-${pkgver}-linux-armel.tgz")
source_armv6h=("https://install.speedtest.net/app/cli/ookla-speedtest-${pkgver}-linux-armel.tgz")
source_armv7h=("https://install.speedtest.net/app/cli/ookla-speedtest-${pkgver}-linux-armhf.tgz")

sha256sums_x86_64=('970477fdfee4d741e75f088faf648f9b51c7be04313fb88ffb5de07eb1a3040c')
sha256sums_i686=('2854018a9319ff73d19212c497bb3c329dd53aae2fd28a1b5f94ede619c1d976')
sha256sums_aarch64=('276a40873fe1c3ca24a21580c2fc64aa92ed358ffc6db6071a13d03a8d431fd9')
sha256sums_arm=('87cd7e1790576a2cb2b3e5f5412f7dded553996487d49c991435e7544c10055b')
sha256sums_armv6h=('87cd7e1790576a2cb2b3e5f5412f7dded553996487d49c991435e7544c10055b')
sha256sums_armv7h=('78cf629619043535640a0a6de7a1c7b6f8d837768baee13e296655e3d830c3da')

package() {
  install -Dm755 "${srcdir}/speedtest" "${pkgdir}/usr/bin/speedtest"
  install -Dm644 "${srcdir}/speedtest.5" "${pkgdir}/usr/share/man/man5/speedtest.5"
}
