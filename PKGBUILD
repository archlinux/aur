pkgname=keymap-sandsmark
pkgver=1
pkgrel=1
pkgdesc="console keymap equivalent to 'us altgr-intl compose:rctrl ctrl:nocaps' in X11"
arch=(any)
url="https://github.com/sandsmark"
license=(GPL3)
source=("sandsmark.map")
md5sums=("SKIP") # handled by git

package() {
    install -D -m644 sandsmark.map -t "${pkgdir}/usr/share/kbd/keymaps/i386/qwerty/"
}
