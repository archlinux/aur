# Maintainer: David Monberg Nielsen <monbergnielsen@outlook.com>

pkgname=spasm
pkgver=0.3.0
pkgrel=1
pkgdesc="A terminal-based password manager aiming to be secure and easy to use."
arch=('any')
license=('MIT')
url="https://github.com/David-M-Nielsen/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
depends=('bash' 'coreutils')
optdepends=('xclip: getting password to clipboard automatically' 'gnupg: password encryption and decryption')
makedepends=('git')

sha256sums=('51845114b55aa54171d7adbe024045bc888bb07d5825ff853b3bc1b0d4e0760d')

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -D -m755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
