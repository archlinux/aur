# Maintainer: M0Rf30

pkgname=gnome-shell-theme-london-smoke
pkgver=1.3
pkgrel=1
pkgdesc="A Gnome-Shell theme by theRealPadster." 
url="http://therealpadster.deviantart.com/art/London-Smoke-Gnome-Shell-207708800"
license=('GPL3')
arch=('any')
depends=('gnome-shell')
makedepends=('unzip')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://www.deviantart.com/download/207708800/london_smoke_gnome_shell_by_therealpadster-d3fnx4w.zip")

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/themes/
  cp -r London\ Smoke $pkgdir/usr/share/themes/
}


md5sums=('4d838abab42204a95f479f0e9137fa3f')
