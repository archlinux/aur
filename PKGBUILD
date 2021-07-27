# Maintainer: Malachi Soord <me@malachisoord.com>

pkgname=ktunnel-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="A CLI that exposes your local resources to kubernetes."
arch=('x86_64')
url="https://github.com/omrikiei/ktunnel"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/omrikiei/ktunnel/releases/download/v${pkgver}/ktunnel_${pkgver}_Linux_x86_64.tar.gz")
sha512sums=('f274898ff508d4a0bad21088aee49ef72fe4bb3baa31e4db366ab9d9ed4ff90e26aa7602d8c130d1be2e1ae3b1be53ceabd98f3e65672c1f62334df21e4ae988')

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0755 ktunnel "$pkgdir/usr/bin/ktunnel"
}
