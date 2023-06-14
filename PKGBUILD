# Author: Denis Polyakov <snarkrans@gmail.com>
pkgname=blender-dl
pkgver=1.0
pkgrel=1
pkgdesc="Bash script for fast blender downloading."
arch=('any')
url="https://github.com/snarkrans/blender-dl"
license=('MIT')
depends=('wget' 'fzf' 'axel')
source=("https://github.com/snarkrans/blender-dl/blob/main/blender-dl")
sha256sums=('8ada3f915e14d22b88b4e734369ce3cfe85bc0f18c8e57193254fbfcce13f285')

package() {
    cd "$srcdir"
    install -Dm755 blender-dl "$pkgdir/usr/bin/blender-dl"
}
