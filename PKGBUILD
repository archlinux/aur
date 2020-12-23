# Maintainer: lmartinez-mirror <lmartinez-mirror@noreply.github.com>
pkgname=tectonic-bin
_pkgname=tectonic
pkgver=0.3.3
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
sha512sums_x86_64=('ba5df0ea06375e17547f2c869749f622952a0ae85b7583d666809f29b165df1f1d9757258691d447250f879a86db758d418d269999cec0daad37682330f7bcc7')
sha512sums_armv7h=('7d74f970164a3639a4844a2409d609e3016dfd8848233d8d9341a6787d94ffb97fc4bfea58a0eeefe2823c496b4d058679f1823a50a0d9e337495d7b46152c37')

package() {
  install -Dm755 tectonic -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
}

