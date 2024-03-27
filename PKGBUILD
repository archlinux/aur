# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: JustKidding <jk@vin.ovh>

pkgname=ttf-babelstone-runic
pkgver=7.004
pkgrel=1
pkgdesc="BabelStone Younger Futhark Fonts"
url="https://babelstone.co.uk/Fonts/Runic.html"
arch=(any)
license=(OFL)
source=(https://babelstone.co.uk/Fonts/Download/BabelStoneRunic.ttf
        https://babelstone.co.uk/Fonts/Download/BabelStoneRunicRuled.ttf
        https://babelstone.co.uk/Fonts/BabelStoneOFL.txt)
sha256sums=('ea2e72bb807388212c8abecb2f806aff5ea6a278b5a337d506b18b3134533561'
            '25dcb9a929919b11944d6c8e52d8f15e770f4d4370c26e15b88dbfd1887cd127'
            'd2b1b6e4e9201832e94e6f9231b6c32488cb76ea30c4ef82ca3fac35ec2f0b66')

package() {
    install -Dm644 BabelStoneRunic.ttf  -t "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 BabelStoneRunicRuled.ttf  -t "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 BabelStoneOFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
