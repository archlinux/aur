# Maintainer: WeJammingStill <th3lusive@yahoo.com>
pkgname=stardict-dictd_www.dict.org_gcide
pkgver=5.2.4.2
_pkgver=2.4.2
pkgrel=3
pkgdesc="The Collaborative International Dictionary of English for stardict et al. from huzheng.org"
arch=('any')
url="http://download.huzheng.org"
license=('GPL')
optdepends=('sdcv: command line dictionary.')
provides=($pkgname)
conflicts=($pkgname)
source=("http://download.huzheng.org/dict.org/stardict-dictd_www.dict.org_gcide-2.4.2.tar.bz2")
sha512sums=('f9090f8d3629cf4bf3df99939bfad25b0b1a4e6d8971a381f9566672bcb2e00191dde6ccd1c184b868a0f53df2aa8ab6402290d3d083cd35016ea85340ada78b')
package(){
    cd $pkgname-$_pkgver
	install -m 755 -d "${pkgdir}/usr/share/stardict/dic/${_pkgname}"
	install -m 644 -t "${pkgdir}/usr/share/stardict/dic/${_pkgname}" \
        *.{dict.dz,idx,ifo}
}
