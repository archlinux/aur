# Maintainer: Thomas L <zobi8225 at gmail dot com>
pkgname=orgamnesia-bin
_pkgname=orgamnesia
pkgver=1.9.0
pkgrel=1
pkgdesc="Lightweight Obsidian: second brain and personal wiki in Rust. Markdown and/or Emacs Org-mode notes. (prebuilt)"
arch=('x86_64')
url="https://github.com/thomas-louvigne/orgamnesia"
license=('GPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3' 'glib2' 'gdk-pixbuf2' 'cairo' 'libsoup3' 'dbus'
         'glibc' 'libgcc' 'hicolor-icon-theme')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
# Nothing is compiled: the package that the release workflow builds from
# packaging/arch-release (so with ORGAMNESIA_PACKAGE=aur) is only unpacked.
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-1-x86_64.pkg.tar.zst")
sha256sums_x86_64=('e77200bb7ce33805d0c90a0f793d43cc0aa6019e493a15d45c2fe74b5cecebb0')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
