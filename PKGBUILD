# Maintainer JaydenDev
pkgname="pclish"
pkgver="0.7.0"
pkgrel="1"
pkgdesc="Python Command-Line Shell"
arch=("x86_64" "arm")
depends=("python" "bash" "python-psutil" "python-colorama")
license=("MIT")
url="https://github.com/jdev082/pclish"
source=("https://github.com/jdev082/pclish/archive/refs/tags/v0.7.0.tar.gz")
sha256sums=("3c946dd9c980be968600ccf21ce0328c17d955b2f21cd6c36ae2a54ac1ac6ea0")

package() { 
	mkdir -p $pkgdir/usr/bin
	cp -r $(pwd)/pclish-0.7.0/pclish.py $pkgdir/usr/bin/pclish
	chmod +x $pkgdir/usr/bin/pclish
}
