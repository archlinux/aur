# Maintainer: JGH0 <jgh0@users.noreply.github.com>

pkgname=waifufetch
pkgver=1.2.0
pkgrel=1
pkgdesc="System info with a random waifu decoration -- like fastfetch with anime"
arch=('any')
url="https://github.com/JGH0/waifufetch"
license=('MIT')
depends=('curl' 'jq')
optdepends=('kitty: native image display in kitty terminal'
            'chafa: terminal image display in any terminal'
            'jp2a: black and white ASCII art fallback'
            'img2txt: colored ASCII art fallback (caca-utils)')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JGH0/$pkgname/archive/v1.2.0.tar.gz")
sha256sums=('4681109ee8cca625dc58d1b49709dd1f61a97ed2932a0d174fbee962d15939a3')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 waifu "$pkgdir/usr/bin/waifu"
    install -Dm755 waifufetch "$pkgdir/usr/bin/waifufetch"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
