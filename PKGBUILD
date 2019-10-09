pkgname=systemd-efi-pacman-hook
pkgver=1
pkgrel=4
pkgdesc="Pacman hook to upgrade Linux EFI after systemd upgrade and Linux."
arch=("any")
license=("GPL")
depends=('systemd' 'linux')
source=(systemd-efi.hook)
md5sums=('d69d905b8bbb72566a1b02c876460c7c')

package() {
    install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
    install -m644 "${srcdir}/systemd-efi.hook" "${pkgdir}/usr/share/libalpm/hooks/systemd-efi.hook"
}
