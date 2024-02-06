# Maintainer: importcjj <importcjj at gmail dot com>

pkgname=omni-terminal
pkgver=0.1.1
pkgrel=1
pkgdesc="The omni terminal, producted by wisburg.com"
arch=('x86_64')
url="https://wisburg.com/"
license=('custom')
depends=('electron28')
makedepends=('wget' 'dpkg') # dpkg 用于解压.deb文件
source=("https://download.wisburg.com/omni/prod/e32b3a13-8c5a-444f-9b23-c920014a05c1.deb")
sha256sums=('SKIP') 

package() {
  tar -xvf data.tar.xz -C "$pkgdir"
}
