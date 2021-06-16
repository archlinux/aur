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
pkgver=0.6.2
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
sha512sums_x86_64=('46c07b649d039f4898be0796eb69b80efccd4ec4ec3bb2e05af2cdb0e33de8578a690662648edcdfc5a10696a0a9005830a720b09ee020cff9333fcb5228e1a1')
sha512sums_i686=('479d0fa1d740655f70e64b2db3f2eab0033abb1f9c878ca927e856eb8253c1b7a86e7f6fdf2c74513cd8915979259018fe3edf5fd6366f7ed32ed7e374ad8fc8')
sha512sums_armv7h=('aac648bff3f49001630376bc6d48148aa92d643972e0aee4184dd2b9ddd0bbdeaced5a6725f79ee545116f4d684e9ac819fedd1a2860667c5f1ec9e6194d55c3')

package() {
  install -Dm755 tectonic -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
