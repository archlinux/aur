# Maintainer: Luis-L <luis@blanken.nrw>

_pkgname=youtube-dl-front
pkgname=$_pkgname-git
pkgver=1.0
pkgrel=1
pkgdesc="Youtube-dl-front is a frontend for youtube-dl. With the easy interface you can download and view videos in seconds."
arch=('any')
url="https://https://github.com/Luis-L-B/youtube-dl-front"
license=('MIT')
#depends=('nodejs')
depends=('youtube-dl')
makedepends=('git' 'nodejs' 'npm')
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+https://github.com/Luis-L-B/youtube-dl-front.git
        )
md5sums=('SKIP')

package() {
  npm install --root="$pkgdir"
}

