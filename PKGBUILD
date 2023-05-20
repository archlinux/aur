# Maintainer JaydenDev
pkgname="pclish-git"
pkgver="0.8.0.6d5e6c4"
pkgrel="1"
pkgdesc="Python Command-Line Shell"
arch=("x86_64" "arm")
depends=("python" "bash" "python-psutil" "python-colorama")
license=("MIT")
conflicts=("pclish")
url="https://github.com/jdev082/pclish"
source=("https://github.com/jdev082/pclish/archive/refs/heads/master.tar.gz")
sha256sums=("SKIP")

package() { 
	mkdir -p $pkgdir/usr/bin
	cp -r $(pwd)/pclish-master/pclish.py $pkgdir/usr/bin/pclish
	chmod +x $pkgdir/usr/bin/pclish
}
