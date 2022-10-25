pkgname=mkinitcpio-pkcs11
pkgver=0.1
pkgrel=1
pkgdesc='Install pkcs11 in early boot (systemd cryptsetyp.target) using pcscd.socket'
depends=('ccid' 'opensc' 'pcsclite')
arch=('any')
source=('pkcs11_install')
sha256sums=('12ab776de8c225ca7fff411ab1a5a5998936d624aa95777a191f8b38de104d43')

package() {
    install -D -m644 "pkcs11_install" "$pkgdir/usr/bin/initcpio/pkcs11"
}
