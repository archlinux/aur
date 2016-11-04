# Maintainer: ThePilot <afuturepilotis at gmail dot com>
# Contributor: deadsurgeon42 <deadsurgeon42 at gmail dot com>
pkgname=vibrancy-colors
pkgver=2.7
pkgrel=2
pkgdesc="A flat icon theme composed from many open source icon projects"
arch=('any')
url="http://www.ravefinity.com/p/vibrancy-colors-gtk-icon-theme.html"
license=('CCPL:by-sa' 'GPL2')
options=('!strip')
source=("http://download.opensuse.org/repositories/home:/Pival81/Fedora_23/noarch/$pkgname-icon-theme-$pkgver-3.1.noarch.rpm")
sha1sums=('b499f48c74660e6bf2aa6210531a094e79e277b7')

package() {
  install -d "$pkgdir"/usr/share/icons
  cp -r usr/share/icons/* "$pkgdir"/usr/share/icons
}
