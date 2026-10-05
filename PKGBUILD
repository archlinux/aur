pkgname=spo-cli-bin
pkgver=0.6.6
pkgrel=1
pkgdesc="a spotify tui app, less is more"
arch=('x86_64')
url="https://github.com/woquchonglang/spo-cli"
license=('GPL-2.1')
depends=('glibc')
options=('!debug' '!strip')
makedepends=('git' 'cmake' 'ninja' 'clang' 'mold' 'sdbus-cpp' 'python' 'pkgconf' 'openssl' 'alsa-lib' 'fftw' 'boost' 'liburing' 'ccache')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/spo-cli-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('30f8fd735cd49ff505809214e1532d5d2df5df9452d5e5aee5a6b62e013cfbda')

package() {
  install -Dm755 "$srcdir/spo-cli" "$pkgdir/usr/bin/spo-cli"
}
