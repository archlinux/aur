# Maintainer: Phil Ruffwind <rf@rufflewind.com>
pkgname=ttf-share-gf
pkgver=r534.b88f4fc
pkgrel=1
pkgdesc='Share, Share Tech, and Share Tech Mono fonts from the Google Fonts catalog'
arch=(any)
url=https://github.com/google/fonts
license=(custom:OFL)
depends=(fontconfig xorg-fonts-encodings xorg-mkfontdir xorg-mkfontscale)
provides=(ttf-font ttf-share)
conflicts=(ttf-google-fonts-git ttf-share)
source=(OFL.txt Share-Bold.ttf Share-BoldItalic.ttf Share-Italic.ttf Share-Regular.ttf ShareTech-Regular.ttf ShareTechMono-Regular.ttf)
sha512sums=('a80f466c5ed8cb3be78950b47996c65e363cd6980bbc20a38227c75b626119699077f8be4c8b26ab9567819d23a025bad9cc45fc2cc25bd8fc95ae5ac7477ff0'
            'dc2108cfd25e7a79bea2d6a205833f3cabb5ccf628e9bfff5dcbf6d105dca3103eb4ac99b2f7659d440f36881f7dc83c1bf04d1aeb6bfe24c9cc44f683af7e8f'
            '5efb2ba3f8733b9b19fbc6b614a3962296ce3216ab37ab8e4f2412d83d58fb1e9d49c79c1f37463016da25608523781582e328ec213f586f3cf003d347725f79'
            '9a35b83d277452036eb2ba39dbb44c9438c60c3e26e9495b36e2dc49b08af2e4b5a6158e995aa82c1d672b5b79912c0b8985a702361f2d5fe48b07e75c4d9398'
            '273f774de519162ebf5ca85b56a306570f979621ec2246b84ce10d33c5003673ca601f757a3a705ef1f3bb3f5ae1afd8a33e3ef9cb8b78f1e906e3317c6aa58c'
            '8f83c91b334638ee31423d8e24be6b537abef9b4d721a5920122a9ae1a54ac4c55a47cd8d2910116216244950c1ca97f518b51e3d984cf99091171290e4fa22b'
            '2f1620fefa48efe74b82f8fab946d728990a26c72902595d9a9051d1ea441feca21ccc5e2b74a48cca283c9fde9a409b07add2f768ef9f942583ad784c44c98b')

package() {
    cd "${srcdir}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" OFL.txt
    install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" Share-Bold.ttf Share-BoldItalic.ttf Share-Italic.ttf Share-Regular.ttf ShareTech-Regular.ttf ShareTechMono-Regular.ttf
}
