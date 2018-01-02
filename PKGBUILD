# Maintainer: Márk Sági-Kazár <mark.sagi-kazar@gmail.com>
# Maintainer: Francesco Persico <francesco.persico@gmail.com>

pkgname=nodenv-node-build
pkgver=2.6.21
pkgrel=1
pkgdesc="Install NodeJS versions"
arch=("any")
url="https://github.com/nodenv/node-build"
license=("MIT")
conflicts=("${pkgname}-git" "node-build")
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=("f61c95ceebbb430a34ac3dad2de672f5")

package() {
	cd "${srcdir}/node-build-${pkgver}"

	PREFIX="${pkgdir}/usr" ./install.sh
}
