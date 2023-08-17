# Maintainer: Malachi Soord <me@malachisoord.com>

pkgname=ktunnel-bin
pkgver=1.5.3
pkgrel=1
pkgdesc="A CLI that exposes your local resources to kubernetes."
arch=('x86_64')
url="https://github.com/omrikiei/ktunnel"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/omrikiei/ktunnel/releases/download/v${pkgver}/ktunnel_${pkgver}_Linux_x86_64.tar.gz")
sha512sums=('8b2f173fe9594a8ed72344f1bc3ad96805b965734295f13b21313f04a1a56d98f81e1d951b33ddcb03596d0d237d4f858aafb67e484e4d9ad01b9af46f5a737c')

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0755 ktunnel "$pkgdir/usr/bin/ktunnel"
}
