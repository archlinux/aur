# Maintainer: Dan Ziemba <zman0900@gmail.com>

pkgname=steam-native-pcre-fix
pkgver=1.0
pkgrel=1
pkgdesc="Temporary fix for FS#62095"
arch=('any')
url="https://bugs.archlinux.org/task/62095"
depends=('libselinux' 'pcre' 'steam-native-runtime')

package() {
  mkdir -p -m 0755 ${pkgdir}/usr/lib
  ln -s /usr/lib/libpcre.so.1 ${pkgdir}/usr/lib/libpcre.so.3
}

