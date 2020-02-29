# Maintainer: Fabius
# Contributor: Marco Pompili 'marcs' <marcs.pompili@gmail.com>
# Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>

pkgname=festival-italian-voice-mbrola
arch=('any')
pkgver=3.0.1h
pkgrel=2
pkgdesc="Italian MBROLA voices for Festival"
url="http://www.pd.istc.cnr.it/FESTIVAL/home/default.htm"
license=("custom:Mbrola")
depends=('mbrola' 'festival-italian')
source=("https://web.archive.org/web/20160324200907if_/http://tcts.fpms.ac.be/synthesis/mbrola/dba/it3/it3-010304.zip"
        "https://web.archive.org/web/20160324200757if_/http://tcts.fpms.ac.be/synthesis/mbrola/dba/it4/it4-010926.zip")
sha256sums=('d134b522d0aa68dbece9144e395246396cff9ff5e91d1c7b6a24d5a061e6ade5'
         '8ec74af698fdd9bebf37cbf0877bc2f0382df60ff6cbe7c4c72186ba5b809a69')
package() {
    mkdir -p $pkgdir/usr/share/festival/voices/italian/{lp_mbrola,pc_mbrola}
    rm it3/*.txt
    rm it4/*.txt
    cp -a it4 $pkgdir/usr/share/festival/voices/italian/lp_mbrola/
    cp -a it3 $pkgdir/usr/share/festival/voices/italian/pc_mbrola/
}
