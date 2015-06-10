# Contributors: Max Pray a.k.a. Synthead <synthead@gmail.com>
#               Swyter                   <swyterzone+aur@gmail.com>

# Based on ttf-eurostile, should be probably merged with that one, or at least used partially.

pkgname=ttf-eurostile-complete
pkgver=0
pkgrel=4
pkgdesc='A popular font with an appeal both technical and functional, includes all variations'

arch=('any')

url='https://en.wikipedia.org/wiki/Eurostile'

license=('unknown')

depends=(
    'fontconfig'
    'xorg-font-utils'
)

install=ttf.install

source=(
    'https://github.com/numerics/WorkBench/raw/master/UIFont/Font%20Files/Eurosti.TTF'
    'https://github.com/numerics/WorkBench/raw/master/UIFont/Font%20Files/Eurostib.TTF'
    
    'https://github.com/numerics/WorkBench/raw/master/UIFont/Font%20Files/Eurostile.ttf'
    'https://github.com/numerics/WorkBench/raw/master/UIFont/Font%20Files/EurostileBold.ttf'
    
    'https://github.com/numerics/WorkBench/raw/master/UIFont/Font%20Files/Eurostile-Bla.otf'
    'https://github.com/numerics/WorkBench/raw/master/UIFont/Font%20Files/Eurostile-BlaIta.otf'
    'https://github.com/numerics/WorkBench/raw/master/UIFont/Font%20Files/Eurostile-Bol.otf'
    'https://github.com/numerics/WorkBench/raw/master/UIFont/Font%20Files/Eurostile-BolObl.otf'
    'https://github.com/numerics/WorkBench/raw/master/UIFont/Font%20Files/Eurostile-Hea.otf'
    'https://github.com/numerics/WorkBench/raw/master/UIFont/Font%20Files/Eurostile-HeaIta.otf'
    'https://github.com/numerics/WorkBench/raw/master/UIFont/Font%20Files/Eurostile-Med.otf'
    'https://github.com/numerics/WorkBench/raw/master/UIFont/Font%20Files/Eurostile-MedIta_0.otf'
    'https://github.com/numerics/WorkBench/raw/master/UIFont/Font%20Files/Eurostile-RegObl_0.otf'
    
    'https://github.com/numerics/WorkBench/raw/master/UIFont/Font%20Files/EurostileCon-Hea.otf'
    'https://github.com/numerics/WorkBench/raw/master/UIFont/Font%20Files/EurostileCon-HeaIta_0.otf'
    'https://github.com/numerics/WorkBench/raw/master/UIFont/Font%20Files/EurostileCon-RegIta_0.otf'
    'https://github.com/numerics/WorkBench/raw/master/UIFont/Font%20Files/EurostileCon-Reg_0.otf'
    
    'https://github.com/numerics/WorkBench/raw/master/UIFont/Font%20Files/EurostileExt-Bla.otf'
    'https://github.com/numerics/WorkBench/raw/master/UIFont/Font%20Files/EurostileExt-Med.otf'
)

md5sums=(
    'b042448c79c0938412ca21e9dd67de96'
    '91821cf31c92f68541b23b84d50b7251'

    '1175a331b7c9c85285913572873529db'
    '5d3c4a34c8744610e421024f21b2cea5'

    '29b1b8f52d3812182dee894d00b01e53'
    'e1c384dbaa902185f6b2cd4f7815615e'
    '081a53b19f0c90ad1dc2f8fd347d3487'
    'f53bc6b4a1fd9ee42210f4d8e2065796'
    'a9ebf2ea334f937864ccbb662190fabf'
    'a7de29f8079359b0f0d172e414d7adf9'
    '554844524cd9817e7adb36655a4852cd'
    'c35460e1e5d37f0437c39961f41b7af6'
    '55f777a4e0f06fbc96b7b5ab3af221c8'

    '45e3abf1356c05ec6d73ab17a68fa58b'
    '822c1fa7af47657f58a1aab30abf9290'
    '0700dbdd11bbd74e41cc7db7158573ac'
    '235cc03824cfc8da754d8c4e78e1c553'

    'e57dc0a85062f0f22467582ada850cda'
    '071122320c4f5046942dbb212cb82eda'
)

package()
{
    install -Dm 644 "$srcdir/Eurosti.TTF"               "$pkgdir/usr/share/fonts/TTF/Eurosti.TTF"
    install -Dm 644 "$srcdir/Eurosti.TTF"               "$pkgdir/usr/share/fonts/TTF/Eurosti.TTF"
    install -Dm 644 "$srcdir/Eurostib.TTF"              "$pkgdir/usr/share/fonts/TTF/Eurostib.TTF"

    install -Dm 644 "$srcdir/Eurostile-Bla.otf"         "$pkgdir/usr/share/fonts/OTF/Eurostile-Bla.otf"
    install -Dm 644 "$srcdir/Eurostile-BlaIta.otf"      "$pkgdir/usr/share/fonts/OTF/Eurostile-BlaIta.otf"
    install -Dm 644 "$srcdir/Eurostile-Bol.otf"         "$pkgdir/usr/share/fonts/OTF/Eurostile-Bol.otf"
    install -Dm 644 "$srcdir/Eurostile-BolObl.otf"      "$pkgdir/usr/share/fonts/OTF/Eurostile-BolObl.otf"
    install -Dm 644 "$srcdir/Eurostile-Hea.otf"         "$pkgdir/usr/share/fonts/OTF/Eurostile-Hea.otf"
    install -Dm 644 "$srcdir/Eurostile-HeaIta.otf"      "$pkgdir/usr/share/fonts/OTF/Eurostile-HeaIta.otf"
    install -Dm 644 "$srcdir/Eurostile-Med.otf"         "$pkgdir/usr/share/fonts/OTF/Eurostile-Med.otf"
    install -Dm 644 "$srcdir/Eurostile-MedIta_0.otf"    "$pkgdir/usr/share/fonts/OTF/Eurostile-MedIta_0.otf"
    install -Dm 644 "$srcdir/Eurostile-RegObl_0.otf"    "$pkgdir/usr/share/fonts/OTF/Eurostile-RegObl_0.otf"

    install -Dm 644 "$srcdir/Eurostile.ttf"             "$pkgdir/usr/share/fonts/TTF/Eurostile.ttf"
    install -Dm 644 "$srcdir/EurostileBold.ttf"         "$pkgdir/usr/share/fonts/TTF/EurostileBold.ttf"

    install -Dm 644 "$srcdir/EurostileCon-Hea.otf"      "$pkgdir/usr/share/fonts/OTF/EurostileCon-Hea.otf"
    install -Dm 644 "$srcdir/EurostileCon-HeaIta_0.otf" "$pkgdir/usr/share/fonts/OTF/EurostileCon-HeaIta_0.otf"
    install -Dm 644 "$srcdir/EurostileCon-RegIta_0.otf" "$pkgdir/usr/share/fonts/OTF/EurostileCon-RegIta_0.otf"
    install -Dm 644 "$srcdir/EurostileCon-Reg_0.otf"    "$pkgdir/usr/share/fonts/OTF/EurostileCon-Reg_0.otf"
    install -Dm 644 "$srcdir/EurostileExt-Bla.otf"      "$pkgdir/usr/share/fonts/OTF/EurostileExt-Bla.otf"
    install -Dm 644 "$srcdir/EurostileExt-Med.otf"      "$pkgdir/usr/share/fonts/OTF/EurostileExt-Med.otf"
}
