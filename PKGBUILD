# Maintainer: pusi77 <pusineriandrea+gmail+com>

pkgname=awsm-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='A fast command-line tool to manage your AWS profiles, sessions, and console access with ease'
arch=('x86_64')
url="https://github.com/AleG03/awsm"
license=('MIT')
provides=('awsm')
conflicts=('awsm')
source=("$pkgname-$pkgver.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('8f577dd1c3eb9178c272bb3e1b5d44c9fd351a6c976d8224ae07a16200f933e9')

package() {
  install -Dm755 ${pkgname%-bin} "$pkgdir"/usr/bin/${pkgname%-bin}
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
