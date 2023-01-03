pkgname=mkinitcpio-pkcs11
pkgver=0.2
pkgrel=1
pkgdesc='Install pkcs11 in early boot (systemd cryptsetyp.target) using pcscd.socket'
depends=('ccid' 'opensc' 'pcsclite')
arch=('any')
source=('pkcs11_install')
sha256sums=('accd33d28e83f3db1344f25de85338eba0bbfda260761fa1c3733b6b70d48be9')

package() {
    install -D -m644 "pkcs11_install" "$pkgdir/usr/bin/initcpio/pkcs11"
}
