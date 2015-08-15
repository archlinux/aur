# Maintainer: Javier Tia <javier.tia at gmail dot com>

pkgname=gnomishdark-theme
pkgver=20140509
pkgrel=2
pkgdesc="A clean dark theme for GTK3 / GTK2, based on Adwaita (provided by gnome-themes-standard), plus a matching GNOME-Shell theme."
arch=('any')
url="http://tsujan.deviantart.com/art/GnomishDark-300548460"
license=('CC')
source=('http://fc03.deviantart.net/fs71/f/2014/129/9/c/gnomishdark_by_tsujan-d4yxsoc.7z')
sha256sums=('ff238a19d813f974bad75d6c070d5bfc9b9d31e684b8bb161be35ab496ffbeba')
depends=('gtk-engine-murrine')
makedepends=('p7zip')
optdepends=('gnome-themes-standard: Default themes for the GNOME desktop' 'gnome-tweak-tool: A tool to customize advanced GNOME 3 options' 'gnome-shell-extension-user-theme: User Theme extension for GNOME Shell' 'nouvegnomegray-icon-theme: nouveGnomeGray is a gray icon set made for dark GTK themes')

package() {
  cd "$srcdir"
  mkdir -p "${pkgdir}"/usr/share/themes
  cp -rf GnomishDark "${pkgdir}"/usr/share/themes/
  chmod 755 -R "$pkgdir/usr/share/themes"
}

# vim:set ft=sh ts=2 sw=2 et:
