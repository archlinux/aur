# Maintainer: Daniel <rozario@duck.com>
pkgname=twenty-twenty-twenty-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="20-20-20 is a program that alerts every 20 minutes to look something at 20 feet away for 20 seconds, written in Golang."
arch=('x86_64')
url="https://github.com/thiagokokada/twenty-twenty-twenty"
license=('MIT')
source=("https://github.com/thiagokokada/twenty-twenty-twenty/releases/download/v${pkgver}/twenty-twenty-twenty-linux-amd64-static")
sha256sums=('SKIP') 

package() {
  install -Dm755 "twenty-twenty-twenty-linux-amd64-static" "${pkgdir}/usr/bin/twenty-twenty-twenty"
}
