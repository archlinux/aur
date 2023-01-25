# Maintainer: Tal <talwat321@gmail.com>
pkgname=pap-bin
pkgver="0.10.2"
pkgrel=1
pkgdesc='a simplistic papermc helper (pre-compiled)'
url='https://github.com/talwat/pap'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
sha256sums_i686=('eb67e54b38815de430c175fe5961ae5b74576a0607ed4bb12a1f514b55b944fb')
sha256sums_x86_64=('eab6263f5a39b7a0f2df4eaebd27142a2d82a4563768e159db872ede48f66a5e')
sha256sums_armv7h=('73e47fa39ab2de83f53b0bd8bfbfe21014a277bd6bf704d90934ea67804bb23b')
sha256sums_armv6h=('52f537025915685d52fafce7b3132a1f07164781c0ab1466d88f2284208ff9fb')
sha256sums_aarch64=('f9a3e562458f6afa592838c996883fa5d8a1a52828653af30e3bcacede5c44d8')

source_x86_64=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_x86_64")
source_i686=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_i386")
source_armv6h=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_armv6")
source_armv7h=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_armv7")
source_aarch64=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_arm64")

conflicts=('pap')
provides=('pap')
optdepends=('java-runtime: running the downloaded jarfiles')

package() {
  install -Dm755 pap_${pkgver}_linux_* "${pkgdir}"/usr/bin/pap
}
