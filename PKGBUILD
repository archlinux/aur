# Maintainer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

pkgname=faience-themes
pkgver=0.7
pkgrel=1
pkgdesc="GTK3, GTK2, Metacity and Gnome-Shell themes based on Faenza"
arch=("any")
url="http://tiheum.deviantart.com/art/Gnome-Shell-Faience-255097456"
license=("GPL3")
depends=("gtk-engine-murrine")
optdepends=("gnome-shell: Shell theme"
            "gtk-engine-unico: GTK3 theme"
            "gnome-tweak-tool: Easy theme switcher")
source=("http://fc06.deviantart.net/fs71/f/2014/156/8/3/gtk3_gnome_shell___faience_by_tiheum-d47vmgg.zip")
md5sums=('f02b736c114099e6c4390e5f0d878ca0')

package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/usr/share/themes"

  cp -r Faience Faience-Claire Faience-Ocre "${pkgdir}/usr/share/themes/"
}

# vim:set ts=2 sw=2 et:
