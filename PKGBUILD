#Maintainer: Marco Pompili 'marcs' <marcs.pompili@gmail.com>
#Maintainer: Simone Sclavi 'Ito' <darkhado@gmail.com> 

pkgname=festival-italian-voice-mbrola
arch=('any')
pkgver=3.0.1h
pkgrel=1
pkgdesc="Italian MBROLA voices for Festival"
url="http://www.pd.istc.cnr.it/FESTIVAL/home/default.htm"
license=("custom:Mbrola")
depends=('mbrola' 'festival-italian')
conflicts=('mbrola-italian')
source=("http://tcts.fpms.ac.be/synthesis/mbrola/dba/it3/it3-010304.zip" 
        "http://tcts.fpms.ac.be/synthesis/mbrola/dba/it4/it4-010926.zip")
md5sums=('fed63cdf4da274966646bdac1bd6e630'
         'd70ddbda1085990290e98bf745db1536') 
package() {
    mkdir -p $pkgdir/usr/share/festival/voices/italian/{lp_mbrola,pc_mbrola}
    rm it3/*.txt
    rm it4/*.txt
    cp -a it4 $pkgdir/usr/share/festival/voices/italian/lp_mbrola/
    cp -a it3 $pkgdir/usr/share/festival/voices/italian/pc_mbrola/
}
