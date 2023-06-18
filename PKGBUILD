# Maintainer: Funami
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=szyszka-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="A simple but powerful batch file rename program"
arch=('x86_64')
url="https://github.com/qarmin/szyszka"
license=('MIT')
depends=('gtk4')
provides=('szyszka')
conflicts=('szyszka')
source=("$pkgname-$pkgver::$url/releases/download/$pkgver/szyszka_linux"
        "szyszka-$pkgver.desktop::https://raw.githubusercontent.com/qarmin/szyszka/$pkgver/data/com.github.qarmin.szyszka.desktop"
        "szyszka-$pkgver.svg::https://raw.githubusercontent.com/qarmin/szyszka/$pkgver/data/icons/com.github.qarmin.szyszka.svg"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/qarmin/szyszka/$pkgver/LICENSE"
        "README-$pkgver.md::https://raw.githubusercontent.com/qarmin/szyszka/$pkgver/README.md")
sha256sums=('3f778ad6d9c3bce1d9705b1b4f14ccf0f2d911afac5c22baa465801f94e697a5'
            '05f63e5dcfdf6bd0bab81b5083bcb7221233f5f74665f7481160d1d028750a89'
            '65ad756cc7b2a3274f982f5cbcff546808408eeaa5f9dbdc8e498c69e9fa006a'
            'c5613b61c143e5fc1fde6661b6808effc80e1eebf2bd954e17eb2382ef72400b'
            '6e8f5e4840fc0911bef819c3c3e1e393bb50abf54542a23e62148d468a21c653')

package() {
  install -Dvm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/szyszka"
  install -Dvm 644 "szyszka-$pkgver.desktop" "$pkgdir/usr/share/applications/com.github.qarmin.szyszka.desktop"
  install -Dvm 644 "szyszka-$pkgver.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.github.qarmin.szyszka.svg"
  install -Dvm 644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dvm 644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
