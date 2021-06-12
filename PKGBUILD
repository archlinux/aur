# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=metapiga
pkgver=3.0b0
pkgrel=1
depends=(
	'jre-openjdk-headless'
	'jre-openjdk'
	'jdk-openjdk'
	'openjdk-doc'
	'openjdk-src'
)
makedepends=('bash')
pkgdesc="A robust implementation of stochastic heuristics for large phylogeny inference"
arch=('any')
url="https://www.metapiga.org/"
license=('custom')
source=("https://applications.lanevol.org/mp2installers/mp_Unix_Installer.sh")
sha256sums=('e1fa995f4fe8ced7b19f5662d7d3fb61b51bea3bba803432da70e1463fb01e91')

package() {
    bash "${srcdir}"/mp_Unix_Installer.sh
}

