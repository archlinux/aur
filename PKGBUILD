# Maintainer: w0rty <mawo97 at gmail.com>

pkgname=bpftop-bin
pkgver=0.2.3
pkgrel=1
pkgdesc='bpftop provides a dynamic real-time view of running eBPF programs.'
url='https://github.com/Netflix/bpftop'
source=("https://github.com/Netflix/bpftop/releases/download/v${pkgver}/bpftop")
arch=('x86_64')
depends=('glibc' 'libelf' 'gcc-libs' 'zlib')
provides=('bpftop')
conflicts=('bpftop')
license=('Apache-2.0')
b2sums=('3a81e6b1fa2e48a9f44daca7cb03baa91f91bb60436671125da8196464a2490366a33bc54eb6a6810643b932f0d46ed23e810da535325c6838022885f57c5667')

package() {
  cd "$srcdir"
  install -Dm755 bpftop "$pkgdir/usr/bin/bpftop"
}

