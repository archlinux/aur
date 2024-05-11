# Maintainer: w0rty <mawo97 at gmail.com>

pkgname=bpftop-bin
pkgver=0.5.0 # renovate: datasource=github-tags depName=Netflix/bpftop
pkgrel=1
pkgdesc='bpftop provides a dynamic real-time view of running eBPF programs.'
url='https://github.com/Netflix/bpftop'
source=("https://github.com/Netflix/bpftop/releases/download/v${pkgver}/bpftop")
arch=('x86_64')
depends=('glibc' 'libelf' 'gcc-libs' 'zlib')
provides=('bpftop')
conflicts=('bpftop')
license=('Apache-2.0')
b2sums=('80889097d32a86a9918505d989a2953f74b80fdce2abcd65d90b5416bdc1cfb6909ace2efe67d11f97d1ec659d5b75a30beb0405261377f31862f0a098d588b1')

package() {
  cd "$srcdir"
  install -Dm755 bpftop "$pkgdir/usr/bin/bpftop"
}
