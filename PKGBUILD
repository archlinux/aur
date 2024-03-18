# Maintainer: w0rty <mawo97 at gmail.com>

pkgname=bpftop-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='bpftop provides a dynamic real-time view of running eBPF programs.'
url='https://github.com/Netflix/bpftop'
source=("https://github.com/Netflix/bpftop/releases/download/v${pkgver}/bpftop")
arch=('x86_64')
depends=('glibc' 'libelf' 'gcc-libs' 'zlib')
provides=('bpftop')
conflicts=('bpftop')
license=('Apache-2.0')
b2sums=('7f0054fea407811d9365e1cc010efd63ed3595d03503f36ee8a0e2b0fdfcf5a983eed008469b0128503e5608ebd832ed3b125fdcb9f21436f6fb4aec77b6e165')

package() {
  cd "$srcdir"
  install -Dm755 bpftop "$pkgdir/usr/bin/bpftop"
}

