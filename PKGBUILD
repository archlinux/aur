# Maintainer: Márk Sági-Kazár <mark.sagi-kazar@gmail.com>
# Maintainer: Francesco Persico <francesco.persico@gmail.com>

pkgname=nodenv-node-build
pkgver=3.0.14
pkgrel=1
pkgdesc="Install NodeJS versions"
arch=("any")
url="https://github.com/nodenv/node-build"
license=("MIT")
conflicts=("${pkgname}-git" "node-build")
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=("ae0cff5519b80c3d7238b78c9fa8513f")

package() {
	cd "${srcdir}/node-build-${pkgver}"

	PREFIX="${pkgdir}/usr" ./install.sh
}
