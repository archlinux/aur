# Maintainer: Martin Filion <mordillo98@gmail.com>
pkgname=mcole-themes
pkgname_link=mcole-themes
pkgbase=mcole-themes
pkgver=1
pkgrel=1
pkgdesc="mCOLe themes"
url="https://www.cupoflinux.com/SBB/index.php?topic=4541.0"
arch=('any')
provides=($pkgname)
conflicts=($pkgname)
source=('https://sourceforge.net/projects/archbangretro/files/mCOLe-themes.tar.xz')
md5sums=('14845b7544355a8d054284aef70e1e9c')

package() {
  install -d /$pkgdir/usr/share/themes

  cp -R mCOLe-themes/* /$pkgdir/usr/share/themes/
}


