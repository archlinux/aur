pkgname=systemd-efi-pacman-hook
pkgver=1
pkgrel=6
pkgdesc="Pacman hook to upgrade Linux EFI after systemd upgrade and Linux."
arch=("any")
license=("GPL")
depends=('systemd' 'linux')
source=(systemd-efi.hook)
md5sums=('51d270ea53c1c85671c1b820ea56a399')

package() {
    install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
    install -m644 "${srcdir}/systemd-efi.hook" "${pkgdir}/usr/share/libalpm/hooks/systemd-efi.hook"
}
