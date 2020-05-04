#Maintainer: Sudhip Nashi <sudhip@nashi.us>
pkgname='simple-utilities'
pkgver=1.0
pkgrel=1
pkgdesc="A bunch of simple CLI utilities"
arch=('any')
url="https://github.com/Finermeerkat137/simple-utilities"
license=('MIT')
depends=('xclip' 'libnotify')
source=('source.tar.gz')
sha512sums=('a00f5b88f8394beee605c99a2437b4df1e62d624aa53d39b6a5ec8dbd3f0f7cef7081e2afd442d6b7251c211770df989446d272277ad9a8e9097ec232552bc7a')

package() {
    mkdir -p "$pkgdir"/usr/local/bin
    for file in "$srcdir"/source/files/*;do
    install -v "$file" "$pkgdir"/usr/local/bin
    done
}
