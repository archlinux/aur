# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
pkgname=qizxopen
pkgver=4.1
pkgrel=2
pkgdesc="XML indexing and searching engine, fully supporting XQuery"
url="http://www.axyana.com/qizxopen/"
arch=('any')
license=('MPL')
depends=('java-runtime' 'apache-ant' 'bash')
#source=("http://www.axyana.com/${pkgname}/_download/${pkgname}-${pkgver}.zip")
source=("https://dl.dropboxusercontent.com/u/29095940/oss/qizxopen.tgz")
md5sums=('a48c749e441390f9d1d7ae37d6898c91')

package() {
	# As the tarfile does not contain any installer, the files
	# are copied manually
	cd $srcdir
	cp -Rp usr ${pkgdir}
}

