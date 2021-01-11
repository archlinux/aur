pkgname=confedi-git
pkgver=1
pkgrel=1
pkgdesc="Confedi is designed to help with changing configuration files with one command."
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
    chmod +x "$pkgdir"/usr/bin/$pkgname
}
