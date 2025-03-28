# Maintainer:  kxxt <rsworktech at outlook dot com>
_name=aspeak
pkgname="$_name-bin"
pkgver=6.1.0
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
b2sums=('0ef76511729045107335a953aa2fee864f4533520f896adf21c2c1600aa19196fd0b0c97af98d6ec532fdb44eaca35e5d431acbf779a1fcc402c0e6fb752725a')


package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_name"
}
