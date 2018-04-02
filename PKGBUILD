# Maintainer: Prasad Kumar
pkgname=telinkrin-icon-theme
pkgver=2.1
pkgrel=1
pkgdesc="A matching icon theme for Telinkrin-GTK theme based on Adwaita and MySuru"
arch=('any')
url='https://www.opendesktop.org/p/1215199/'
license=('CC BY-NC-SA')
depends=('hicolor-icon-theme')
provides=('telinkrin-icon-theme')
source=("${pkgname}-${pkgver}.tar.xz::https://dl.opendesktop.org/api/files/downloadfile/id/1522367288/s/76c9d4848e73f0e0a2a8bce9e65a3df0/t/1522685535/u/455718/Telinkrin-SURU-$pkgver.tar.xz")
sha512sums=('bf62126e1405efebd00565afc46114501a8356d0c481a3ab6a6bb00da90d3a1fa0be5ca89355ccf5d4c9cd42c6e3e2b59cf0d899af79bc71ab36eee7e3b8fcff')
package() {
  cd "${srcdir}"/Telinkrin-SURU-$pkgver
  install -d "$pkgdir"/usr/share/icons/Telinkrin
  cp -rf * "$pkgdir"/usr/share/icons/Telinkrin
}
