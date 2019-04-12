# Maintainer: Nazar Mishturak <nazarmx@gmail.com> 
_binname=step-ca
pkgname=$_binname-bin
pkgver=0.9.2
pkgrel=1
pkgdesc="An online certificate authority and related tools for secure automated certificate management, so you can use TLS everywhere."
arch=('x86_64')
url="https://smallstep.com/certificates"
license=('Apache')

source=("https://github.com/smallstep/certificates/releases/download/v${pkgver}/step-certificates_${pkgver}_linux_amd64.tar.gz")
sha256sums=('9146f01e6ca1ffc929390d42b068108a100ddb54bf27295d0f7b49ac547e663b')

package() {
	install -Dm755 "step-certificates_$pkgver/bin/$_binname" "$pkgdir/usr/bin/$_binname"
	install -Dm644 "step-certificates_$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
