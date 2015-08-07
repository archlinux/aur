# Maintainer: Vyacheslav Konovalov <vyachkonovalov@gmail.com>

pkgname=robomongo
pkgver=0.8.5
pkgrel=1
pkgdesc='Shell-centric cross-platform MongoDB management tool'
arch=('x86_64')
url='http://robomongo.org/'
license=('GPL3')
depends=('pcre' 'qt5-base')
conflicts=('robomongo-git')
source=("http://robomongo.org/files/linux/robomongo-$pkgver-x86_64.deb")
md5sums=('9a311a211949557904402595c1939255')

package() {
	bsdtar xf data.tar.xz
	mkdir -p "$pkgdir/usr/bin"
  cp -r "${srcdir}/opt/robomongo/share" "$pkgdir/usr"
  cp "${srcdir}/opt/robomongo/bin/robomongo" "$pkgdir/usr/bin"
}
