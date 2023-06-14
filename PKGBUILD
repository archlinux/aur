# Author: Denis Polyakov <snarkrans@gmail.com>
pkgname=blender-dl
pkgver=1.2
pkgrel=1
pkgdesc="Bash script for fast blender downloading."
arch=('any')
url="https://github.com/snarkrans/blender-dl"
license=('MIT')
depends=('wget' 'fzf' 'axel')
source=("https://github.com/snarkrans/blender-dl/blob/main/blender-dl")
md5sums=('SKIP')
package() {
    cd "$srcdir"
    install -Dm755 blender-dl "$pkgdir/usr/bin/blender-dl"
}
