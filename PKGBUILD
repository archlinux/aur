#Maintainer: solisinvictum https://github.com/solisinvictum/vidoas-visudo
#Thanks to Ultracoolguy for the template
pkgname=vidoas-visudo
pkgver=1.0
pkgrel=1.0
pkgdesc="A symlink for using vidoas as a drop-in replacement to visudo"
arch=('any')
url="https://github.com/solisinvictum/vidoas-visudo"
depends=('opendoas' 'vidoas' 'opendoas-sudo')

package() {
  install -d "$pkgdir"/usr/bin
  ln -s $(which vidoas) "$pkgdir"/usr/bin/visudo
}
