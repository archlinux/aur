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
pkgver=0.6.3
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
sha512sums_x86_64=('63e48355039d0c99b9b8121884311ab88ddb9f1ef52577442d4a6ff426767d6cab4405243d802f503e11d4260b43666765dad1f71c2e1657d065f734bbcfd5fe')
sha512sums_i686=('7914aa7e0354b31cc733eb91da7e51385258c24ace3cf6c8b0e98bd1846b16124e13f12c23b16ef9a63be0035b1b2ce3f03d8cf3bd8f0b9e0977074263d68f5f')
sha512sums_armv7h=('a4b797b30c4e1592ab0ba43a18dfc9e36c174deb72086fef62918864c3f489d83cde730355674352e1ded409f8f8aeac6353dcaf711f7074d1bd89bfdce65a07')

package() {
  install -Dm755 tectonic -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
