# Maintainer: Adrià Arrufat <swiftscythe at gmail dot com>
pkgname=mpv-jamak
pkgver=0.4.1
pkgrel=1
pkgdesc='Interactive OpenSubtitles downloader for mpv in pure Lua'
arch=('any')
url='https://github.com/arrufat/mpv-jamak'
license=('MIT')
depends=('mpv' 'curl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('df156bee59ad654317e1355e47c0a16a40f5d1c9bf7404c0317cf9e86d7889e8')

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 main.lua "$pkgdir/etc/mpv/scripts/jamak/main.lua"
    install -Dm644 jamak.conf.example -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
