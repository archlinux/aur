# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: tectonic-deploy <sasha+tectonic@hackafe.net>

# The master version of this file is maintained here:
#
#   https://github.com/tectonic-typesetting/tectonic/blob/master/dist/arch/PKGBUILD.bin.in
#
# The version on aur.archlinux.org is updated automatically by the Tectonic
# CI/CD system when new versions are released. Pull requests should be filed
# against Tectonic if the settings in this file need changing.

pkgname=tectonic-bin
_pkgname=tectonic
pkgver=0.6.4
pkgrel=1
pkgdesc='Modernized, complete, self-contained TeX/LaTeX engine, powered by XeTex and TeXLive (binary release)'
arch=('x86_64' 'i686' 'armv7h')
url='https://github.com/tectonic-typesetting/tectonic'
license=('MIT')
depends=('fontconfig' 'harfbuzz-icu' 'openssl')
provides=('tectonic')
conflicts=('tectonic')
source=("https://raw.githubusercontent.com/tectonic-typesetting/tectonic/master/LICENSE")
source_x86_64=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$_pkgname%40$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$_pkgname%40$pkgver/$_pkgname-$pkgver-i686-unknown-linux-gnu.tar.gz")
source_armv7h=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$_pkgname%40$pkgver/$_pkgname-$pkgver-arm-unknown-linux-musleabihf.tar.gz")
sha512sums=('5d2f16e9171ba223b0d9d12b0c022718e02b2a8738ec4a664b9eb2ca19d7b67f178f6606edd75a8201e1ab99a88937b9e4c4d01e4a3cdf0ccfedb536207db0a3')
sha512sums_x86_64=('26759258977130e2f395d885c784476b560d689b8cdefa2dc9b001c56fda3439ec1036651d4ef9cb12ece4356c213c082a4c3b541daf4b6b178f9397f3634fdc')
sha512sums_i686=('17120f4cdbfb6d9b4e7e8710fa3dbf9802fbe9881b55d29800c77bb074a311dbc2881648d8ee9b25a7d4d3d30d9a119ad1bc2b3df20746c630958c6a86d25654')
sha512sums_armv7h=('7107ce5f56fe8a844dec7394b7998a4f4e538c069f666442d25dfdf0a5916decb96ef14dba19dd7c2233a654b57e550d59ebbb5d42381674f276f807a5715c06')

package() {
  install -Dm755 tectonic -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
