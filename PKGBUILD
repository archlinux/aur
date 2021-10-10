# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=docker-image-labeler
pkgver=0.3.1
pkgrel=2
pkgdesc='Adds and removes labels from docker images'
arch=('x86_64')
url='https://github.com/dokku/docker-image-labeler'
license=('MIT')

source=("https://github.com/dokku/docker-image-labeler/releases/download/v${pkgver}/docker-image-labeler_${pkgver}_linux_amd64.tgz"
        'LICENSE')
sha256sums=('42e8f32d83ee4882c26506757b0e06290f597ed5952db9bf67379a59f4dbcced'
            'e35631b792185502df2e65b8c3d4469351df0c6e31eed8e8548920f38b0fa203')

package() {
  install -Dm755 docker-image-labeler-amd64 "${pkgdir}/usr/bin/docker-image-labeler"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/docker-image-labeler/LICENSE"
}
