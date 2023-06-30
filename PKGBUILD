pkgname='hastebin'
release='1.5'
pkgver="${release}.0"
pkgrel=1
pkgdesc='Upload data to hastebin.com via stdin'
license=('GPL2')
url='https://github.com/kevr/hastebin'
arch=('any')
depends=('python' 'python-requests')
conflicts=("${pkgname}-git")
optdepends=('xclip: default --clip-command')
source=("${url}/archive/refs/tags/${release}.tar.gz")
install='hastebin.install'
sha256sums=(
    'c85bb82389887758b6b8329805a368269247135a8a2e47067a0d9b40e4d08475'
)

package()
{
    install -Dm755 "${srcdir}/${pkgname}-${release}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
