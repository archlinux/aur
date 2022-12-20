# Maintainer: i3master <fast dot code dot studio at gmail dot com>
# Tip: To use this theme in LXDE, select 'Lubuntu-default' from the list in lxappearance under the 'Widget' tab, 'Icon Theme' tab, and 'Window Border' tab.

# Note: This was forked from lubuntu-artwork to preserve the Lubuntu 18.04 theme, icons, and wallpapers for LXDE before they changed in 18.10.
# The original maintainers and contributers are listed below (from lubuntu-artwork).
# Original Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Original Ex-Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Original Contributor: 謝致邦<Yeking@Red54.com>

pkgname=lubuntu-artwork-18-04
_archivename=lubuntu-artwork
pkgver=0.71
pkgrel=1
pkgdesc='Lubuntu 18.04 default GTK theme, icons, and wallpapers'
arch=('any')
url='http://wiki.ubuntu.com/Lubuntu/Artwork'
license=('GPL')
optdepends=('elementary-icon-theme: icons support'
            'gtk-engine-unico: gtk3 theme support')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/l/${_archivename}/${_archivename}_${pkgver}.tar.xz")
sha256sums=('5374c5a5cf12a439f17ec336db11ccaa6a620e9ad79c5ed9a39c02088189a285')
conflicts=("lubuntu-artwork")

package(){
    # Some apps in LXDE (including lxappearance) don't look right until gtk-engine-murrine is installed.
    depends=('gtk-engine-murrine')
    
    cp -r "${srcdir}/${_archivename}/src/usr" "${pkgdir}"
}
