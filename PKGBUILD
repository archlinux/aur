
# Contributor: Asuka Minato <youremail@domain.com>
# Contributor: Asuka Minato
pkgname=form-bin
pkgver=4.3.1
pkgrel=1
pkgdesc="The FORM project for symbolic manipulation of very big expressions"
arch=(x86_64)
url="https://www.nikhef.nl/~form/"
license=('GPL3')
provides=(form tform)
conflicts=(form-git)
source=("https://github.com/vermaseren/form/releases/download/v${pkgver}/form-${pkgver}-${CARCH}-linux.tar.gz"
        )
sha256sums=('7af2edb16a2bd1a929ee0ccfd9af7e27b8ab7be3ed0f7bf0f9be04dc792ecd17')

package() {
	cd form-${pkgver}-${CARCH}-linux
	install -Dm755 form tform -t "$pkgdir"/usr/bin
}
