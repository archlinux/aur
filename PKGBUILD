# Maintainer: Prasad Kumar
pkgname=arrongin-gtk-theme
pkgver=2.1
pkgrel=1
pkgdesc="An individual and unique looking theme with an interesting design of Nautilus sidebar"
arch=('any')
url='https://www.opendesktop.org/p/1215199/'
license=('CC BY-NC-SA')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3>=3.20')
provides=('arrongin-gtk-theme')
source=("${pkgname}-${pkgver}.tar.xz::https://dl.opendesktop.org/api/files/downloadfile/id/1522367393/s/00b5651c99308c7bbaabe7b88a61f300/t/1522433179/u/455718/Arrongin-$pkgver.tar.xz")
sha512sums=('6eca94066f71d2eaebc0e340ac718e70cc30585ead0921f1c65517f677c36a460ffe34f6d69b258d0efcd1f1a29cc25f6db342c01f5d966f6c4cffba15f43739')
package() {
  cd "${srcdir}"/Arrongin-2.0-theme #Theme author still has folder inside archive numbered as 2.0
  install -d "$pkgdir"/usr/share/themes/${pkgname}
  cp -rf * "$pkgdir"/usr/share/themes/${pkgname}
}
