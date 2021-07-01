# Author: Torkus
# Maintainer: Torkus <48141663+ogri-la@users.noreply.github.com>
pkgname=strongbox
pkgver=4.3.0
pkgrel=2
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
sha256sums=("010e177dc04a06189e25233d9eb70c500d8b6c62d2a99407fbf804c552b98a25")

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}
