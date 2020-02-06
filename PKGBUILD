# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=multimc-twitch
pkgver=1.1.2
pkgrel=1
pkgdesc="A simple Go program that handles Twitch's custom protocol and ccip files"
arch=('any')
url="https://github.com/ShayBox/MultiMC-Twitch"
license=('MIT')
source=(https://github.com/ShayBox/$pkgname/releases/download/$pkgver/linux.tar.gz)
sha256sums=('e44d3b29cd7ff235189201664821e22ed4ceee0a21c395fc94923e78f631ed42')

package() {
  install -Dm755 usr/bin/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm755 usr/share/applications/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
