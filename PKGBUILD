# Author: Denis Polyakov <snarkrans@gmail.com>
pkgname=blender-dl
pkgver=1.4
pkgrel=1
pkgdesc="Bash script for fast blender downloading."
arch=('any')
url="https://github.com/snarkrans/blender-dl"
license=('MIT')
depends=('wget' 'fzf' 'axel')
source=("https://raw.githubusercontent.com/snarkrans/blender-dl/main/blender-dl")
md5sums=('SKIP')
package() {
    cd "$srcdir"
    install -Dm755 blender-dl "$pkgdir/usr/bin/blender-dl"
}
