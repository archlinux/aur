pkgname='liteloader-qqnt-mspring-theme-bin'
pkgver='1.2.2'
pkgrel=1
pkgdesc='Elegant, pink and delicate LiteLoaderQQNT theme'
arch=('any')
url="https://github.com/MUKAPP/LiteLoaderQQNT-MSpring-Theme/"
license=("MIT")
depends=("liteloader-qqnt-bin")

source=("https://github.com/MUKAPP/LiteLoaderQQNT-MSpring-Theme/releases/download/v1.2.2/LiteLoaderQQNT-MSpring-Theme.zip")
sha256sums=("3d81d06ce4de264eb9899271e4b432eb57cc2f40784a4724bfedb911a6c3f085")
b2sums=("c23a200e3f75370847923a7edc79fe40a49d56dbbaff96bd9195bfbe183c7f2e8870d8d3f6354bead05dc1babb3d26f2640ad495c3dac40c2806c0c7f8685ae5")

package() {
    install -dm777 "$pkgdir/opt/LiteLoader"
    find . -type f -exec install -D '{}' "$pkgdir/opt/LiteLoader/plugins/{}" ';'
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

