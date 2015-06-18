# Contributor: Dmitry <superparabolic at gmail.com>
pkgname=xfce-slimlock
pkgver=2
pkgrel=1
pkgdesc="Workaround for using slimlock in xfce4 via symlink"
url="https://bbs.archlinux.org/viewtopic.php?id=143805"
arch=('any')
depends=('slim')
license=('GPL2')

package() {
  mkdir -p $pkgdir/usr/local/bin
  ln -s /usr/bin/slimlock $pkgdir/usr/local/bin/xflock4
}
