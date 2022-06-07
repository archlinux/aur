# Maintainer: JustKidding <jk@vin.ovh>

pkgname=ttf-babelstone-runic
pkgver=7.003
pkgrel=1
pkgdesc="BabelStone Younger Futhark Fonts"
url="https://babelstone.co.uk/Fonts/Runic.html"
arch=(any)
license=(OFL)
source=(https://babelstone.co.uk/Fonts/Download/BabelStoneRunic.ttf
        https://babelstone.co.uk/Fonts/Download/BabelStoneRunicRuled.ttf
        https://babelstone.co.uk/Fonts/BabelStoneOFL.txt)
sha256sums=('722be5d017e3e575d72ad8a4086a25db85ff404338237eddead0400fa0f92731'
            'e0aed20679e7ca63b120b4c805654ae6de2826e4305e0c06416901a2faccff84'
            'd2b1b6e4e9201832e94e6f9231b6c32488cb76ea30c4ef82ca3fac35ec2f0b66')

package() {
    install -Dm644 *.ttf  -t "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 BabelStoneOFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
