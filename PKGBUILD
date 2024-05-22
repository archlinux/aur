# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=sshcommand
pkgver=0.18.0
pkgrel=1
pkgdesc='Turn SSH into a thin client specifically for your app'
arch=('x86_64')
url='https://github.com/dokku/sshcommand'
license=('MIT')
source=("${url}/releases/download/v${pkgver}/${pkgname}"
        'LICENSE')
sha256sums=('e32fc0f62ed89201a0a03e4941c3fd7938032bda74006886f5af41dc48508004'
            'b1ac2fed5ac269fb7bbf651a3d37ef5fd56d2c33320e17cb6e23a22a93f5c046')

package() {
  install -Dm755 sshcommand "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
