# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=multimc-twitch
pkgver=1.1.3
pkgrel=1
pkgdesc="A simple Go program that handles Twitch's custom protocol and ccip files"
arch=('i686' 'x86_64')
url="https://github.com/ShayBox/MultiMC-Twitch"
license=('MIT')
source_i686+=(https://github.com/ShayBox/$pkgname/releases/download/$pkgver/linux-386.tar.gz)
source_x86_64+=(https://github.com/ShayBox/$pkgname/releases/download/$pkgver/linux-amd64.tar.gz)
sha256sums_i686=('acacf48f6220d895e20518908b854e578ad0def4e796e401ab7c6851b1493568')
sha256sums_x86_64=('ae21e6a7858b57565bca50502797e1cf0476ef442fc552206767fea83e490172')

package() {
  install -Dm755 usr/bin/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm755 usr/share/applications/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
