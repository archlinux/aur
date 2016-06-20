# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname='integaur'
pkgver='1.0'
pkgrel=1
pkgdesc='Performs integrity checks on all your AUR packages'
arch=('any')
url='https://github.com/christopherloen/integaur'
license=('GPL3')
depends=('curl' 'wget')
source=('https://github.com/christopherloen/integaur/archive/master.zip')
sha256sums=('410a53e6f3a13d53e183735ed93dfa69b9383da51695293ce2a74624a88e41fc')

package() {
	cd "${srcdir}/${pkgname}-master"
        install -dm755 "${pkgdir}/usr/bin/"
        cp integaur.sh "${pkgdir}/usr/bin/${pkgname}"
        chmod +x "${pkgdir}/usr/bin/${pkgname}"
        install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
        cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
