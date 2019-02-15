# Maintainer: gkmcd <g @ dramati dot cc

pkgname="ftpgrab-bin"
_pkgname="ftpgrab"
pkgver="5.1.0"
pkgrel=1
pkgdesc="A CLI application written in Go to grab your files from a remote FTP or SFTP server."
arch=('x86_64')
url="https://ftpgrab.github.io"
license=('MIT')
provides=('ftpgrab')
conflicts=()
depends=()
source=("https://github.com/ftpgrab/ftpgrab/releases/download/${pkgver}/ftpgrab_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('e0be4d656f196d99722e96b2f74fb85ebf022b831a1faba2dc4c3a1209121970')

package() {
	install -Dm755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
	install -Dm644 README.md ${pkgdir}/usr/share/doc/${_pkgname}/readme.md
	install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md
}