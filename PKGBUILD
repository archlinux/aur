# Maintainer: GustavoWidman <gustavowidman@gmail.com>

pkgname=video2gif
pkgver=1.0.0
pkgrel=1
pkgdesc="A fancy CLI to convert videos into gifs."
arch=('any')
url="https://github.com/GustavoWidman/video2gif"
license=('CC0')
depends=('python3' 'ffmpeg' 'imagemagick')
makedepends=('git')
options=('!strip' '!debug')

source=("$pkgname-$pkgver.tar.gz::https://github.com/GustavoWidman/video2gif/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a4d1bf952afeecb15ddf5e7b4075a30d8d8502ad25a909dbb823c3fa72d2dd96')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 'bin/video2gif' "${pkgdir}/usr/bin/video2gif"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}