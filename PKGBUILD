# Mantainer: Juma7C9 <juri at dividebyzero dot it>

# Original package contributors:
# Contributor: Doug Newgard <scimmia at archlinux dot org>
# Contributor: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: SaultDon <sault.don gmail>
# Contributor: Lantald < lantald at gmx.com >
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: Eric Forgeot < http://esclinux.tk >

# Releases:
# - 3.0.0_1_99unstable-1 (2018-03-18): First release, from packages for Debian Sid

_pkgname=qgis
pkgname=${_pkgname}-bin
_pkgver=3.0.0
# Increment this value when switching to some other release (e.g. from Unstable to Stretch)
_dist_epoch=1
_dist="99unstable"
pkgver=${_pkgver}_${_dist_epoch}_${_dist}
pkgrel=1
pkgdesc='Geographic Information System (GIS), from upstream prebuilt Debian/Ubuntu packages'
url='https://qgis.org/'
license=('GPL')
arch=('x86_64')
options=(!strip)
provides=("qgis")
conflicts=("qgis")
depends=('expat' 'gcc-libs' 'gdal' 'geos' 'glibc' 'libspatialite' 'libzip' 'postgresql-libs' 'proj'
         'qca-qt5' 'qextserialport' 'qscintilla-qt5' 'qt5-3d' 'qt5-base' 'qt5-location' 'qt5-tools' 'qt5-svg'
         'qt5-webkit' 'qtkeychain' 'qwt' 'qwtpolar' 'spatialindex' 'sqlite' 'python' 'python-gdal'
         'python-matplotlib' 'python-owslib' 'python-qscintilla-qt5' 'python-psycopg2' 'python-pyqt5' 'python-sip')
optdepends=('gpsbabel: GPS Tool plugin'
            'gsl: Georeferencer plugin'
            'python-jinja: MetaSearch plugin'
            'python-owslib: MetaSearch plugin'
            'python-psycopg2: DB Manager plugin; Processing plugin'
            'python-pygments: MetaSearch plugin; DB Manager plugin'
            'python-yaml: Processing plugin')
source=(
	"https://qgis.org/debian/pool/main/q/${_pkgname}/${_pkgname}_${_pkgver}+${_dist}_amd64.deb"
	"https://qgis.org/debian/pool/main/q/${_pkgname}/${_pkgname}-common_${_pkgver}+${_dist}_all.deb"
	"https://qgis.org/debian/pool/main/q/${_pkgname}/lib${_pkgname}-core${_pkgver}_${_pkgver}+${_dist}_amd64.deb"
	"https://qgis.org/debian/pool/main/q/${_pkgname}/lib${_pkgname}-app${_pkgver}_${_pkgver}+${_dist}_amd64.deb"
	"https://qgis.org/debian/pool/main/q/${_pkgname}/lib${_pkgname}-3d${_pkgver}_${_pkgver}+${_dist}_amd64.deb"
	"https://qgis.org/debian/pool/main/q/${_pkgname}/lib${_pkgname}-analysis${_pkgver}_${_pkgver}+${_dist}_amd64.deb"
	"https://qgis.org/debian/pool/main/q/${_pkgname}/lib${_pkgname}-gui${_pkgver}_${_pkgver}+${_dist}_amd64.deb"
	"https://qgis.org/debian/pool/main/q/${_pkgname}/lib${_pkgname}-native${_pkgver}_${_pkgver}+${_dist}_amd64.deb"
	"https://qgis.org/debian/pool/main/q/${_pkgname}/lib${_pkgname}python${_pkgver}_${_pkgver}+${_dist}_amd64.deb"
	"https://qgis.org/debian/pool/main/q/${_pkgname}/python-${_pkgname}_${_pkgver}+${_dist}_amd64.deb"
	"https://qgis.org/debian/pool/main/q/${_pkgname}/python-${_pkgname}-common_${_pkgver}+${_dist}_all.deb"
	"https://qgis.org/debian/pool/main/q/${_pkgname}/lib${_pkgname}-customwidgets_${_pkgver}+${_dist}_amd64.deb"
	"https://qgis.org/debian/pool/main/q/${_pkgname}/${_pkgname}-providers_${_pkgver}+${_dist}_amd64.deb"
	"https://qgis.org/debian/pool/main/q/${_pkgname}/${_pkgname}-providers-common_${_pkgver}+${_dist}_all.deb"
	)

noextract=(
	"${_pkgname}_${_pkgver}+${_dist}_amd64.deb"
	"${_pkgname}-common_${_pkgver}+${_dist}_all.deb"
	"lib${_pkgname}-core${_pkgver}_${_pkgver}+${_dist}_amd64.deb"
	"lib${_pkgname}-app${_pkgver}_${_pkgver}+${_dist}_amd64.deb"
	"lib${_pkgname}-3d${_pkgver}_${_pkgver}+${_dist}_amd64.deb"
	"lib${_pkgname}-analysis${_pkgver}_${_pkgver}+${_dist}_amd64.deb"
	"lib${_pkgname}-gui${_pkgver}_${_pkgver}+${_dist}_amd64.deb"
	"lib${_pkgname}-native${_pkgver}_${_pkgver}+${_dist}_amd64.deb"
	"lib${_pkgname}python${_pkgver}_${_pkgver}+${_dist}_amd64.deb"
	"python-${_pkgname}_${_pkgver}+${_dist}_amd64.deb"
	"python-${_pkgname}-common_${_pkgver}+${_dist}_all.deb"
	"lib${_pkgname}-customwidgets_${_pkgver}+${_dist}_amd64.deb"
	"${_pkgname}-providers_${_pkgver}+${_dist}_amd64.deb"
	"${_pkgname}-providers-common_${_pkgver}+${_dist}_all.deb"
	)

sha256sums=('27190f7097db0a87c0e07eca51e915f2a0fdfd9314f1ba2574d28cd72e23108f'
            '58d2b52e8d18ace98c76af24c38000f5b39c84fb5e34ec6e539845fced94d316'
            '6a1b638c2febf71daa53303e1aaf2346d3e428073bcc7b781402523c513dfa1f'
            'b7f7b181953ee8eda1b4ed19610fd6251ad9329b6ffd3c56ef37192161d9c4e1'
            'fc30593147228c28426bdfdde378b95f36a88a18e917bb65cbea6a12666e4696'
            'da7e8944e0a1d2dd9b5efa00b2de2ce73c735f0ad72a217bb8fc8d86065026e6'
            '175a1ca857151a1c8c7f4b82580d34b20ebbd9d1aeca400d5e96aa85cb84e58d'
            '324178f3ec24d583835918b765254bca3a1694b745080f320ffd20385e96d148'
            '81b05f7c79468002c90ab848ce4579a85a9ba44b1c1a618dbe34d49b2ede5c01'
            'ddfb7b009f28c83fdf2bc9d6a74152bd6171ec43dfacc336b312a169e55008db'
            '393628bbefe227184ca22b8f58230ab9442ac84f938becb09a67370bb73fa2ad'
            '22fc8d3ef5493becdf752e60cb4b789f6f83756526ac425eb7247c284a8e4ca1'
            'ea754675eac264a10a65edb617c343e3ac6d9c30ac169e25560269a849b5685c'
            'f5330754cdcfe7fae7abf28c5d03b40734320e8e3188c06083fb88283cf257e3')

prepare() {
	for package in *.deb; do
	   mkdir ${srcdir}/${package%.deb};
	   cd ${srcdir}/${package%.deb} && ar x ${srcdir}/${package};
	done
}

package() {
	for data in ${srcdir}/*/data.tar.xz; do
		tar -xaf $data -C $pkgdir;
	done

	# Rename Python directory
	mkdir ${pkgdir}/usr/lib/python3.6
	mv ${pkgdir}/usr/lib/python3/dist-packages ${pkgdir}/usr/lib/python3.6/site-packages
	rm -r ${pkgdir}/usr/lib/python3

	# Symlink system libraries shipped under another name
	ln -s /usr/lib/libqwt.so.6 ${pkgdir}/usr/lib/libqwt-qt5.so.6
	ln -s /usr/lib/libzip.so.5 ${pkgdir}/usr/lib/libzip.so.4
}
