pkgname='hastebin'
release='1.4'
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
sha256sums=(
    'a8b5d5164e11cc485e973c8f1d090553e78ff1dfcfe3f3664aa8cea37bef6bd8'
)

package()
{
    install -Dm755 "${srcdir}/${pkgname}-${release}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

