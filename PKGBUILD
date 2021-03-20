# Maintaoner: Yamada Hayao <development@fascode.net>

pkgname="pipewire-enable-bluez5"
pkgver="1.0"
pkgrel="1"
pkgdesc="Pacman hook to automatically enable Bluez5 support for Pipewire"
arch=('any')
license=('WTFPL')
source=("pipewire-enable-bluez5.hook")
md5sums=('SKIP')


package() {
    install -m 644 -D "${srcdir}/pipewire-enable-bluez5.hook" "${pkgdir}/usr/share/libalpm/hooks/pipewire-enable-bluez5.hook"
}
