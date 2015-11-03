# Maintainer: Ralph Benjamin Ruijs <ralph.benjamin@gmail.com>
# Contributor: Lucas Paul <reilithion+aur@gmail.com>
pkgname=otf-hasklig
pkgver=0.4
pkgrel=1
pkgdesc="A font with symbol ligatures, intended for Haskell code"
arch=('any')
url="https://github.com/i-tu/Hasklig"
license=('custom:SIL Open Font License')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("https://github.com/i-tu/Hasklig/releases/download/0.4/Hasklig-0.4.zip" "LICENSE")
sha512sums=('6b97d09ec58beefd1321cb118c65d43756d5f3aa8d9221f3d05706697d1dad51bbc772be23ca70d30d2c63837e48b57b169c91b31cc47763e358792133bda774'
            '25f5196ce0954bd91a3da62fc5044a28a2a1d372c02be5328f74d672005de51f542eb1178f8ab8b0ba1da879ad5c8b67102b555ffb25209238ac0ae0eebe8e74')

package()
{
	install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${srcdir}/Hasklig-Black.otf" "${pkgdir}/usr/share/fonts/OTF/Hasklig-Black.otf"
	install -D -m644 "${srcdir}/Hasklig-Bold.otf" "${pkgdir}/usr/share/fonts/OTF/Hasklig-Bold.otf"
	install -D -m644 "${srcdir}/Hasklig-ExtraLight.otf" "${pkgdir}/usr/share/fonts/OTF/Hasklig-ExtraLight.otf"
	install -D -m644 "${srcdir}/Hasklig-Light.otf" "${pkgdir}/usr/share/fonts/OTF/Hasklig-Light.otf"
	install -D -m644 "${srcdir}/Hasklig-Medium.otf" "${pkgdir}/usr/share/fonts/OTF/Hasklig-Medium.otf"
	install -D -m644 "${srcdir}/Hasklig-Regular.otf" "${pkgdir}/usr/share/fonts/OTF/Hasklig-Regular.otf"
	install -D -m644 "${srcdir}/Hasklig-Semibold.otf" "${pkgdir}/usr/share/fonts/OTF/Hasklig-Semibold.otf"
}
