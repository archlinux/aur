# Maintainer: David Monberg Nielsen <monbergnielsen@outlook.com>

pkgname=spasm
pkgver=0.3.2
pkgrel=1
pkgdesc="A terminal-based password manager aiming to be secure and easy to use."
arch=('any')
license=('MIT')
url="https://github.com/David-M-Nielsen/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
depends=('bash' 'coreutils')
optdepends=('xclip: getting password to clipboard automatically' 'gnupg: password encryption and decryption')
makedepends=('git')

sha512sums=('49386b19d1badd115200263d0d619ae26a5d171d645df2d20ea6951b8d5fc832a62be8db0d7cd80f270e12ebb47caa5d779c93aaf617fd0dd231967a2563ae83')

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -D -m755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
