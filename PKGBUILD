# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=docker-container-healthchecker
pkgver=0.6.4
pkgrel=1
pkgdesc='Runs healthchecks against local docker containers'
arch=('x86_64')
url='https://github.com/dokku/docker-container-healthchecker'
license=('BSD')
source=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tgz"
        'LICENSE')
sha256sums=('fdf4af77dc3c63e6b6b9fc194d65e32beae6fc9822b669be5738b2803fd80a1c'
            'd96d9cdac79ad3e8606579ddf99f16a72c5abe437b37810a061e4fcb38de05cc')

package() {
  install -Dm755 docker-container-healthchecker-amd64 "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
