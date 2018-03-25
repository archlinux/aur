pkgname=bmm
pkgver=1.0
pkgrel=0
pkgdesc="Simple Bookmark Manager"
arch=('any')
depends=('python' 'python-beautifulsoup4')
makedepends=('make')
url="https://github.com/renat1sakenov/bmm"
license=('GPL')
source=($pkgname.tar.gz::https://codeload.github.com/renat1sakenov/bmm/tar.gz/v$pkgver)
sha1sums=('1a619e96991bcb11830b7d48a3ed6879604aa5e9')

package(){
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install 
}
