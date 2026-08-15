# Maintainer: Kaiyasi <zengcode0315@gmail.com>
pkgname=fcitx5-ari-ime-bin
pkgver=2.2.0
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
sha256sums=('32f2e2862cbcc608edd7f8e54508b9226c6a0a4e3ea06d9ec0ca0158f1c486a7')

package() {
    cp -dr --no-preserve=ownership usr "$pkgdir/"
}
