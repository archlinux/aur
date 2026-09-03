# Maintainer: pineappletoad

pkgname=omniorb-bin
pkgver=4.3.4
_pkgrel_src=1
pkgrel=1
pkgdesc="A CORBA object request broker for C++ and Python. (precompiled)"
arch=('x86_64')
url="http://omniorb.sourceforge.net/"
license=('GPL-2.0-or-later' 'LGPL-2.0-or-later')
options=('!debug')
provides=('omniorb')
conflicts=('omniorb')
depends=('python' 'zstd')

source=("https://github.com/tubbywrestler/omniorb-bin/releases/download/${pkgver}-${_pkgrel_src}/omniorb-${pkgver}-${_pkgrel_src}-x86_64.pkg.tar.zst")
sha256sums=('881f3851d68bc4e9c703d13edee13910ac79d9037b6e97f03879ce01c58f4a37')

package() {
    bsdtar -xf "${srcdir}/omniorb-${pkgver}-${_pkgrel_src}-x86_64.pkg.tar.zst" -C "${pkgdir}" --exclude .PKGINFO --exclude .BUILDINFO --exclude .MTREE
}
