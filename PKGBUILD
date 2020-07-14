# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=giganotes-bin
pkgver=1.1.6
pkgrel=1
pkgdesc="An open source data management and note taking app"
arch=('x86_64')
url='https://giganotes.com'
license=('custom:unknown')
provides=('giganotes')
depends=('nss'
         'libxss'
         'gtk3')
source=("${pkgname}-${pkgver}.deb::https://giganotes.com/dist/linux/giganotes_${pkgver}_amd64.deb")
sha256sums=('a32af43f2db86e4f68765c54edf50d3a400800c02838d8b3eaed7fe05ff05d34')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
}