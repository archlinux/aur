pkgname=systemd-efi-pacman-hook
pkgver=1
pkgrel=3
pkgdesc="Pacman hook to upgrade Linux EFI after systemd upgrade and Linux."
arch=("any")
license=("GPL")
depends=('systemd' 'linux')
source=(systemd-efi.hook)
md5sums=('010e8917566d765b93442ac1de91586a')

package() {
    install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
    install -m644 "${srcdir}/systemd-efi.hook" "${pkgdir}/usr/share/libalpm/hooks/systemd-efi.hook"
}
