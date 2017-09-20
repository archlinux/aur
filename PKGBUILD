# Maintainer: now-im <now.im.627@gmail.com>

pkgname=adapta-kde
pkgver=20170920
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
sha256sums=('bc145bee8b21959dfb5b3a57ee116d4e1e1550eb364109ae95fa390b0131413f')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"  
}

 package() {
  make -C "${srcdir}/${pkgname}-${pkgver}" DESTDIR="${pkgdir}/" install
}
 
