# Maintainer:  <qqqqqqqqq9 AT web DOT de
# Contributor: Lee Jackson <tomoe AT lbjackson DOTCOM>

pkgname=archlinux-modern-ksplash
pkgver=1.0
pkgrel=2
pkgdesc="A modern Arch Linux theme for Ksplash KDE splash screen"
arch=('any')
url="http://www.archlinux.org/"
license=('GPL')
source=(http://tomoe.lbjackson.com/archlinux/archlinux-modern-ksplash-1.0.tar.gz)
md5sums=('ebbf29b8a14b9a3306ab4396a1e6823a')

package() {
  cd $srcdir/${pkgname}-${pkgver}
  mkdir -p        $pkgdir/usr/share/apps/ksplash/Themes
  mv archlinux-*/ $pkgdir/usr/share/apps/ksplash/Themes
}

