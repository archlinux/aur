# Author: Torkus
# Maintainer: Torkus <48141663+ogri-la@users.noreply.github.com>
pkgname=strongbox
pkgver=3.0.1
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
sha256sums=("e853450064377875ffea064186f33e251a199ef72bc3aad3ab7e929c28ca2d0d")

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}
