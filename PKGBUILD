# Maintainer: pusi77 <pusineriandrea+gmail+com>
# Contributor: pusi77-robot <pusineriandrea+gmail+com>

pkgname=awsm-bin
pkgver=1.1.3
pkgrel=1
pkgdesc='A fast command-line tool to manage your AWS profiles, sessions, and console access with ease'
arch=('x86_64')
url="https://github.com/AleG03/awsm"
license=('BSL-1.1')
provides=('awsm')
conflicts=('awsm')
source=("https://github.com/AleG03/awsm/releases/download/v${pkgver}/awsm_${pkgver}_linux_amd64.tar.gz")
sha256sums=('380a58bdfeb860f51d493dc41d6793ecef4696df4bf12e647b4e3c0188ba0d7c')

package() {
  install -Dm755 ${pkgname%-bin} "$pkgdir"/usr/bin/${pkgname%-bin}
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
