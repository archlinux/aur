# Author: Torkus
# Maintainer: Torkus <48141663+ogri-la@users.noreply.github.com>
pkgname=strongbox
pkgver=5.4.1
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
sha256sums=("3d727dce500028b57de6134e1d72c794d73ae52d0b71ed4d1079f7e9fbf8ece0")

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}
