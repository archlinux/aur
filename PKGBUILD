# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=jmodeltest
pkgver=2.1.10
pkgrel=1
pkgdesc="Phylogenetic Model Averaging, more models, new heuristics and high-performance computing"
arch=('x86_64')
provides=("jmodeltest")
url="https://github.com/ddarriba/jmodeltest2"
license=('GPL-3.0 License')
source=("https://github.com/ddarriba/jmodeltest2/files/157117/jmodeltest-2.1.10.tar.gz" "jmodeltest.desktop")
sha256sums=('9039f1a00e730b38e607126703606f8c2ff8309dd82955ce52ccc1ae2889d06d'
            'b35c9b5041ca7b9e0e96f29a958da356b9e5149d8ee581ff7c5c83adbcd6706f')
depends=(
	'java-runtime'
)
package() {
    install -dm 755 $pkgdir/usr/share/{applications,${pkgname}}
    
    mv ${srcdir}/jmodeltest-${pkgver}/* ${pkgdir}/usr/share/jmodeltest
 
    install -m 755 ${srcdir}/jmodeltest.desktop ${pkgdir}/usr/share/applications/jmodeltest.desktop
}
