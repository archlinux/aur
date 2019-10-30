#Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=ookla-speedtest-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Speedtest CLI by Ookla"
depends=("ca-certificates")
conflicts=("speedtest-cli")
arch=("x86_64")
options=(!strip)
source=("https://ookla.bintray.com/download/ookla-speedtest-${pkgver}-x86_64-linux.tgz")
url="https://www.speedtest.net/apps/cli"
license=("custom:Ookla EULA")
sha256sums=('5fe2028f0d4427e4f4231d9f9cf70e6691bb890a70636d75232fe4d970633168')

package() {
  install -Dm755 "${srcdir}/speedtest" "${pkgdir}/usr/bin/speedtest"
  install -Dm644 "${srcdir}/speedtest.5" "${pkgdir}/usr/share/man/man5/speedtest.5"
}
