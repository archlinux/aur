# Maintainer: Turab Garip <turabgarip@gmail.com>
pkgname=eimza
pkgver=1.0
pkgrel=1
pkgdesc="Dependency installation for Turkish smartcard providers (etugra, tubitak etc.)"
arch=('x86_64')
url="https://github.com/Turab/eimza"
license=('custom')
depends=('akia' 'java-runtime' 'acsccid' 'ccid' 'pcsc-tools' 'opensc' 'sac-core' 'pkcs11-helper' 'safesignidentityclient')

package() {
    install -d "${pkgdir}/usr/lib"
    ln -s /usr/lib/libaetpkss.so "${pkgdir}/usr/lib/libaetpkss1.so"
}
