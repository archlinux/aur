# Maintainer: gkmcd <g @ dramati dot cc>

pkgname="ftpgrab-bin"
_pkgname="ftpgrab"
pkgver="7.8.0"
pkgrel=1
pkgdesc="A CLI application written in Go to grab your files from a remote FTP or SFTP server."
arch=('x86_64')
url="https://ftpgrab.github.io"
license=('MIT')
provides=('ftpgrab')
conflicts=()
depends=()
source=("https://github.com/crazy-max/ftpgrab/releases/download/v7.8.0/ftpgrab_7.8.0_linux_amd64.tar.gz")
sha256sums=('25018f5558fc9ed9e58bb3ee9eeb4ef4d3df5458ea7ab3377da7f9832deee7c0')

package() {
	install -Dm755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
	install -Dm644 README.md ${pkgdir}/usr/share/doc/${_pkgname}/README.md
	install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md
}
