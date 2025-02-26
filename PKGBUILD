# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=sshcommand
pkgver=0.19.0
pkgrel=1
pkgdesc='Turn SSH into a thin client specifically for your app'
arch=('x86_64')
url='https://github.com/dokku/sshcommand'
license=('MIT')
depends=(
  'jq'
  'openssh'
)
source=("${url}/releases/download/v${pkgver}/${pkgname}"
        'LICENSE')
sha256sums=('281e27c5679e25d97c99d281104ad03c8f4e89eedc8fd77d1c2ec9c632b7d4c4'
            'b1ac2fed5ac269fb7bbf651a3d37ef5fd56d2c33320e17cb6e23a22a93f5c046')

package() {
  install -Dm755 sshcommand "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
