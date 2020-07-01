# Maintainer: Ralph Benjamin Ruijs <ralph.benjamin@gmail.com>
# Contributor: Lucas Paul <reilithion+aur@gmail.com>
pkgname=otf-hasklig
pkgver=1.1
pkgrel=3
pkgdesc="A font with symbol ligatures, intended for Haskell code"
arch=(any)
url="https://github.com/i-tu/Hasklig"
license=(OFL)
source=("https://github.com/i-tu/Hasklig/releases/download/1.1/Hasklig-1.1.zip" "LICENSE")
sha512sums=('7621747399c1155faf3f1ba5c73dc4ce829141730fd22c58e97e2f3acf79a45b49dc1cf314af80226dbf3bfbf9a38ceb2de812b46a5d424b6181582429bcc081'
            '25f5196ce0954bd91a3da62fc5044a28a2a1d372c02be5328f74d672005de51f542eb1178f8ab8b0ba1da879ad5c8b67102b555ffb25209238ac0ae0eebe8e74')

package()
{
	install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${srcdir}/Hasklig-Black.otf" "${pkgdir}/usr/share/fonts/OTF/Hasklig-Black.otf"
	install -D -m644 "${srcdir}/Hasklig-BlackIt.otf" "${pkgdir}/usr/share/fonts/OTF/Hasklig-BlackIt.otf"
	install -D -m644 "${srcdir}/Hasklig-Bold.otf" "${pkgdir}/usr/share/fonts/OTF/Hasklig-Bold.otf"
	install -D -m644 "${srcdir}/Hasklig-BoldIt.otf" "${pkgdir}/usr/share/fonts/OTF/Hasklig-BoldIt.otf"
	install -D -m644 "${srcdir}/Hasklig-ExtraLight.otf" "${pkgdir}/usr/share/fonts/OTF/Hasklig-ExtraLight.otf"
	install -D -m644 "${srcdir}/Hasklig-ExtraLightIt.otf" "${pkgdir}/usr/share/fonts/OTF/Hasklig-ExtraLightIt.otf"
	install -D -m644 "${srcdir}/Hasklig-Light.otf" "${pkgdir}/usr/share/fonts/OTF/Hasklig-Light.otf"
	install -D -m644 "${srcdir}/Hasklig-LightIt.otf" "${pkgdir}/usr/share/fonts/OTF/Hasklig-LightIt.otf"
	install -D -m644 "${srcdir}/Hasklig-Medium.otf" "${pkgdir}/usr/share/fonts/OTF/Hasklig-Medium.otf"
	install -D -m644 "${srcdir}/Hasklig-MediumIt.otf" "${pkgdir}/usr/share/fonts/OTF/Hasklig-MediumIt.otf"
	install -D -m644 "${srcdir}/Hasklig-Regular.otf" "${pkgdir}/usr/share/fonts/OTF/Hasklig-Regular.otf"
	install -D -m644 "${srcdir}/Hasklig-It.otf" "${pkgdir}/usr/share/fonts/OTF/Hasklig-It.otf"
	install -D -m644 "${srcdir}/Hasklig-Semibold.otf" "${pkgdir}/usr/share/fonts/OTF/Hasklig-Semibold.otf"
	install -D -m644 "${srcdir}/Hasklig-SemiboldIt.otf" "${pkgdir}/usr/share/fonts/OTF/Hasklig-SemiboldIt.otf"
}
