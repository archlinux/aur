# Maintainer: Márk Sági-Kazár <mark.sagi-kazar@gmail.com>

pkgname=nodenv-node-build
pkgver=2.1.2
pkgrel=1
pkgdesc="Install NodeJS versions"
arch=('any')
url="https://github.com/nodenv/node-build"
license=('MIT')
conflicts=("${pkgname}-git" 'node-build')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=("4272d8fe48c1cc34b5580edf432c82c9")

package() {
    cd "${srcdir}/node-build-${pkgver}"

    PREFIX="${pkgdir}/usr" ./install.sh
}
