# Maintainer: now-im <now.im.627@gmail.com>

pkgname=adapta-kde
pkgver=20170921
pkgrel=1
pkgdesc="Adapta KDE customization"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/adapta-kde"
license=('GPL3')
depends=('kwin' 'plasma-desktop' 'papirus-icon-theme')
optdepends=('konsole: For the Konsole color scheme'
            'yakuake: For the Yakuake skin'
            'adapta-gtk-theme: Matching GTK theme'
            'kvantum-qt5: Customizing theme more')
makedepends=('make')
conflicts=('adapta-aurorae-theme-git' 'adapta-kde-git')
source=("https://github.com/PapirusDevelopmentTeam/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('425cf4093a1fda74cb8bfa1edbec0e2860331f89c485d38a1a68cfa201e78d92')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"  
}

 package() {
  make -C "${srcdir}/${pkgname}-${pkgver}" DESTDIR="${pkgdir}/" install
}
 
