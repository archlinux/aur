# Maintainer: pusi77 <pusineriandrea+gmail+com>
# Contributor: pusi77-robot <pusineriandrea+gmail+com>

pkgname=awsm-bin
pkgver=1.4.5
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
sha256sums_x86_64=('ad6f01946d36de68b0d2aeeb29ed27289ec782b4a431a7c42cd82f4b6d1a1455')
sha256sums_aarch64=('4ee05fffe101868c825b744eda260d1089f23924a5a2db0c70054b2ca2fd7b54')
