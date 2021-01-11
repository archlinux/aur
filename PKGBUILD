pkgname=confedi-git
pkgver=1
pkgrel=1
pkgdesc=""
arch=(any)
license=('GPL')
depends=(python3)
makedepends=(git)
url="https://bitbucket.org/masterofhoppips/configuration-editor.git"
source=("git+$url")
#options=(!emptydirs) # no idea
md5sums=('SKIP')

package() {
    mkdir -p "$pkgdir"/usr/bin
    cp configuration-editor/src/program.py "$pkgdir"/usr/bin/$pkgname
}
