# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=giganotes-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="An open source data management and note taking app"
arch=('x86_64')
url='https://giganotes.com'
license=('Apache')
provides=('giganotes')
depends=('nss'
         'libxss'
         'gtk3')
source=("${pkgname}-${pkgver}.deb::https://giganotes.com/dist/linux/giganotes_${pkgver}_amd64.deb")
sha256sums=('6a3ac202a20e4807c02af70eec5ec31d762f3480b4c39653bb398d94a41c6094')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
}
