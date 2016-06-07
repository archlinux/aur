# Maintainer: Márk Sági-Kazár <mark.sagi-kazar@gmail.com>

pkgname=nodenv-node-build
pkgver=2.3.1
pkgrel=1
pkgdesc="Install NodeJS versions"
arch=('any')
url="https://github.com/nodenv/node-build"
license=('MIT')
conflicts=("${pkgname}-git" 'node-build')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=("10534e00437f9a73c20da1ab4a9a755a")

package() {
    cd "${srcdir}/node-build-${pkgver}"

    PREFIX="${pkgdir}/usr" ./install.sh
}
