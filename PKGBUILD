# Maintainer: difri84 <difri84@gmail.com>

pkgname=whatsapp-nativefier-nospellchecker-hook
pkgver=1
pkgrel=1
pkgdesc="Pacman hook to disable whatsapp-nativefier spellcheck after install or upgrade."
arch=("any")
install=whatsapp-nativefier-nospellcheck-hook.install
license=("MIT")
depends=('whatsapp-nativefier')
source=(whatsapp-nativefier-nospellcheck.hook whatsapp-nativefier-nospellcheck)
sha1sums=("ff104376c17185bd85820c9010a293102d2b0720"
	"dfae59bebd372d4bffe12914a9fc683dbe26058c")

package() {
    install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
    install -m644 "${srcdir}/whatsapp-nativefier-nospellcheck.hook" "${pkgdir}/usr/share/libalpm/hooks/whatsapp-nativefier-nospellcheck.hook"
    install -m755 -d "${pkgdir}/usr/share/libalpm/scripts"
    install -m755  "${srcdir}/whatsapp-nativefier-nospellcheck" "${pkgdir}/usr/share/libalpm/scripts/whatsapp-nativefier-nospellcheck" 
}
