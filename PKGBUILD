# Maintainer: Alleop <aur dot contest432 at passinbox dot com>
_pkgname=vgmstream
pkgname=$_pkgname-cli-bin
pkgver=r1980
pkgrel=1
pkgdesc='A command line tool for decoding streamed (prerecorded) video game audio.'
arch=('x86_64')
url="https://github.com/$_pkgname/$_pkgname"
license=('ISC')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/releases/download/$pkgver/$_pkgname-linux-cli.zip")
b2sums=('a9bcda1882f6d6427610c0100e556b742633324eefad31535903ec237abdda0daaec2968ad97214eaaf38896fc3b379194cf064b1735860009c4e6e78257419f')

package() {
  install -Dm755 "$_pkgname-cli" "$pkgdir/usr/bin/$_pkgname-cli"
}
