# Maintainer: lmartinez-mirror <lmartinez-mirror@noreply.github.com>
pkgname=tectonic-bin
_pkgname=tectonic
pkgver=0.4.0
pkgrel=1
pkgdesc='Modernized, complete, self-contained TeX/LaTeX engine, powered by XeTex and TeXLive (binary release)'
arch=('x86_64' 'armv7h')
url='https://github.com/tectonic-typesetting/tectonic'
license=('MIT')
depends=('fontconfig' 'harfbuzz-icu' 'openssl')
provides=('tectonic')
conflicts=('tectonic')
source=("https://raw.githubusercontent.com/tectonic-typesetting/tectonic/master/LICENSE")
source_x86_64=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$_pkgname%40$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_armv7h=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$_pkgname%40$pkgver/$_pkgname-$pkgver-arm-unknown-linux-musleabihf.tar.gz")
sha512sums=('5d2f16e9171ba223b0d9d12b0c022718e02b2a8738ec4a664b9eb2ca19d7b67f178f6606edd75a8201e1ab99a88937b9e4c4d01e4a3cdf0ccfedb536207db0a3')
sha512sums_x86_64=('9aafda2b8379af7f5c3bcd2e2018003821489af695bbaa7760da7d3453e9779e42c23776ee9ab9ab23e2b806295a0bac61b8038c433a7eb13bd0f0149d950521')
sha512sums_armv7h=('a0728ab46ed405f9a48ea6b5a2f18e552d0b9dc4fe5bd7f1d4194afd6b9b9fda30a146baa3fd77c9dfeb8d12deaa08e060d7457aa6af38649f0a207abd2ac3b5')

package() {
  install -Dm755 tectonic -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
}

