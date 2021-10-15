# Maintainer: TSTman <tstman@protonmail.com>
pkgname=notrisfoes-desktop
pkgver=0.2.0
pkgrel=1
pkgdesc='Notris Foes desktop client'
url=https://notrisfoes.com/
arch=('x86_64')
license=()
depends=(gtk3 libxss nss)
source_x86_64=("${pkgname}-${pkgver}.${CARCH}.rpm::https://notrisfoes.com/download/notris-foes-0.2.0.rpm")
sha512sums_x86_64=(ddabb9c9d02bd723771e89de739d687b855fb0f745de14875962b7255b515adf52fac42122c311bb640abb5f81eed19c58a040872cf7b70f6de9abbb7ee3d778)
b2sums_x86_64=(eb9f0a70e75c6c850480c0ac2e816721124bb7eeffd0f0609ea8b62a0daa0677bd28b42a3b239a613bfec6012f682565709c11b5145578470670fab3c1ad369a)

package() {
  cp -a "${srcdir}/usr" "$pkgdir"
}

# vim: ts=2 sw=2 et:
