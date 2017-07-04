#Maintainer: naruto522ru <itachi522ru@gmail.com>
pkgname=eleet
pkgver=1.5.7
pkgrel=1
pkgdesc='Eleet private messenger'
arch=('x86_64')
url='https://github.com/ELMessenger/Desktop'
license=('GPL2')
makedepends=('wget')
depends=('libnotify' 'libappindicator' 'gconf' 'libxtst' 'lib32-nss' 'lib32-libxss')
options=(!strip)

install=eleet.install
source_x86_64=("https://www.dropbox.com/s/8gr1dg8nrzzclgj/ELEET.deb")
sha256sums_x86_64=('69b54ad30e48c164f65a37953f69a782a7548346d667b5d5ae03dc77199d14a0')
md5sums_x86_64=('e5ddfd15dbf3df5c0f526d4c8ead8839')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
 msg2 "Moving stuff in place..."

