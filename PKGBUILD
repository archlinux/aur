pkgname='chocolate'
pkgver=3.0.2
pkgrel=1
pkgdesc="Chocolate Project Manager"
arch=('x86_64')
url="https://github.com/frchocolate/chocolate"
license=('MIT') 
depends=('python')  
source=("git+https://github.com/frchocolate/chocolate.git")
md5sums=('SKIP')

package() {
    cd "$srcdir/chocolate"
    make all
}
