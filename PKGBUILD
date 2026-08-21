# Maintainer: Bogdan Szabo <contact@szabobogdan.com>
#
# This PKGBUILD is auto-generated from PKGBUILD.template by release.lash on
# each tagged release. pkgver and sha256sums are filled in; everything else
# is the literal template content.

pkgname=lash-shell-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="Dual-grammar shell and scripting language with debugger, LSP, and monitor"
arch=('x86_64')
url="https://lash.szabobogdan.com/"
license=('MIT')
depends=('glibc')
provides=('lash' 'lash-shell')
conflicts=('lash' 'lash-shell')
options=('!strip' '!debug')
source=("https://gitlab.com/szabobogdan3/lash/-/releases/v${pkgver}/downloads/lash-shell-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('4b3bdf2250fa5c0ef986c98587f6ca0615d2002537a2bee82c30da28169b3efb')

package() {
  cd "$srcdir"
  bsdtar -xf "lash-shell-${pkgver}-1-x86_64.pkg.tar.zst" -C "$pkgdir"
  # Strip Arch metadata from the wrapped pkg — makepkg generates its own.
  rm -f "$pkgdir/.PKGINFO" "$pkgdir/.MTREE" "$pkgdir/.BUILDINFO" "$pkgdir/.INSTALL"
}
