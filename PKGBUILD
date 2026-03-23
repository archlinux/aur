# Maintainer: ItsAshn
pkgname=kioku
pkgver=0.10.3
pkgrel=1
pkgdesc="Application time tracker — know where your hours go"
arch=('x86_64')
url="https://github.com/ItsAshn/Kioku"
license=('custom:UNLICENSED')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 
         'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 
         'libnotify' 'libappindicator-gtk3')
source=("$pkgname-$pkgver.pacman::$url/releases/download/v$pkgver/kioku-$pkgver.pacman")
sha256sums=('c43ead9625ace1b5c616db2bf3683d0694487598aaf497dbc1c446cf086f2e11')

package() {
    tar -xJf "$srcdir/$pkgname-$pkgver.pacman" -C "$pkgdir"
}
