# Maintainer: Somebody <somebody[at]foo[dot]tld>
pkgname=jalgo
pkgver=20120214
pkgrel=4
pkgdesc="Algorithm visualization tool written in Java developed at TU Dresden"
url="http://j-algo.binaervarianz.de/"
arch=('any')
license=('GPL')
depends=('java-runtime=6')
source=('http://downloads.sourceforge.net/project/j-algo/j-algo/20120214/j-Algo-linux-complete-20120214.tar.gz')
md5sums=('dc3bfcfc1b2b55a3cba63ac90a1cc69e')
 
package() {
    cd ../pkg/
    mkdir -p usr/share/
    mkdir -p usr/bin/
    mv ../src/j-Algo usr/share/
    chmod +x usr/share/j-Algo/j-Algo.sh
    #ln -s ../share/j-Algo/j-Algo.sh usr/bin/jalgo
    echo "#!/bin/bash" > usr/bin/jalgo
    echo "/usr/share/j-Algo/j-Algo.sh" >> usr/bin/jalgo
    chmod +x usr/bin/jalgo
}
