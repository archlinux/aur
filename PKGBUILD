# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=docker-image-labeler
pkgver=0.4.0
pkgrel=2
pkgdesc='Adds and removes labels from docker images'
arch=('x86_64')
url='https://github.com/dokku/docker-image-labeler'
license=('MIT')
source=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tgz"
        'https://raw.githubusercontent.com/dokku/docker-image-labeler/master/LICENSE')
sha256sums=('48d1424507f392cfded063991c00785f753c6a53328f72790f97d8ca54f32d44'
            '5cb0dbb3f10637c3a3dd3cff4f1f54cb269f842ee534548b98acd4b0178fe4d6')

package() {
  install -Dm755 docker-image-labeler-amd64 "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
