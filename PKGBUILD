# Maintainer: Rodrigo Farias <rodrigofarias77@gmail.com>

pkgname=azure-cli-bin
pkgver=2.53.1
pkgrel=2
pkgdesc='Azure Command-Line Interface (Debian package)'
arch=('x86_64')
url='https://github.com/Azure/azure-cli'
license=('MIT')
depends=('python')
conflicts=('azure-cli' 'python-azure-cli')
source=("https://packages.microsoft.com/repos/azure-cli/pool/main/a/azure-cli/azure-cli_${pkgver}-1~bookworm_amd64.deb")
md5sums=('4cb52d14a40557794e0c849baff49de5')

package () {
    cd "${pkgdir}"
    bsdtar -xf "${srcdir}/data.tar.xz"
    rm -r usr/share/doc
    find -name __pycache__ | xargs rm -r
}
