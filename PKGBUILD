# Maintainer: Márk Sági-Kazár <mark.sagi-kazar@gmail.com>
# Maintainer: Francesco Persico <francesco.persico@gmail.com>
# Maintainer: Johan Guttormsson <johan@jgsoft.nl>

pkgname=nodenv-node-build
pkgver=4.9.4
pkgrel=1
pkgdesc="Install NodeJS versions"
arch=("any")
url="https://github.com/nodenv/node-build"
license=("MIT")
conflicts=("${pkgname}-git" "node-build")
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=("59a471284b1e513b0dec63445322bccd")

package() {
	cd "${srcdir}/node-build-${pkgver}"

	PREFIX="${pkgdir}/usr" ./install.sh
}
