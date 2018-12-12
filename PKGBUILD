# Maintainer: Nazar Mishturak <nazarmx@gmail.com> 
_binname=step-ca
pkgname=$_binname-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="An online certificate authority and related tools for secure automated certificate management, so you can use TLS everywhere."
arch=('x86_64')
url="https://smallstep.com/certificates"
license=('Apache')

source=("https://github.com/smallstep/certificates/releases/download/v${pkgver}/step-certificates_${pkgver}_linux_amd64.tar.gz")
sha256sums=('38e51389ab91457f3417e702ad5ff4a8d5f176056396e49e5ae5ed88cc50a227')

package() {
	install -Dm755 "step-certificates_$pkgver/bin/$_binname" "$pkgdir/usr/bin/$_binname"
	install -Dm644 "step-certificates_$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
