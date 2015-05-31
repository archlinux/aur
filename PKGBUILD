# Maintainer: Robert Knauer <robert@privatdemail.net>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

pkgname=demolition
pkgver=0.9
pkgrel=4
pkgdesc="A destruction testing tool for LADSPA plugins"
arch=('i686' 'x86_64')
url="http://devel.tlrmx.org/audio/"
license=('GPL')
depends=('glib')
source=(
  "http://devel.tlrmx.org/audio/source/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=(
  '7190334c6cad449f26e8613029265cab7687a2bef506c8fcff48715cc1d0f08f'
)

build() {
  cd ${srcdir}/${pkgname}
  make
}

package() {
  cd ${srcdir}/${pkgname}
  install -Ds -m755 "demolition" "${pkgdir}/usr/bin/demolition"
}
