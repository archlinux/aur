# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=docker-image-labeler
pkgver=0.2.2
pkgrel=1
pkgdesc='Adds and removes labels from docker images'
arch=('x86_64')
url='https://github.com/dokku/docker-image-labeler'
license=('MIT')

source=("https://github.com/dokku/docker-image-labeler/releases/download/v${pkgver}/docker-image-labeler_${pkgver}_linux_x86_64.tgz"
        'LICENSE')
sha256sums=('4082f881943f55070b3d349193ee82f3cf6c7c86db4b7f2bc1f9359994cb92e4'
            'e35631b792185502df2e65b8c3d4469351df0c6e31eed8e8548920f38b0fa203')

package() {
  install -Dm755 docker-image-labeler "${pkgdir}/usr/bin/docker-image-labeler"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/docker-image-labeler/LICENSE"
}
