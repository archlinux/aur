# Maintainer: Bogdan Szabo <contact@szabobogdan.com>
#
# This PKGBUILD is auto-generated from PKGBUILD.template by release.lash on
# each tagged release. pkgver and sha256sums are filled in; everything else
# is the literal template content.

pkgname=lash-shell-bin
pkgver=0.13.0
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
sha256sums=('25e3b4e3876678729bd643926ec561f5dc16a2f660506c6034150909d9ee91b1')

package() {
  cd "$srcdir"
  bsdtar -xf "lash-shell-${pkgver}-1-x86_64.pkg.tar.zst" -C "$pkgdir"
  # Strip Arch metadata from the wrapped pkg — makepkg generates its own.
  rm -f "$pkgdir/.PKGINFO" "$pkgdir/.MTREE" "$pkgdir/.BUILDINFO" "$pkgdir/.INSTALL"
}
