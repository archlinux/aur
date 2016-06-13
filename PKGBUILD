# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname=maltego-classic
pkgver=4.0.0.8846
pkgrel=1
pkgdesc="Classic Edition of Maltego Client"
arch=(any)
url="http://paterva.com/web7/buy/maltego-clients/maltego.php"
license=('Commercial')
depends=(jre8-openjdk)
source=("http://paterva.com/malv4/classic/Maltego.v4.0.0.8846.deb")
md5sums=(f5f2a1b30b6fa4c7c6927c309edab44f)
package(){
        cd "$srcdir"
	tar xf data.tar.gz
        install -dm755 "$pkgdir"/usr/share/ && install -dm755 "$pkgdir"/usr/bin
        cp -rf usr/share/* "$pkgdir"/usr/share/
        cp -rf usr/bin/* "$pkgdir"/usr/bin/
        mkdir misc
        tar xf control.tar.gz -C misc
        cp -rf misc "$pkgdir"/usr/share/MaltegoClassic/
}
