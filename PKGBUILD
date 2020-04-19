# Maintainer: Max Furman <mx.furman@gmail.com>
# Maintainer: Sebastian Tiedtke <sebastiantiedtke@gmail.com>
# Maintainer: Nazar Mishturak <nazarmx@gmail.com>
_binname=step-ca
pkgname=$_binname-bin
pkgver=0.14.2
pkgrel=4
pkgdesc="An online certificate authority and related tools for secure automated certificate management, so you can use TLS everywhere."
arch=('x86_64')
url="https://smallstep.com/certificates"
license=('Apache')

source=("https://github.com/smallstep/certificates/releases/download/v${pkgver}/step-certificates_linux_${pkgver}_amd64.tar.gz")
sha256sums=('449ffec899ac774828b10a471b4a7bbd8c385078743ac6f31ed46321e26b4c86')

package() {
	install -Dm755 "step-certificates_$pkgver/bin/$_binname" "$pkgdir/usr/bin/$_binname"
	install -Dm644 "step-certificates_$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
