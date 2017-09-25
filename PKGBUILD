# Maintainer: now-im <now.im.627@gmail.com>

pkgname=adapta-kde
pkgver=20170925
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
sha256sums=('6e0278ac794fce33d73d950db100111c16cbcf679b133ec9766f90440127bb69')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"  
}

 package() {
  make -C "${srcdir}/${pkgname}-${pkgver}" DESTDIR="${pkgdir}/" install
}
 
