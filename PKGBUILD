# Maintainer: David Monberg Nielsen <monbergnielsen@outlook.com>

pkgname=spasm
pkgver=0.3.1
pkgrel=1
pkgdesc="A terminal-based password manager aiming to be secure and easy to use."
arch=('any')
license=('MIT')
url="https://github.com/David-M-Nielsen/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
depends=('bash' 'coreutils')
optdepends=('xclip: getting password to clipboard automatically' 'gnupg: password encryption and decryption')
makedepends=('git')

sha512sums=('e041bd86797aca5e0b1089968be8f2b2cb4e5879f4ac8378aed765132c01faeee2f57f3a8bb35a10eb60e7998b7c35d22d2fb1b8c3a0fe89d08fed21f7c1bf4a')

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -D -m755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
