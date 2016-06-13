# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname=maltego-xl
pkgver=4.0.0.8847
pkgrel=1
pkgdesc="eXtra Large version of Maltego Client"
arch=(any)
url="http://paterva.com/web7/buy/maltego-clients/maltego-xl.php"
license=('Commercial')
depends=(jre8-openjdk)
source=("http://paterva.com/malv4/xl/MaltegoXL.v4.0.0.8847.deb")
md5sums=(300605a016b5e4e15f2ffb2a0c972043)
package(){
        cd "$srcdir"
	tar xf data.tar.gz
        install -dm755 "$pkgdir"/usr/share/ && install -dm755 "$pkgdir"/usr/bin
        cp -rf usr/share/* "$pkgdir"/usr/share/
        cp -rf usr/bin/* "$pkgdir"/usr/bin/
        mkdir misc
        tar xf control.tar.gz -C misc
        cp -rf misc "$pkgdir"/usr/share/MaltegoXL/
}
