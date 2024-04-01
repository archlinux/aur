# Maintainer: importcjj <importcjj at gmail dot com>

pkgname=omni-terminal
pkgver=0.5.2
pkgrel=1
pkgdesc="The omni terminal, produced by wisburg."
arch=('x86_64')
url="https://wisburg.com/"
license=('custom')
makedepends=('wget' 'dpkg') # dpkg 用于解压.deb文件
source=("https://download.wisburg.com/omni/prod/6fd15f71-f995-4a9a-9103-c84e8c1a1b68.deb")
sha256sums=('SKIP') 

package() {
  tar -xvf data.tar.xz -C "$pkgdir"
}
