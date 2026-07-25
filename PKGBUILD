# Maintainer: Kaiyasi <zengcode0315@gmail.com>
pkgname=fcitx5-ari-ime-bin
pkgver=2.0.3
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
sha256sums=('5ef5dbe816e4c17c45871f3f2058d54d8c156c8ff4c3fe68ece9122cdf367ef1')

package() {
    cp -dr --no-preserve=ownership usr "$pkgdir/"
}
