# Maintainer: Oscar Garcia Amor <ogarcia@connectical.com>

pkgname=otf-ibarra-real
pkgver=2.1
pkgrel=3
pkgdesc='Serif font used for 1780 edition of El Quijote'
arch=('any')
license=('custom:as-is')
url='http://www.ibarrareal.es/'
depends=('fontconfig' 'xorg-font-utils')
source=('http://www.ibarrareal.es/font/ibarrareal.zip'
        'LICENSE')
sha512sums=('e81bfd43c662faf8ab8136cd905212413e992d96b170d5af07a7c4781c97fed174dd0de2617d049b2a91e811eaf409c7be05faa50f91b26365bf691c1f8c7018'
            '6b8e2ab35ae691a55ce385d5065f591099714aa6024778dcbf7f2910a3fd059f346999f0013c0bf5b5bea31504c765f49ce843fe0d77eed0f9d5ece740d8a4d5')
install=$pkgname.install

package() {
	install -dm755 ${pkgdir}/usr/share/fonts/OTF/
	install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
