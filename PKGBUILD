# Maintainer: aligator <aligator at-symbol suncraft-server dot de>
pkgrel=1
pkgname='settlers3-demo-data'
# there is only one demo and there won't be an update
pkgver=1
arch=('any')
pkgdesc='Demo-data from "The Settlers III" needed for JSettlers'
url='https://github.com/jsettlers/settlers-remake'
license=('unknown')
provides=(settlers3-data)
install=${pkgname}'.install'
source=('http://www.siedler-maps.de/downloads/siedler3/s3amazonen_demo.exe')
sha512sums=('c224a5d4aad5560244e2230231f553eed3f049f04e8f16f43bc8a9048242a8881058ed6f30d4330886b70417a6db26ae67ca9cbd878a2c1d314a48cb3e438ec2')

package() {
    _dataDest=${pkgdir}/usr/share/jsettlers
    _originalDest=${_dataDest}/s3
            
    # create destination-dirs
    mkdir -p ${_originalDest}
    
    cd ${srcdir}
    cp -R Gfx Snd Map ${_originalDest}
}