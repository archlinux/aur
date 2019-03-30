# Maintainer: gkmcd <g @ dramati dot cc>

pkgname="ftpgrab-bin"
_pkgname="ftpgrab"
pkgver="5.2.0"
pkgrel=1
pkgdesc="A CLI application written in Go to grab your files from a remote FTP or SFTP server."
arch=('x86_64')
url="https://ftpgrab.github.io"
license=('MIT')
provides=('ftpgrab')
conflicts=()
depends=()
source=("https://github.com/ftpgrab/ftpgrab/releases/download/${pkgver}/ftpgrab_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('59d40fcb73c8fd959b9e4b82609a4092592eff50609d48aabb764ac755b4ceff')

package() {
	install -Dm755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
	install -Dm644 README.md ${pkgdir}/usr/share/doc/${_pkgname}/README.md
	install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md
}
