# Maintainer: Adrià Arrufat <swiftscythe at gmail dot com>
pkgname=mpv-jamak
pkgver=0.3.0
pkgrel=1
pkgdesc='Interactive OpenSubtitles downloader for mpv in pure Lua'
arch=('any')
url='https://github.com/arrufat/mpv-jamak'
license=('MIT')
depends=('mpv' 'curl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b5b085ab318ab3cb9d092e209b5805baff1842ba0ec9881d4605c3177731f34c')

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 main.lua "$pkgdir/etc/mpv/scripts/jamak/main.lua"
    install -Dm644 jamak.conf.example -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
