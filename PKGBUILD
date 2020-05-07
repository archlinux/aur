# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>
# Contributor: Morris Jobke <hey AT morrisjobke DOT de>

pkgname=plugn
pkgver=0.4.0
pkgrel=1
pkgdesc='Hook system that lets users extend your application with plugins'
arch=('x86_64')
url='https://github.com/dokku/plugn'
license=('MIT')

source=("https://github.com/dokku/plugn/releases/download/v${pkgver}/plugn_${pkgver}_linux_x86_64.tgz"
        'LICENSE')
sha256sums=('62754d56ff5cddd577f46981c01417c2d164fc9710ff6e7e6059ed93956c0d5d'
            'b1ac2fed5ac269fb7bbf651a3d37ef5fd56d2c33320e17cb6e23a22a93f5c046')

package() {
  install -Dm 755 plugn "${pkgdir}/usr/bin/plugn"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/plugn/LICENSE"
}
