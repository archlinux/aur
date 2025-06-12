pkgname=spaces
pkgver=6.0
pkgrel=1
pkgdesc="A CLI tool that helps you open your apps more easily"
arch=('any')
url="https://github.com/simit22/spaces"
license=('GPL')
depends=('python' 'python-rich')
source=("spaces.py")
md5sums=('SKIP')

package() {

    cd "$srcdir"
    install -Dm755 spaces.py "$pkgdir/usr/bin/spaces.py"
    ln -s /usr/bin/spaces.py "$pkgdir/usr/bin/spaces"
    sed -i '1s|^|#!/usr/bin/env python\n|' "$pkgdir/usr/bin/spaces.py"


}
