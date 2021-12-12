# Author: Torkus
# Maintainer: Torkus <48141663+ogri-la@users.noreply.github.com>
pkgname=strongbox
pkgver=4.8.0
pkgrel=1
pkgdesc="World of Warcraft addon manager. F/OSS, ad-free and privacy respecting."
arch=("x86_64")
url="https://github.com/ogri-la/strongbox"
license=("AGPL")
depends=("zlib")
options=(!strip)
provides=("$pkgname")
conflicts=("$pkgname")
replaces=("wowman")
noextract=("$pkgname-$pkgver")
# e.g.: "https://github.com/ogri-la/strongbox/releases/download/1.2.3/strongbox" => "strongbox-1.2.3"
source=("$pkgname-$pkgver::https://github.com/ogri-la/strongbox/releases/download/$pkgver/$pkgname")
sha256sums=("dc1eb832ec332a8394f9b3e35ece3c54f3fc446c89a49f3184e192ab107c9bb8")

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}
