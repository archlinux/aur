# Maintainer JaydenDev
pkgname="jdp-git"
pkgver="0.1.0.9d32b50"
pkgrel="1"
pkgdesc="jdev082 package manager"
arch=("x86_64" "arm")
depends=("bash" "make" "git")
license=("MIT")
url="https://github.com/jdev082/jdp"
source=("https://github.com/jdev082/jdp/archive/refs/heads/master.tar.gz")
sha256sums=("SKIP")

package() { 
	mkdir -p $pkgdir/usr/bin
	cp -r $(pwd)/jdp-master/main.sh $pkgdir/usr/bin/jdp
	chmod +x $pkgdir/usr/bin/jdp
	cp -r $(pwd)/jdp-master/jdp.conf $pkgdir/usr/bin/jdp.conf
}
