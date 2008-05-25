# Maintainer: Thayer Williams <thayer@archlinux.org>

pkgname=archlinux-themes-slim
pkgver=1.1
pkgrel=1
pkgdesc="Arch Linux themes for the SLiM login manager"
arch=(i686 x86_64)
url="http://www.archlinux.org/"
license=('GPL')
depends=('slim')
source=(ftp://ftp.archlinux.org/other/artwork/${pkgname}-${pkgver}.tar.gz)
md5sums=('aa61c064678778b9e06ff5f5a6e4320b')

build() {
  cd "$startdir/src/${pkgname}-${pkgver}"
  mkdir -p $startdir/pkg/usr/share/slim/themes
  mv archlinux-*/ $startdir/pkg/usr/share/slim/themes
}

