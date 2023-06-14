# Author: Denis Polyakov <snarkrans@gmail.com>
pkgname=blender-dl
pkgver=1.1
pkgrel=1
pkgdesc="Bash script for fast blender downloading."
arch=('any')
url="https://github.com/snarkrans/blender-dl"
license=('MIT')
depends=('wget' 'fzf' 'axel')
source=("https://github.com/snarkrans/blender-dl/blob/main/blender-dl.tar.gz")
sha256sums=('58516a002a81cab66a2eebb03f9f2e663a599f5350e3270715a32f6716961458')

package() {
    cd "$srcdir"
    install -Dm755 blender-dl "$pkgdir/usr/bin/blender-dl"
}
