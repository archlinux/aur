# Maintainer: gkmcd <g @ dramati dot cc>

pkgname="ftpgrab-bin"
_pkgname="ftpgrab"
pkgver="7.7.0"
pkgrel=1
pkgdesc="A CLI application written in Go to grab your files from a remote FTP or SFTP server."
arch=('x86_64')
url="https://ftpgrab.github.io"
license=('MIT')
provides=('ftpgrab')
conflicts=()
depends=()
source=("https://github.com/crazy-max/ftpgrab/releases/download/v7.7.0/ftpgrab_7.7.0_linux_amd64.tar.gz")
sha256sums=('38ebc18d08bed49f10698e68645b5d61b943f67c1b6e1bac6de6616c0a2e883f')

package() {
	install -Dm755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
	install -Dm644 README.md ${pkgdir}/usr/share/doc/${_pkgname}/README.md
	install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md
}
