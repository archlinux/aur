# Maintainer: Clove Twilight <clovetwilight3@outlook.com>
pkgname=gitcommit
pkgver=1.1.1
pkgrel=1
pkgdesc="Automated Git workflow tool"
arch=('any')
url="https://github.com/CloveTwilight3/GitCommit"
license=('MIT')
depends=('git' 'bash')
source=("gitcommit.sh::https://raw.githubusercontent.com/CloveTwilight3/GitCommit/v${pkgver}/src/linux/gitcommit.sh"
        "LICENSE::https://raw.githubusercontent.com/CloveTwilight3/GitCommit/v${pkgver}/LICENSE")
sha256sums=('b438049f7225185f9f127223ecfe4f70f4a09b2faeef03ddfcebcfac19007fa4'
            'bfb65da5cc99caf9501c99ecd2e2f2fff21f8648530df11bc67e825a4c4d1aab')

package() {
    # Install the main script
    install -Dm755 "$srcdir/gitcommit.sh" "$pkgdir/usr/bin/gitcommit"
    
    # Install license
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
