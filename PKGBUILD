# Maintainer: lmartinez-mirror <lmartinez-mirror@noreply.github.com>
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
pkgver=0.5.0
pkgrel=0
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
sha512sums_x86_64=('476508e75f8de0ceac149c72647e46c8ec5e2c200084710283604999d2367e3946ff99f5e61b4f764559faa32ca93c75a5ba6fffc2ffbc75f4d89ab0e58bbd95')
sha512sums_armv7h=('4f6fbdca82319a78bb6e25b8127d73d3c4d220265a1f31799176881fe875e613a4bdff7454b281ed0676cc7049394a499a2f8974166e458c38611dc902a07183')

package() {
  install -Dm755 tectonic -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
