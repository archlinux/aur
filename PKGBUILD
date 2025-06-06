# Maintainer: Aneesh Lingala <aneeshlingala61@gmail.com>
pkgname=tiny-editor
pkgver=1.2
pkgrel=4
pkgdesc="A Frickin Tiny Editor, all written in bash!"
arch=('any')
url="https://codeberg.org/aneeshlingala/fkin-tiny-editor"
license=('GPL3')
depends=('bash')
makedepends=('git')
source=("https://codeberg.org/aneeshlingala/fkin-tiny-editor")

package() {
    git clone $_source
    cd "$srcdir/$_pkgname"
    cd fkin-tiny-editor
    cp te.bash /usr/bin/te
    chmod +x /usr/bin/te
    rm -rf fkin-tiny-editor
}
