# Maintainer:  <obywatel3city at gmail dot com>
pkgname=chomik
pkgver=0.5.4.3
pkgrel=1
pkgdesc="Uploading files to chomikuj.pl"
arch=('any')
url="https://github.com/Grycek/ChomikUploader"
license=('GPL')
groups=(chomik, chomik_downloader)
depends=('python2>=2.6')
source=("http://przyczajony.zza.pl/owncloud/index.php/s/p5ZOwiTKCRNFPHp/download")
md5sums=('743232fe60046cd8e1a87c4c561feaed')

package() {
	cd "$pkgname-$pkgver"
	python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
