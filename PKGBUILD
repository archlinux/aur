# Maintainer: Márk Sági-Kazár <mark.sagi-kazar@gmail.com>
# Maintainer: Francesco Persico <francesco.persico@gmail.com>

pkgname=nodenv-node-build
pkgver=4.3.0
pkgrel=1
pkgdesc="Install NodeJS versions"
arch=("any")
url="https://github.com/nodenv/node-build"
license=("MIT")
conflicts=("${pkgname}-git" "node-build")
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=("c84850e738cfb32831d16b5aabd3c4c1")

package() {
	cd "${srcdir}/node-build-${pkgver}"

	PREFIX="${pkgdir}/usr" ./install.sh
}
