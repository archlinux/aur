# Maintainer: pineappletoad

pkgname=cannelloni-bin
pkgver=2.1.2
_pkgrel_src=1
pkgrel=1
pkgdesc="cannelloni is written in C++11 and uses UDP, TCP or SCTP to transfer CAN frames between two machines. (precompiled)"
arch=('x86_64')
url="https://github.com/mguentner/cannelloni"
license=('GPL-2.0-only')
options=('!debug')
provides=('cannelloni')
conflicts=('cannelloni')
depends=('libgcc_s.so' 'libstdc++.so' 'lksctp-tools')

source=("https://github.com/tubbywrestler/cannelloni-bin/releases/download/${pkgver}-${_pkgrel_src}/cannelloni-${pkgver}-${_pkgrel_src}-x86_64.pkg.tar.zst")
sha256sums=('83ada766cb104111d1732241c65da35c36f74f47cc850113c8fb456246a2109c')

package() {
    bsdtar -xf "${srcdir}/cannelloni-${pkgver}-${_pkgrel_src}-x86_64.pkg.tar.zst" -C "${pkgdir}" --exclude .PKGINFO --exclude .BUILDINFO --exclude .MTREE
}
