# Maintainer: Europrimus <aur-g4gra@c-f.me>

pkgbase=grub-theme-davidrevoy-gnulinux
pkgname=('grub-theme-davidrevoy-gnulinux')
pkgver=1
pkgrel=1
pkgdesc="Grub Theme with artwork Gnu/Linux by David Revoy"
arch=('any')
url="https://framagit.org/Europrimus/grub-theme-davidRevoy-gnuLinux"
license=('GPL-3.0-or-later')
depends=('grub')
makedepends=('git')
_commit=22843b5bba21cd53befc0fe56fbfe52e795f4e6e
source=("grub_theme::git+$url.git#commit=$_commit")
sha256sums=('1e5d57a9c439633778f26497e7198d747783c2828b2cd637382086fa001457dc')

package() {
  depends=('grub')
  install=theme.install

  cd "${srcdir}/grub_theme/gnuLinux-Deevad"

  find . -type f -exec install -D -m644 {} "${pkgdir}"/usr/share/grub/themes/gnuLinux-Deevad/{} \;
}
