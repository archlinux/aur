# Maintainer: Bart Janssens <bart at bartjanssens dot org>

pkgname=ttf-juliamono
_commit='3e9bd602b89ecd377f536007e8fdd75b80e01d60'
pkgver=0.006
pkgrel=1
pkgdesc='JuliaMono is a monospace typeface designed for programming in Julia.'
arch=('any')
url='https://juliamono.netlify.app/'
license=('custom:SIL Open Font License v1.1')
depends=('xorg-fonts-encodings')
source=("JuliaMono-Black-${pkgver}.ttf::https://github.com/cormullion/juliamono/raw//${_commit}/JuliaMono-Black.ttf"
        "JuliaMono-Bold-${pkgver}.ttf::https://github.com/cormullion/juliamono/raw//${_commit}/JuliaMono-Bold.ttf"
        "JuliaMono-ExtraBold-${pkgver}.ttf::https://github.com/cormullion/juliamono/raw//${_commit}/JuliaMono-ExtraBold.ttf"
        "JuliaMono-Light-${pkgver}.ttf::https://github.com/cormullion/juliamono/raw//${_commit}/JuliaMono-Light.ttf"
        "JuliaMono-Medium-${pkgver}.ttf::https://github.com/cormullion/juliamono/raw//${_commit}/JuliaMono-Medium.ttf"
        "JuliaMono-Regular-${pkgver}.ttf::https://github.com/cormullion/juliamono/raw//${_commit}/JuliaMono-Regular.ttf"
        "${pkgname}-${pkgver}-OFL.txt::https://github.com/cormullion/juliamono/raw//${_commit}/LICENSE")
sha256sums=('a229bcd1c7e7b7ab540cf145233224fd0dbeec736cd34baaf0cc47027a6b8d26'
            '559c51fb69bcc9c122d4ce6ca9499e634c55154728cbfbf4cd2cb976da520ff3'
            '06b2361d95e950bfe49348b57f79cf23111b83603b335bdfda3c7eba08fc9c48'
            '01a8c81a791cc32f8c43acec0ca8f2d0ae882e1d02a2733bfb2c66652b2532c7'
            '8af340f12d60be7a234aa7db2706ae52d5e18bc1c118f33ec236ec56f6614e14'
            '94d84bdab1efff88bfbba08998ffafc7f455623e2707537822377ae94a0b8a6c'
            'ad318726d621bcfe3d67623a048a18af12eaac219537c3e931dede6a85b11ab4')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 JuliaMono-Black-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/JuliaMono-Black.ttf"
  install -m 644 JuliaMono-Bold-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/JuliaMono-Bold.ttf"
  install -m 644 JuliaMono-ExtraBold-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/JuliaMono-ExtraBold.ttf"
  install -m 644 JuliaMono-Light-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/JuliaMono-Light.ttf"
  install -m 644 JuliaMono-Medium-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/JuliaMono-Medium.ttf"
  install -m 644 JuliaMono-Regular-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/JuliaMono-Regular.ttf"
  install -Dm644 ${pkgname}-${pkgver}-OFL.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
