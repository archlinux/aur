# Maintainer: w0rty <mawo97 at gmail.com>

pkgname=bpftop-bin
pkgver=0.4.2 # renovate: datasource=github-tags depName=Netflix/bpftop
pkgrel=1
pkgdesc='bpftop provides a dynamic real-time view of running eBPF programs.'
url='https://github.com/Netflix/bpftop'
source=("https://github.com/Netflix/bpftop/releases/download/v${pkgver}/bpftop")
arch=('x86_64')
depends=('glibc' 'libelf' 'gcc-libs' 'zlib')
provides=('bpftop')
conflicts=('bpftop')
license=('Apache-2.0')
b2sums=('c3281d256532aad193936a4839bd427b55083c1090d6cc90851f3e7577af60cf2a602cef0f89f074baded538638f2a4e23fa316f20f7976d65775d08cc8e6e8f')

package() {
  cd "$srcdir"
  install -Dm755 bpftop "$pkgdir/usr/bin/bpftop"
}
