# Maintainer: Adrià Arrufat <swiftscythe at gmail dot com>
pkgname=mpv-jamak
pkgver=0.2.0
pkgrel=1
pkgdesc='Interactive OpenSubtitles downloader for mpv in pure Lua'
arch=('any')
url='https://github.com/arrufat/mpv-jamak'
license=('MIT')
depends=('mpv' 'curl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c8f465d0584c4c0e31cd1ea48fb7a69485e0579124496d00e2943c1854664594')

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 main.lua "$pkgdir/etc/mpv/scripts/jamak/main.lua"
    install -Dm644 jamak.conf.example -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
