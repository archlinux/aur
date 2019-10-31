#Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=ookla-speedtest-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="Speedtest CLI by Ookla"
depends=("ca-certificates")
conflicts=("speedtest-cli")
arch=("x86_64" "i686" "arm" "aarch64")
options=(!strip)
url="https://www.speedtest.net/apps/cli"
license=("custom:Ookla EULA")

source_x86_64=("https://ookla.bintray.com/download/ookla-speedtest-${pkgver}-x86_64-linux.tgz")
source_i686=("https://ookla.bintray.com/download/ookla-speedtest-${pkgver}-i386-linux.tgz")
source_arm=("https://ookla.bintray.com/download/ookla-speedtest-${pkgver}-arm-linux.tgz")
source_aarch64=("https://ookla.bintray.com/download/ookla-speedtest-${pkgver}-aarch64-linux.tgz")

sha256sums_x86_64=('5fe2028f0d4427e4f4231d9f9cf70e6691bb890a70636d75232fe4d970633168')
sha256sums_i686=('828362e559e53d80b3579df032fe756a0993cf33934416fa72e9d69c8025321b')
sha256sums_arm=('0fa7b3237d0fe4fa15bc1e7cb27ccac63b02a2679b71c2879d59dd75d3c9235d')
sha256sums_aarch64=('073684dc3490508ca01b04c5855e04cfd797fed33f6ea6a6edc26dfbc6f6aa9e')

package() {
  install -Dm755 "${srcdir}/speedtest" "${pkgdir}/usr/bin/speedtest"
  install -Dm644 "${srcdir}/speedtest.5" "${pkgdir}/usr/share/man/man5/speedtest.5"
}
