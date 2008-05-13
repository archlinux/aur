# Maintainer: Thayer Williams <thayer@archlinux.org>

pkgname=archlinux-themes-slim
pkgver=1.0
pkgrel=1
pkgdesc="Arch Linux themes for the SLiM login manager"
arch=(i686 x86_64)
url="http://www.archlinux.org/"
license=('CCPL:by-nc-sa')
depends=('slim')
source=(ftp://ftp.archlinux.org/other/artwork/${pkgname}-${pkgver}.tar.gz)
md5sums=('4b751e3e9d0473dcd2e3ccfc43c02e24')

build() {
  cd "$srcdir/"
  mkdir -p $startdir/pkg/usr/share/slim/themes
  mv archlinux-*/ $startdir/pkg/usr/share/slim/themes
}

