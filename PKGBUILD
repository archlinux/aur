# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=docker-image-labeler
pkgver=0.6.1
pkgrel=1
pkgdesc='Adds and removes labels from docker images'
arch=('x86_64')
url='https://github.com/dokku/docker-image-labeler'
license=('BSD')
source=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tgz"
        'LICENSE')
sha256sums=('8b1e8d62ab724c50847c6c159396b4c43ef5cdc7a81c94ef9219e36e9cba7ffe'
            'e35631b792185502df2e65b8c3d4469351df0c6e31eed8e8548920f38b0fa203')

package() {
  install -Dm755 docker-image-labeler-amd64 "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
