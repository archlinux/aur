# Contributor: Rasmus <rasmus@gmx.us>
# Maintainer: Carl Mueller  archlinux at carlm e4ward com
DARK="y"

pkgname=jsmath-fonts-extra
pkgver=3.6a
pkgrel=2
pkgdesc="jsMath font archive (extra fonts)"
arch=('any')
license=('Apache')
url="http://www.math.union.edu/~dpvc/jsMath/download/extra-fonts/welcome.html"
install=${pkgname}.install
if [[ $DARK = "y" ]]; then
  DARK=25
else
  DARK=10
fi

source=("http://www.math.union.edu/~dpvc/jsMath/download/extra-fonts/bbold10/${DARK}/jsMath-bbold10.ttf"
"http://www.math.union.edu/~dpvc/jsMath/download/extra-fonts/cmbsy10/${DARK}/jsMath-cmbsy10.ttf"
"http://www.math.union.edu/~dpvc/jsMath/download/extra-fonts/cmmib10/${DARK}/jsMath-cmmib10.ttf"
"http://www.math.union.edu/~dpvc/jsMath/download/extra-fonts/cmss10/${DARK}/jsMath-cmss10.ttf"
"http://www.math.union.edu/~dpvc/jsMath/download/extra-fonts/eufb10/${DARK}/jsMath-eufb10.ttf"
"http://www.math.union.edu/~dpvc/jsMath/download/extra-fonts/eufm10/${DARK}/jsMath-eufm10.ttf"
"http://www.math.union.edu/~dpvc/jsMath/download/extra-fonts/eurb10/${DARK}/jsMath-eurb10.ttf"
"http://www.math.union.edu/~dpvc/jsMath/download/extra-fonts/eurm10/${DARK}/jsMath-eurm10.ttf"
"http://www.math.union.edu/~dpvc/jsMath/download/extra-fonts/eusb10/${DARK}/jsMath-eusb10.ttf"
"http://www.math.union.edu/~dpvc/jsMath/download/extra-fonts/eusm10/${DARK}/jsMath-eusm10.ttf"
"http://www.math.union.edu/~dpvc/jsMath/download/extra-fonts/lasy10/${DARK}/jsMath-lasy10.ttf"
"http://www.math.union.edu/~dpvc/jsMath/download/extra-fonts/lasyb10/${DARK}/jsMath-lasyb10.ttf"
"http://www.math.union.edu/~dpvc/jsMath/download/extra-fonts/msam10/${DARK}/jsMath-msam10.ttf"
"http://www.math.union.edu/~dpvc/jsMath/download/extra-fonts/msbm10/${DARK}/jsMath-msbm10.ttf"
"http://www.math.union.edu/~dpvc/jsMath/download/extra-fonts/rsfs10/${DARK}/jsMath-rsfs10.ttf"
"http://www.math.union.edu/~dpvc/jsMath/download/extra-fonts/stmary10/${DARK}/jsMath-stmary10.ttf"
"http://www.math.union.edu/~dpvc/jsMath/download/extra-fonts/wasy10/${DARK}/jsMath-wasy10.ttf"
"http://www.math.union.edu/~dpvc/jsMath/download/extra-fonts/wasyb10/${DARK}/jsMath-wasyb10.ttf")
md5sums=('3a6a93dbf7fd21b3d98df655c6557268'
         '1d4a717b70c000e5b7abdafd4eda6b80'
         'fe0083751e8d6d90cf419643ead31a20'
         '5717187184dfc55cdb7fcae4507ad068'
         '4bf0c226fa305715ff72d5c8ae5784ff'
         'b8c386d46789cca2d7e9418a0f1c3f05'
         '39712db08efecb8cc592cb8189546d58'
         '0eca1a0aaab00ffd01339ab4c529f56a'
         'ee76b6ac9b3be909c4e9413c12b4b975'
         '673acdb2a401784835e2a19c40303826'
         '30801f6525ed9b055d2c3c5bd5c3e52c'
         '99b570fdc46daab1f405bb5d6beac0ce'
         '05bfd5a79b31d6df9505734acb3aa6c0'
         'bb978269fb31d4341b0c82ae133065c2'
         '3f8a174906e33e7d0baa41221b069c9d'
         '74ffed5ece290ccdf0b24e1ea45690ff'
         '24755c431452187d1b7d3d746b4467ec'
         'a57b66a2ab88ef7de68d0c54fda1a9c0')




package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/share/fonts/TTF/"
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
}
