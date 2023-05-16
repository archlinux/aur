# Maintainer:  kxxt <rsworktech at outlook dot com>
_name=aspeak
pkgname="$_name-bin"
pkgver=5.2.0
pkgrel=1
pkgdesc="A simple text-to-speech client for Azure TTS API"
arch=('x86_64')
url="https://github.com/kxxt/aspeak"
license=('MIT')
depends=('openssl' 'alsa-lib' 'gcc-libs')
provides=('aspeak')
conflicts=('aspeak')
backup=()
options=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/kxxt/$_name/releases/download/v$pkgver/$_name-$CARCH-unknown-linux-gnu.tar.gz")
noextract=()
b2sums=('381630d6d8c6163c4002fbe795ae4dfd27cd13c04b85ead5bf33d6ffcc6ee92b6672c6b5cd47cf905547ff3567a87194c20b797e573c92315a692f2cc488dee0')


package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_name"
}
