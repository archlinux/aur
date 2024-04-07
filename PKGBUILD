# Maintainer: w0rty <mawo97 at gmail.com>

pkgname=bpftop-bin
pkgver=0.4.1
pkgrel=1
pkgdesc='bpftop provides a dynamic real-time view of running eBPF programs.'
url='https://github.com/Netflix/bpftop'
source=("https://github.com/Netflix/bpftop/releases/download/v${pkgver}/bpftop")
arch=('x86_64')
depends=('glibc' 'libelf' 'gcc-libs' 'zlib')
provides=('bpftop')
conflicts=('bpftop')
license=('Apache-2.0')
b2sums=('75dd814e3348f5de7ab22136603777eeb45c4e234e2077d6133018994743098ce5a10b4d836274631b4d7e7019e7c5ce0367bdbc3c3a0a8d37bc248dce459f1a')

package() {
  cd "$srcdir"
  install -Dm755 bpftop "$pkgdir/usr/bin/bpftop"
}

