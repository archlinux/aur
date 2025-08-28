pkgname=dummiesnmap
pkgver=1.0.0
pkgrel=1
pkgdesc="A dumbed-down version of nmap, wrapped in python, for people who can't remember 50 million flags"
arch=('any')
url="https://github.com/kaizokuv/dummiesnmap"
license=('GPL3')
depends=('python')
makedepends=()
source=("https://github.com/kaizokuv/dummiesnmap/archive/refs/tags/v1.0.0.tar.gz")
sha256sums=('86aea39e3749e5e333256153e25a4cbaf7cdcb6f560c91bdc4f64509a7bf198f') 

package() { 
	cd "dummiesnmap-$pkgver" 
	install -Dm755 main.py "$pkgdir/usr/bin/dummiesnmap" 
}
