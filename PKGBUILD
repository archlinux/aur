# Maintainer:  kxxt <rsworktech at outlook dot com>
_name=tracexec
pkgname="$_name-bin"
pkgver=0.0.1
pkgrel=1
pkgdesc="A simple text-to-speech client for Azure TTS API"
arch=('x86_64' 'aarch64')
url="https://github.com/kxxt/aspeak"
license=('MIT')
depends=('gcc-libs')
provides=('tracexec')
conflicts=('tracexec')
backup=()
options=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/kxxt/$_name/releases/download/v$pkgver/$_name-$CARCH-unknown-linux-gnu.tar.gz")
noextract=()
b2sums=('e5784779689478d18b4c7a1a63927303a60911a12a02d16d08a6123cca2ee9d97457ff552313f573b942bcdf26dd9007b74b378ae7859787efec09d104408850')


package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_name"
}
