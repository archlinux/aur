# Maintainer: Tomáš Mládek <tmladek{at}inventati{org}>
# Contributor: Samhain 

pkgname=fortune-mod-issa-haiku
pkgver=1.1
pkgrel=4
pkgdesc="Fortune cookies: Kobayashi Issa's haiku collection (7000+)"
url="http://www.tastyrabbit.net/2008/05/archlinux-fortune-cookie-haiku-package.html"
arch=any
license=(public domain)
depends=(fortune-mod)
source="http://www.tastyrabbit.net/issa-haiku.tar.gz"
md5sums=('6418f81836f0323227b42a68292be806')

package() {
  mkdir -p $pkgdir/usr/share/fortune
  cp issa-haiku issa-haiku.dat $pkgdir/usr/share/fortune 
}
