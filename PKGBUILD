# Maintainer: Adrià Arrufat <swiftscythe at gmail dot com>
pkgname=mpv-jamak
pkgver=0.4.8
pkgrel=1
pkgdesc='Interactive OpenSubtitles downloader for mpv in pure Lua'
arch=('any')
url='https://github.com/arrufat/mpv-jamak'
license=('MIT')
depends=('mpv' 'curl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('075455a2ee9520885ee3c0e74c699aaa9ee89ffb31c9ab3a59887e9c1777e29a')

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 main.lua "$pkgdir/etc/mpv/scripts/jamak/main.lua"
    install -Dm644 jamak.conf.example -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
