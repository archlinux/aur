# Maintainer: David Monberg Nielsen <monbergnielsen@outlook.com>

pkgname=spasm
pkgver=0.2.5
pkgrel=1
pkgdesc="A terminal-based password manager aiming to be easy to use and secure enough for most users."
arch=('any')
license=('MIT')
url="https://github.com/David-M-Nielsen/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
depends=('bash' 'coreutils')
optdepends=('xclip: getting password to clipboard automatically' 'gpg2: password encryption and decryption')
makedepends=('git')

sha256sums=('bf0dbf131236d1ca260f6830ae041b3fa95a2f1116a2b37ddb0518edae2b396b')

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -D -m755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
