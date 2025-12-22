# Maintainer: Clove Twilight <clovetwilight3@outlook.com>
pkgname=gitcommit
pkgver=1.1.0
pkgrel=1
pkgdesc="Automated Git workflow tool"
arch=('any')
url="https://github.com/CloveTwilight3/GitCommit"
license=('MIT')
depends=('git' 'bash')
source=("gitcommit.sh::https://raw.githubusercontent.com/CloveTwilight3/GitCommit/main/src/linux/gitcommit.sh"
        "LICENSE::https://raw.githubusercontent.com/CloveTwilight3/GitCommit/main/LICENSE")
sha256sums=('SKIP'
            'SKIP')

package() {
    # Install the main script
    install -Dm755 "$srcdir/gitcommit.sh" "$pkgdir/usr/bin/gitcommit"
    
    # Install license
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
