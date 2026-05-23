# Maintainer: JGH0 <jgh0@users.noreply.github.com>

pkgname=waifufetch
pkgver=1.0.0
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/JGH0/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0921b4a96f6234246afecc4e30d39099feda10b34f8dd505bf71fbe38b6693ad')

package() {
    install -Dm755 "$srcdir/waifu" "$pkgdir/usr/bin/waifu"
    install -Dm755 "$srcdir/waifufetch" "$pkgdir/usr/bin/waifufetch"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
