pkgname=faiss-echo-git
pkgver=1
pkgrel=1
pkgdesc="echo in 740 bytes (97% smaller)"
arch=('any')
url="https://github.com/faissaloo/echo"
license=('GPLv3')
provides=($_pkgname)
depends=('')
makedepends=('git')
source=("$pkgname::git+https://github.com/faissaloo/echo.git")
md5sums=('SKIP')

#pkgver() {
#	  cd $pkgname
#	  
#    }

    package() {
	      cd $pkgname
	        install -Dm755 "echo" "$pkgdir/usr/bin/echo"
	  }

