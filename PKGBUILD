#Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=ookla-speedtest-bin
pkgver=1.2.0
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

sha256sums_x86_64=('5690596c54ff9bed63fa3732f818a05dbc2db19ad36ed68f21ca5f64d5cfeeb7')
sha256sums_i686=('9ff7e18dbae7ee0e03c66108445a2fb6ceea6c86f66482e1392f55881b772fe8')
sha256sums_aarch64=('3953d231da3783e2bf8904b6dd72767c5c6e533e163d3742fd0437affa431bd3')
sha256sums_arm=('629a455a2879224bd0dbd4b36d8c721dda540717937e4660b4d2c966029466bf')
sha256sums_armv6h=('629a455a2879224bd0dbd4b36d8c721dda540717937e4660b4d2c966029466bf')
sha256sums_armv7h=('e45fcdebbd8a185553535533dd032d6b10bc8c64eee4139b1147b9c09835d08d')

package() {
  install -Dm755 "${srcdir}/speedtest" "${pkgdir}/usr/bin/speedtest"
  install -Dm644 "${srcdir}/speedtest.5" "${pkgdir}/usr/share/man/man5/speedtest.5"
}
