# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>
# Contributor: Morris Jobke <hey AT morrisjobke DOT de>

pkgname=sshcommand
pkgver=0.9.0
pkgrel=4
pkgdesc='Turn SSH into a thin client specifically for your app'
arch=('x86_64')
url='https://github.com/dokku/sshcommand'
license=('MIT')

source=("https://github.com/dokku/sshcommand/releases/download/v${pkgver}/sshcommand_${pkgver}_linux_x86_64.tgz"
        'LICENSE')
sha256sums=('a617253143c6d0d023a50b0489aa5fb266bd1b3a3ff661aa1424f6826bebbd4e'
            'b1ac2fed5ac269fb7bbf651a3d37ef5fd56d2c33320e17cb6e23a22a93f5c046')

package() {
  install -Dm 755 sshcommand "${pkgdir}/usr/bin/sshcommand"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/sshcommand/LICENSE"
}
