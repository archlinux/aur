# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=multimc-twitch
pkgver=1.1.2
pkgrel=1
pkgdesc="A simple Go program that handles Twitch's custom protocol and ccip files"
arch=('i386' 'x86_64')
url="https://github.com/ShayBox/MultiMC-Twitch"
license=('MIT')
source_i686+=(https://github.com/ShayBox/$pkgname/releases/download/$pkgver/linux-386.tar.gz)
source_x86_64+=(https://github.com/ShayBox/$pkgname/releases/download/$pkgver/linux-amd64.tar.gz)
sha256sums_i686=('86b6c0130464acba7e55d3e28c72aaef657620025864654fee5b6965ef39e600')
sha256sums_x86_64=('22317c677a628915494747c4be3a39686f4fd088d154b8013cb4fc18c8d751e9')

package() {
  install -Dm755 usr/bin/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm755 usr/share/applications/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
