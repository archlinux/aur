# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=docker-image-labeler
pkgver=0.2.0
pkgrel=1
pkgdesc='Adds and removes labels from docker images'
arch=('x86_64')
url='https://github.com/dokku/docker-image-labeler'
license=('MIT')
depends=('go')

source=("https://github.com/dokku/docker-image-labeler/releases/download/v${pkgver}/docker-image-labeler_${pkgver}_linux_x86_64.tgz"
        'LICENSE')
sha256sums=('5eddb4ee73c86838c67ae5f4296b337beb99261f7a0027e312f802b3e0a04533'
            'e35631b792185502df2e65b8c3d4469351df0c6e31eed8e8548920f38b0fa203')

package() {
  install -Dm755 docker-image-labeler "${pkgdir}/usr/bin/docker-image-labeler"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/docker-image-labeler/LICENSE"
}
