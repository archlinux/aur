# Maintainer: now-im <now.im.627@gmail.com>

pkgname=adapta-kde
pkgver=20170918
pkgrel=3
pkgdesc="Adapta KDE customization"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/adapta-kde"
license=('GPL3')
depends=('kwin' 'plasma-desktop' 'papirus-icon-theme')
optdepends=('konsole: For the Konsole color scheme'
            'yakuake: For the Yakuake skin'
            'adapta-gtk-theme: Matching GTK theme'
            'kvantum-theme-arc: Customizing theme more')
makedepends=('make')
conflicts=('adapta-aurorae-theme-git' 'adapta-kde-git')
source=("https://github.com/PapirusDevelopmentTeam/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('6e06db43e10ce5bb521cf5fbb20186ae5ce00db9c1cc07d2b4007dc4c3d32b74')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"  
}

 package() {
  make -C "${srcdir}/${pkgname}-${pkgver}" DESTDIR="${pkgdir}/" install
}
 
