pkgname=systemd-efi-pacman-hook
pkgver=1
pkgrel=5
pkgdesc="Pacman hook to upgrade Linux EFI after systemd upgrade and Linux."
arch=("any")
license=("GPL")
depends=('systemd' 'linux')
source=(systemd-efi.hook)
md5sums=('cb5d743346429b77827045bc9011e268')

package() {
    install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
    install -m644 "${srcdir}/systemd-efi.hook" "${pkgdir}/usr/share/libalpm/hooks/systemd-efi.hook"
}
