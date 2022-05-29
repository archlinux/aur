# Maintainer: Rodrigo Farias <rodrigofarias77@gmail.com>

pkgname=azure-cli-bin
pkgver=2.37.0
pkgrel=1
pkgdesc='Command-line tools for Azure (Debian package)'
arch=('any')
url='https://github.com/Azure/azure-cli'
license=('MIT')
depends=('python')
conflicts=('azure-cli' 'python-azure-cli')
source=("https://packages.microsoft.com/repos/azure-cli/pool/main/a/azure-cli/azure-cli_${pkgver}-1~bullseye_all.deb")
md5sums=('ac55d9a9462f445052bc7f365a81dfa0')

package () {
	cd "${pkgdir}"
	bsdtar -xf "${srcdir}/data.tar.xz"
	rm -r usr/share/doc
}
