# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=sshcommand
pkgver=0.14.1
pkgrel=2
pkgdesc='Turn SSH into a thin client specifically for your app'
arch=('x86_64')
url='https://github.com/dokku/sshcommand'
license=('MIT')
source=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_x86_64.tgz"
        'LICENSE')
sha256sums=('c4560f02b3217ce7a7c9faa912fee4b0c66bfc83ca5603760110bb82dc6f98aa'
            'b1ac2fed5ac269fb7bbf651a3d37ef5fd56d2c33320e17cb6e23a22a93f5c046')

package() {
  cd "${srcdir}"

  install -Dm755 sshcommand "${pkgdir}/usr/bin/${pkgname}"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
