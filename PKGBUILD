# Maintainer: pusi77 <pusineriandrea+gmail+com>
# Contributor: pusi77-robot <pusineriandrea+gmail+com>

pkgname=awsm-bin
pkgver=1.4.3
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
sha256sums_x86_64=('b421ac7679293b093650bd39e9fb8076bfb24986ae0821b6ceff0c40d80553df')
sha256sums_aarch64=('cea411b99f053a47b124bcd86ddd911a104cf3b5637da9bb92f821cf196a08bc')
