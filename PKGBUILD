# Maintainer: Emanuel Serpa <emanuelvserpa@gmail.com>

pkgname=whatsapp-nativefier-wayland-hook
pkgver=1
pkgrel=1
pkgdesc="Pacman hook to change whatsapp-nativefier to start with ozone-platform-hint=auto after install or upgrade."
arch=("any")
install=whatsapp-nativefier-wayland-hook.install
license=("MIT")
depends=('whatsapp-nativefier')
source=(whatsapp-nativefier-wayland.hook whatsapp-nativefier-wayland)
sha1sums=('df131cf4b681594db57d928277994df8da81d167'
          '0ff6a011ec86caaf3d3951b0e05d0a1c342c0a3e')

package() {
    install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
    install -m644 "${srcdir}/whatsapp-nativefier-wayland.hook" "${pkgdir}/usr/share/libalpm/hooks/whatsapp-nativefier-wayland.hook"
    install -m755 -d "${pkgdir}/usr/share/libalpm/scripts"
    install -m755  "${srcdir}/whatsapp-nativefier-wayland" "${pkgdir}/usr/share/libalpm/scripts/whatsapp-nativefier-wayland" 
}
