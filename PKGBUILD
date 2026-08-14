# Maintainer: Kaiyasi <zengcode0315@gmail.com>
pkgname=fcitx5-ari-ime-bin
pkgver=2.1.3
pkgrel=1
pkgdesc="Ari IME: prebuilt Fcitx5 mixed Bopomofo/English input method"
arch=('x86_64')
url="https://github.com/kaiyasi/Ari-IME"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'libchewing' 'hicolor-icon-theme' 'gcc-libs' 'glibc')
provides=("fcitx5-ari-ime=$pkgver")
conflicts=('fcitx5-ari-ime')
options=('!debug' '!strip')
source=("$pkgname-$pkgver-$arch.tar.zst::$url/releases/download/v$pkgver/$pkgname-$pkgver-$arch.tar.zst")
sha256sums=('d92f0b7d9d9d117fcf9cd3f8b7b8aa2dfd5a81df4a22c2c6e97aa218ebe39f03')

package() {
    cp -dr --no-preserve=ownership usr "$pkgdir/"
}
