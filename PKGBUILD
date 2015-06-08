# Contributor: John Gerritse <reaphsharc@gmail.com>
pkgname=eclipse-ingres
pkgver=1.0.1
pkgrel=2
pkgdesc="Ingres plugin for Eclipse."
arch=('i686')
url="http://esd.ingres.com/product/Community_Projects/Eclipse_DTP_Bundle/Linux_32-Bit/Eclipse_DTP_Bundle"
license=('GPL2')
depends=('eclipse')
source=(http://downloads.ingres.com/EclipseDTPplugin/ingres_dtp_feature_$pkgver.zip)
md5sums=('8dac4116c8e8d7ed924aa33938ce845d')

build() {
  cd "$startdir/src/"

  find -type d -exec chmod 755 \{\} \;
  find -type f -exec chmod 644 \{\} \;

  mkdir -p $startdir/pkg/usr/share/eclipse
  cp -rf features plugins $startdir/pkg/usr/share/eclipse
}

# vim:set ts=2 sw=2 et:
