# Maintainer:  <obywatel3city at gmail dot com>
pkgname=chomik_downloader
pkgver=0.1.13
pkgrel=1
pkgdesc="Downloading files from yaour account at chomikuj.pl"
arch=('any')
url="https://github.com/Grycek/ChomikDownloader"
license=('GPL')
groups=(chomik, chomik_downloader)
depends=('python2>=2.6')
source=("http://przyczajony.zza.pl/owncloud/index.php/s/5gwLxuqQGBjbHLy/download")
md5sums=('aa72c500e8247d6e4619cd67556a87fa')

package() {
	cd "$pkgname-$pkgver"
	python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
