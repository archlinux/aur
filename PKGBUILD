# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=sshcommand
pkgver=0.11.0
pkgrel=1
pkgdesc='Turn SSH into a thin client specifically for your app'
arch=('x86_64')
url='https://github.com/dokku/sshcommand'
license=('MIT')

source=("https://github.com/dokku/sshcommand/releases/download/v${pkgver}/sshcommand_${pkgver}_linux_x86_64.tgz"
        'LICENSE')
sha256sums=('f235e28f3e126d60a24379d945fdc203e42678cd42309fef943b68a03e5ea0f8'
            'b1ac2fed5ac269fb7bbf651a3d37ef5fd56d2c33320e17cb6e23a22a93f5c046')

package() {
  install -Dm755 sshcommand "${pkgdir}/usr/bin/sshcommand"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/sshcommand/LICENSE"
}
