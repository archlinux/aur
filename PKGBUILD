# Contributor: Filipe Nascimento <flipee at tuta dot io>
# Maintainer: tee < teeaur at duck dot com >

pkgname=mask-bin
pkgver=0.11.7
pkgrel=2
pkgdesc='A CLI task runner defined by a simple markdown file'
arch=(x86_64)
url="https://github.com/jakedeichert/mask"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
provides=(mask)
conflicts=(mask)
source=("$url/releases/download/mask/$pkgver/mask-$pkgver-$arch-unknown-linux-gnu.zip"
"$url/releases/download/mask/$pkgver/mask-$pkgver-$arch-unknown-linux-gnu.zip.sha256")
sha256sums=('f6e02669d5d68c474f17d47cf4e833df77b4298255c5b32bd3a87e91c04f53b9'
            '124d1033dc726e2b2f1922fe2ada530266acc64ed4cf745f88a5f6e407c96b84')

package() {
    cd "mask-$pkgver-$arch-unknown-linux-gnu"
    install -Dm755 mask -t "$pkgdir/usr/bin"
}
