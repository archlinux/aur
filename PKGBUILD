# Maintainer:  kxxt <rsworktech at outlook dot com>
_name=aspeak
pkgname="$_name-bin"
pkgver=4.3.1
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
b2sums=('181dbd101665ec5648ad93e71a221ab365c433aeae5a07d3bc262670fe10e2b8e69c1339969e2fc60daa1250bb5d711180a58ff14418d0ca9e05636aaf26f5f9')


package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_name"
}
