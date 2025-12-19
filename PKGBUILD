# Maintainer: Ramsey Nasser <ram at nas dot sr>
# Contributor: Alex Pyattaev <alex pyattaev at google dot com>
pkgname='roc-nightly-bin'
pkgver=2025.09.09.d73ea109
pkgrel=1
pkgdesc='A fast, friendly, functional language. Work in progress!'
arch=('x86_64')
url="https://www.roc-lang.org"
license=('ULP1.0')
options=('!debug')
depends=('glibc>=2.38' 'binutils>=2.41')
source=("https://github.com/roc-lang/roc/releases/download/alpha4-rolling/roc-linux_x86_64-alpha4-rolling.tar.gz")
sha256sums=('96e8be05e6f7176433ada74532ff36a62b8dc44c5247a82cdf919f2dadc5178b')
replaces=('roc-nightly-bin')

package() {
  install -Dm755 "$srcdir/roc_nightly-linux_x86_64-2025-09-09-d73ea109/roc" "$pkgdir/usr/bin/roc"
  install -Dm755 "$srcdir/roc_nightly-linux_x86_64-2025-09-09-d73ea109/roc_language_server" "$pkgdir/usr/bin/roc_language_server"
}
