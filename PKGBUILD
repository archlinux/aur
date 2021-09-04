# Maintainer Harvies <delverjw@gmail.com>
pkgname=elasticsearch-analysis-ik
pkgver=7.10.2
pkgrel=1
pkgdesc="IK Analysis for Elasticsearch"
arch=('x86_64')
url="https://github.com/medcl/elasticsearch-analysis-ik"
license=('unknown')
depends=()
makedepends=()
optdepends=()
source=('https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v'${pkgver}'/elasticsearch-analysis-ik-'${pkgver}'.zip')
sha256sums=('b2d0ce3ad010dc05923f01ee6f5add67e7dd9229ddab8764a91d0fe4f4e2dc56')

_ikdir="usr/share/elasticsearch/plugins/ik"

package() {
 mkdir -p ${pkgdir}/${_ikdir} 	
 cp -R * ${pkgdir}/${_ikdir}
 rm -rf ${pkgdir}/${_ikdir}/elasticsearch-analysis-ik-${pkgver}.zip
}
