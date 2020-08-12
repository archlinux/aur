# Maintainer: Emanuel Serpa <emanuelvserpa@gmail.com>

pkgname=whatsapp-nativefier-notray-hook
pkgver=1
pkgrel=1
pkgdesc="Pacman hook to disable whatsapp-nativefier tray after install or upgrade."
arch=("any")
license=("GPL")
depends=('whatsapp-nativefier')
source=(whatsapp-nativefier-notray.hook whatsapp-nativefier-notray)
sha1sums=("7288399ae0ece37b1e1d0b8515145bcd24c005c6"
	"bd27f755644f15ea26fbbc8004e62f93f852fefe")

package() {
    install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
    install -m644 "${srcdir}/whatsapp-nativefier-notray.hook" "${pkgdir}/usr/share/libalpm/hooks/whatsapp-nativefier-notray.hook"
    install -m755 -d "${pkgdir}/usr/share/libalpm/scripts"
    install -m755  "${srcdir}/whatsapp-nativefier-notray" "${pkgdir}/usr/share/libalpm/scripts/whatsapp-nativefier-notray" 
}
