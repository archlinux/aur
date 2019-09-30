# Maintainer: Max Furman <mx.furman@gmail.com>
# Maintainer: Sebastian Tiedtke <sebastiantiedtke@gmail.com>
# Maintainer: Nazar Mishturak <nazarmx@gmail.com>
_binname=step-ca
pkgname=$_binname-bin
pkgver=0.13.3
pkgrel=1
pkgdesc="An online certificate authority and related tools for secure automated certificate management, so you can use TLS everywhere."
arch=('x86_64')
url="https://smallstep.com/certificates"
license=('Apache')

source=("https://github.com/smallstep/certificates/releases/download/v${pkgver}/step-certificates_${pkgver}_linux_amd64.tar.gz")
sha256sums=('0757e4c4c3f5301749929d6bf04ef9ed3110b1e79888820f3ca3ef565926b30c')

package() {
	install -Dm755 "step-certificates_$pkgver/bin/$_binname" "$pkgdir/usr/bin/$_binname"
	install -Dm644 "step-certificates_$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
