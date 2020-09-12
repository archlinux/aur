# Maintainer: Márk Sági-Kazár <mark.sagi-kazar@gmail.com>
# Maintainer: Francesco Persico <francesco.persico@gmail.com>
# Maintainer: johangu <johan at jgsoft dot nl>

pkgname=nodenv-node-build
pkgver=4.9.7
pkgrel=1
pkgdesc="Install NodeJS versions"
arch=("any")
url="https://github.com/nodenv/node-build"
license=("MIT")
conflicts=("${pkgname}-git" "node-build")
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=("38ffd1a9ca0824a1fdf5d64035430666")

package() {
	cd "${srcdir}/node-build-${pkgver}"

	PREFIX="${pkgdir}/usr" ./install.sh
}
