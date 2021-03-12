Maintainer="Lenni Hein <git@lennihein.com>"
pkgname=codeonly
pkgver=1.1.0
pkgrel=1
pkgdesc="Remove annoying comments from your code"
url="https://github.com/LostInTheCloud/codeonly"
license=("GPL-2.0")
arch=("x86_64")
provides=("codeonly")
options=("strip")
source=("https://github.com/LostInTheCloud/codeonly/releases/download/v$pkgver/codeonly-$pkgver-x86_64.tar.gz")
sha256sums=("763d4fda449c63d3fd5652db23ba0338d0cc150b873221c46650efdbf089ca2c")

package() {
    install -Dm755 codeonly -t "$pkgdir/usr/bin/"
}
