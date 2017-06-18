#Maintainer: naruto522ru <itachi522ru@gmail.com>
pkgname=eleet
pkgver=1.3.10
pkgrel=1
pkgdesc='Eleet private messenger'
arch=('x86_64')
url='https://github.com/ELMessenger/Desktop'
license=('GPL2')
makedepends=('wget')
depends=('libnotify' 'libappindicator')
options=(!strip)

install=eleet.install
source_x86_64=("https://www.dropbox.com/s/4qc8koqurc1mz6q/eleet.deb")
sha256sums_x86_64=('fee3b22a0f266ab713dece82683d82bceb6c38526a75d3e80425fb5605a445e0')
md5sums_x86_64=('f92299b192080937ad9e91382a0cb403')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
 msg2 "Moving stuff in place..."

