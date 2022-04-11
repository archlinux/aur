# Maintainer: Emanuel Serpa <emanuelvserpa@gmail.com>

pkgname=whatsapp-nativefier-notray-hook
pkgver=1
pkgrel=4
pkgdesc="Pacman hook to disable whatsapp-nativefier tray after install or upgrade."
arch=("any")
install=whatsapp-nativefier-notray-hook.install
license=("MIT")
depends=('whatsapp-nativefier')
source=(whatsapp-nativefier-notray.hook whatsapp-nativefier-notray)
sha1sums=('019bc488c1b5ebf402a9e0a6e47eaf9565f20411'
          '23237f192fab460129ceb3a0b27821be028d4f8a')

package() {
    install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
    install -m644 "${srcdir}/whatsapp-nativefier-notray.hook" "${pkgdir}/usr/share/libalpm/hooks/whatsapp-nativefier-notray.hook"
    install -m755 -d "${pkgdir}/usr/share/libalpm/scripts"
    install -m755  "${srcdir}/whatsapp-nativefier-notray" "${pkgdir}/usr/share/libalpm/scripts/whatsapp-nativefier-notray" 
}
