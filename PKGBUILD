pkgname='hastebin'
release='1.1'
pkgver="${release}.0"
pkgrel=1
pkgdesc='Upload data to hastebin.com via stdin'
license=('GPL2')
url='https://github.com/kevr/hastebin'

arch=('any')
depends=('python' 'python-requests')
conflicts=("${pkgname}-git")
optdepends=('xclip: default --clip-command')
source=("${url}/archive/${release}.tar.gz")
sha256sums=(
    '3224443261007c4a933bcda1a3cad5d050d3ea622a23d4043d3abfd714e66f45'
)

package()
{
    install -Dm755 "${srcdir}/${pkgname}-${release}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

