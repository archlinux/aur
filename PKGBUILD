# Maintainer: VerruckteFuchs <derverrucktefuchs@gmail.com>
pkgname=otf-cp-mono
pkgrel=1
pkgver=v07
pkgdesc="CP Mono OTF font by Tino Meinert Copyright (c) 2009"
arch=('any')
url="https://1-free-fonts.com/font/6748"
license=('CC BY 3.0 DE')
depends=('fontconfig' 'xorg-font-utils')
source=('https://1-free-fonts.com/fonts/download/6748/CPMono.zip')
md5sums=('dcaaa6caaf7faa13f2909d433ec84a99')

package() {
	install -d "${pkgdir}/usr/share/fonts/otf-cp-mono"
	install -m644 "${srcdir}/"*.otf "${pkgdir}/usr/share/fonts/otf-cp-mono"
	install -D -m644 "${srcdir}/CC_License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
