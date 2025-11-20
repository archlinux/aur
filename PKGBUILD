# Maintainer: pusi77 <pusineriandrea+gmail+com>
# Contributor: pusi77-robot <pusineriandrea+gmail+com>

pkgname=awsm-bin
pkgver=1.3.8
pkgrel=1
source_x86_64=("https://github.com/AleG03/awsm/releases/download/v${pkgver}/awsm_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/AleG03/awsm/releases/download/v${pkgver}/awsm_${pkgver}_linux_arm64.tar.gz")
pkgdesc='A fast command-line tool to manage your AWS profiles, sessions, and console access with ease'
arch=('x86_64' 'aarch64')
url="https://github.com/AleG03/awsm"
license=('BSL-1.1')
provides=('awsm')
conflicts=('awsm')

package() {
  install -Dm755 ${pkgname%-bin} "$pkgdir"/usr/bin/${pkgname%-bin}
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
sha256sums_x86_64=('6cea92e7cf963a6d1998132e5a291c007ca2eb960d879636bd31ef93a34a872c')
sha256sums_aarch64=('9407c8782d1ba54c5760a43fe6b56bb26cbe26b56b6d4d0133c417172fc2d6a9')
