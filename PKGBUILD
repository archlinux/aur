# Maintainer: pusi77 <pusineriandrea+gmail+com>

pkgname=awsm-bin
pkgver=0.2.3
pkgrel=1
pkgdesc='A fast command-line tool to manage your AWS profiles, sessions, and console access with ease'
arch=('x86_64')
url="https://github.com/AleG03/awsm"
license=('MIT')
provides=('awsm')
conflicts=('awsm')
source=("$pkgname-$pkgver.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('b45be829af341a96c1e427d301ddb83b9936989866462765dfcee58604e42688')

package() {
  install -Dm755 ${pkgname%-bin} "$pkgdir"/usr/bin/${pkgname%-bin}
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
