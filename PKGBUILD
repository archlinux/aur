# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Scott Shumate <scott@shumatech.com>
pkgname=libsciter-gtk-bin
pkgver=4.4.8.23
pkgrel=1
pkgdesc="Embeddable HTML/CSS/JavaScript engine for modern UI development (Gtk library)"
arch=('x86_64')
url="https://sciter.com"
license=('custom')
depends=('gtk3')
provides=("${pkgname%-bin}" 'libsciter-gtk.so')
conflicts=("${pkgname%-bin}")
_commit=0298f1b34e9a0ff1dffb889d82c506a5da8bfb1e  # 4.4.8.23
source=("https://github.com/c-smile/sciter-sdk/raw/${_commit}/bin.lnx/x64/libsciter-gtk.so"
        "https://github.com/c-smile/sciter-sdk/raw/${_commit}/license.htm")
sha256sums=('a1682fbf55e004f1862d6ace31b5220121d20906bdbf308d0a9237b451e4db86'
            'a52733cc90fb112a730b67bbbe6fc1102fad644753af9bd584cab8ba0da3db49')

package() {
  install -Dm755 libsciter-gtk.so -t "$pkgdir/usr/lib/"
  install -Dm644 license.htm -t "$pkgdir/usr/share/licenses/$pkgname/"
}
