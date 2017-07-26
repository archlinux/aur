pkgname='hastebin'
pkgver='0.1.0'
pkgrel=1
pkgdesc='Upload data to hastebin.com via stdin'
license=('GPL2')
url='https://github.com/kevr/sprunge'

arch=('any')
depends=('python' 'python-requests')
source=('hastebin')
sha256sums=(
	'63fe4333dffa1c5226efad77ffe754ea752363b050d9bae4376871ed626c63fc'
)

package()
{
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

