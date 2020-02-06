# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=multimc-twitch
pkgver=1.1.0
pkgrel=1
pkgdesc="A simple Go program that handles Twitch's custom protocol and ccip files"
arch=('any')
url="https://github.com/ShayBox/MultiMC-Twitch"
license=('MIT')
source=(https://github.com/ShayBox/$pkgname/releases/download/$pkgver/linux.tar.gz)
sha256sums=('3e4d819205d92fd6d9fa8d0e5f94f1bbac523c52a5fc2f79a36eb1b4f9999da5')

package() {
  install -Dm755 usr/bin/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm755 usr/share/applications/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
