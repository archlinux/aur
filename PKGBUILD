# Maintainer: shimi <shimi.chen@gmail.com>
pkgname=chemical-mime-data-debian
pkgver=0.1.94_7
pkgrel=1
pkgdesc="Chemical MIME type support Linux desktops."
arch=('any')
url="https://tracker.debian.org/pkg/chemical-mime-data"
license=('LGPL')
depends=('shared-mime-info' 'gnome-mime-data')
options=('!strip' '!emptydirs')
provides=('chemical-mime-data')
conflicts=('chemical-mime-data')
source=("http://ftp.fr.debian.org/debian/pool/main/c/chemical-mime-data/chemical-mime-data_$pkgname_${pkgver/_/-}_all.deb")
sha512sums=('f51f914d10ac34e29450893dea717c04ac1d9ab8c2f01fb1fe3aaa8b4202bc127a484aaf1be135a6e1ec5be26ad7b9e1b551fbcd37f6646a087dc6a2c857898c')

package(){

         tar xf data.tar.xz -C "${pkgdir}"

}
