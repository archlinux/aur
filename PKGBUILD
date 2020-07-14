# Maintainer: Phil Ruffwind <rf@rufflewind.com>
pkgname=ttf-share-gf
pkgver=r855.9f59b2e9
pkgrel=2
pkgdesc='Share, Share Tech, and Share Tech Mono fonts from the Google Fonts catalog'
arch=(any)
url=https://github.com/google/fonts
license=(custom:OFL)
provides=(ttf-font ttf-share)
conflicts=(ttf-google-fonts-git ttf-share)
source=(google-fonts-90abd17b4f97671435798b6147b698aa9087612f-ofl-share-OFL.txt::https://raw.githubusercontent.com/google/fonts/90abd17b4f97671435798b6147b698aa9087612f/ofl/share/OFL.txt google-fonts-9f59b2e921a54ad05e911323826e4e6fd02b789c-ofl-share-Share-Bold.ttf::https://raw.githubusercontent.com/google/fonts/9f59b2e921a54ad05e911323826e4e6fd02b789c/ofl/share/Share-Bold.ttf google-fonts-9f59b2e921a54ad05e911323826e4e6fd02b789c-ofl-share-Share-BoldItalic.ttf::https://raw.githubusercontent.com/google/fonts/9f59b2e921a54ad05e911323826e4e6fd02b789c/ofl/share/Share-BoldItalic.ttf google-fonts-9f59b2e921a54ad05e911323826e4e6fd02b789c-ofl-share-Share-Italic.ttf::https://raw.githubusercontent.com/google/fonts/9f59b2e921a54ad05e911323826e4e6fd02b789c/ofl/share/Share-Italic.ttf google-fonts-9f59b2e921a54ad05e911323826e4e6fd02b789c-ofl-share-Share-Regular.ttf::https://raw.githubusercontent.com/google/fonts/9f59b2e921a54ad05e911323826e4e6fd02b789c/ofl/share/Share-Regular.ttf google-fonts-b88f4fcae43761838d6942fd81db8509cd7581ec-ofl-sharetech-ShareTech-Regular.ttf::https://raw.githubusercontent.com/google/fonts/b88f4fcae43761838d6942fd81db8509cd7581ec/ofl/sharetech/ShareTech-Regular.ttf google-fonts-a30ff88e1a02d70aaf2589dfc3cef18a4128c495-ofl-sharetechmono-ShareTechMono-Regular.ttf::https://raw.githubusercontent.com/google/fonts/a30ff88e1a02d70aaf2589dfc3cef18a4128c495/ofl/sharetechmono/ShareTechMono-Regular.ttf)
sha512sums=('a80f466c5ed8cb3be78950b47996c65e363cd6980bbc20a38227c75b626119699077f8be4c8b26ab9567819d23a025bad9cc45fc2cc25bd8fc95ae5ac7477ff0'
            '9b5c4cc911f99a702692188991f1d62611f63cc356dc1e5e2fe00ef2f90b5b27ed4fc8f3889170da048fc30999165b35307c9b988fbfc77ab6477bde20a0f44f'
            'a2377b41ec63fc1ae8461c1f7a8589e8444b2912fb3157934a6fe70c9542497ee91a7e466178b8d6214e40caca0d1bdb68e091cdb5349ba3b567a64ed8bbecf8'
            '34f0467dfa468dbc4c8e556a1cdd627140c40e77ff97f19a9f689933f0ed992f29f74d40cadc45cda4aabc34ed971dd4805c0bf09d9c8fb04b66f0d60e9edc57'
            '4a2ec533b16707e9bf31828c05a0bba9403412e38f5a835c3fe0999136e0ad7b047a658bcc7857ab0ce1a76fdb5a5f93dcddc8ebf828de604af3289abde49b91'
            '8f83c91b334638ee31423d8e24be6b537abef9b4d721a5920122a9ae1a54ac4c55a47cd8d2910116216244950c1ca97f518b51e3d984cf99091171290e4fa22b'
            '2f1620fefa48efe74b82f8fab946d728990a26c72902595d9a9051d1ea441feca21ccc5e2b74a48cca283c9fde9a409b07add2f768ef9f942583ad784c44c98b')

package() {
    cd "${srcdir}"
    install -Dm644 google-fonts-90abd17b4f97671435798b6147b698aa9087612f-ofl-share-OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"OFL.txt
    install -Dm644 google-fonts-9f59b2e921a54ad05e911323826e4e6fd02b789c-ofl-share-Share-Bold.ttf "${pkgdir}/usr/share/fonts/TTF/${pkgname}/"Share-Bold.ttf
    install -Dm644 google-fonts-9f59b2e921a54ad05e911323826e4e6fd02b789c-ofl-share-Share-BoldItalic.ttf "${pkgdir}/usr/share/fonts/TTF/${pkgname}/"Share-BoldItalic.ttf
    install -Dm644 google-fonts-9f59b2e921a54ad05e911323826e4e6fd02b789c-ofl-share-Share-Italic.ttf "${pkgdir}/usr/share/fonts/TTF/${pkgname}/"Share-Italic.ttf
    install -Dm644 google-fonts-9f59b2e921a54ad05e911323826e4e6fd02b789c-ofl-share-Share-Regular.ttf "${pkgdir}/usr/share/fonts/TTF/${pkgname}/"Share-Regular.ttf
    install -Dm644 google-fonts-b88f4fcae43761838d6942fd81db8509cd7581ec-ofl-sharetech-ShareTech-Regular.ttf "${pkgdir}/usr/share/fonts/TTF/${pkgname}/"ShareTech-Regular.ttf
    install -Dm644 google-fonts-a30ff88e1a02d70aaf2589dfc3cef18a4128c495-ofl-sharetechmono-ShareTechMono-Regular.ttf "${pkgdir}/usr/share/fonts/TTF/${pkgname}/"ShareTechMono-Regular.ttf
}
