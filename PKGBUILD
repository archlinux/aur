# Maintainer: Russell Beswick (besworks)
pkgname=vid2webp-git
pkgver=1.0.1
pkgrel=1
pkgdesc="Clip videos into animated webp format"
arch=('any')
url="https://github.com/besworks/vid2webp"
license=('MIT')
depends=('ffmpeg' 'bc')
source=("git+https://github.com/besworks/vid2webp.git")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/vid2webp/vid2webp" "$pkgdir/usr/bin/vid2webp"
}