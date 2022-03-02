# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=docker-image-labeler
pkgver=0.4.1
pkgrel=1
pkgdesc='Adds and removes labels from docker images'
arch=('x86_64')
url='https://github.com/dokku/docker-image-labeler'
license=('MIT')
source=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tgz"
        'https://raw.githubusercontent.com/dokku/docker-image-labeler/master/LICENSE')
sha256sums=('7a80641fe08bd65ea807a3dc5e69e612ca298f1184ee960fbedf14e3dd9c534d'
            '5cb0dbb3f10637c3a3dd3cff4f1f54cb269f842ee534548b98acd4b0178fe4d6')

package() {
  install -Dm755 docker-image-labeler-amd64 "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
