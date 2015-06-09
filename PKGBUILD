# Maintainer: Daniel J. Campos <dcampos2015 at my dot fit dot edu>
# Contributor: Pall Andrei <andreipall at yahoo dot com>
pkgname=darkcold-xfce-theme
pkgver=4.9
pkgrel=1
pkgdesc="A simple and clean dark theme for Xfce"
arch=('any')
url="http://gnome-look.org/content/show.php/DarkCold?content=143165"
license=('GPL')
depends=('gtk-xfce-engine')
#optdepends=('mist-icon-theme: from AUR')
#install='darkcold-xfce-theme.install'
source=('http://xfce-look.org/CONTENT/content-files/148515-DarkCold-OriginalSeed-xfwm.tar.gz'	
'https://github.com/originalseed/darkcold/archive/master.zip')
sha256sums=('996a9c823521101f47f84ea3cb48870c8baa0f0a1d63e20a237febb95604c42e'
            '9973f2d8a9260691d456932b66f6738868386ef665dc3f0ed04c8a125b13ef22')

package() {
  cd ${srcdir}/DarkCold-OriginalSeed-xfwm
  install -d "${pkgdir}/usr/share/themes"
  cp -R DarkCold3 ${pkgdir}/usr/share/themes || return 1
  cp -R DarkCold4 ${pkgdir}/usr/share/themes || return 1
  cp -R DarkCold5 ${pkgdir}/usr/share/themes || return 1
  cp -R ${srcdir}/darkcold-master ${pkgdir}/usr/share/themes || return 1
}

