# Maintainer: Rodrigo Farias <rodrigofarias77@gmail.com>

pkgname=azure-cli-bin
pkgdesc='Azure Command-Line Interface (Debian package)'
pkgver=2.60.0
pkgrel=2
url='https://github.com/Azure/azure-cli'
arch=('x86_64')
license=('MIT')
depends=('python')
provides=('azure-cli')
conflicts=('azure-cli')
source=("https://packages.microsoft.com/repos/azure-cli/pool/main/a/azure-cli/azure-cli_${pkgver}-1~bookworm_amd64.deb")
md5sums=('947aa8a8e08b28b1ab7ab38ff305bdf4')

package () {
    cd "${pkgdir}"
    bsdtar -xf "${srcdir}/data.tar.xz"
    rm -r usr/share/doc
    find -name __pycache__ | xargs rm -r
}
