# Maintainer: Gadget3000 <gadget3000 at msn dot com>
# Contributor: sssslang <xofyarg at gmail dot com>
# Contributor: Rick W. Chen <stuffcorpse@archlinux.us>

pkgname=fortune-mod-zh
pkgver=1.9
pkgrel=1
pkgdesc="Chinese poems for fortune-mod"
url="http://packages.qa.debian.org/f/fortune-zh.html"
license="GPL"
depends=('fortune-mod')
groups=('fortune-mods')
source=(http://ftp.debian.org/debian/pool/main/f/fortune-zh/fortune-zh_${pkgver}.tar.gz)
md5sums=('a9112eb9626997009512fb895b3a0a91')
arch=('i686' 'x86_64')

build() {
  cd ${srcdir}/fortune-zh-${pkgver}
  make || return 1
  mkdir -p ${pkgdir}/usr/share/fortune
  install -m0644 tang300 ${pkgdir}/usr/share/fortune
  install -m0644 tang300.dat ${pkgdir}/usr/share/fortune
  install -m0644 song100 ${pkgdir}/usr/share/fortune
  install -m0644 song100.dat ${pkgdir}/usr/share/fortune
}
