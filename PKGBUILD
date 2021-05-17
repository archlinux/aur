# Maintainer: Matteo Bendotti <https:massivebox.eu.org/>

pkgname=algobuild
pkgver=0.85
pkgrel=1
pkgdesc="Algobuild is a simple flow chart creator and pseudocode executor written in Java."
arch=("any")
url="https://algobuild.com/en/download.html"
license=('https://algobuild.com/en/license.html')
depends=('jre8-openjdk')
install="${pkgname}.install"
source=(algobuild algobuild.jar algobuild.png algobuild.desktop LICENSE.txt)
noextract=("${pkgname}.jar")
package() {
	echo aa
    #jar -xf ${srcdir}/${pkgname}.jar LICENSE.txt

    install -Dm644 "${pkgname}.jar" \
                  "${pkgdir}/usr/share/java/${pkgname}/algobuild.jar"
    install -Dm755 "${pkgname}" \
                  "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 ${pkgname}.desktop \
                  "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 ${pkgname}.png \
                  "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    echo a
}
sha256sums=('76cb3b2d6375db51bed6c5745223b0f90eded0da4236cf6e4a8c8a6845e41dc1'
			'dff86f485d67833b9ceb1e5c6301a7377deea887f37400af91b371b6a7bc0ffd'
			'9405e6d5372bdd1b1fadca8ae7f32209254dff6e4b48323252b4b629d25e896a'
			'3585e109f592565c176a4bdba20e3be0ad7cb56df23b0f121b297b2992883e8e'
			'5723bf5f88d0000b64c2d9edf85fbe5de8922bf1e3f860b3fa804ca6b2113b59'
)
