# Maintainer: Hugo Osvaldo Barrera <hugo@whynothugo.nl>

pkgname=systemd-preset-pacman-hook
pkgver=1
pkgrel=1
pkgdesc="Apply pacman resets after any systemd service upgrade"
arch=("any")
license=("GPL")
depends=('systemd')
source=("systemd-presets.hook")
md5sums=('ad33e5dff5c12321c18fc20c3ec15b66')

package() {
    install -Dm644 "${srcdir}/systemd-presets.hook" \
      "${pkgdir}/usr/share/libalpm/hooks/70-systemd-presets.hook"
}

