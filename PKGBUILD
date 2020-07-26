# Maintainer: Gobinath <slgobinath@gmail.com>
pkgname=gcalendar
pkgver=0.4
pkgrel=1
pkgdesc="A Free and Open Source tool to read your Google Calendar events in JSON format."
arch=("any")
url="https://github.com/slgobinath/gcalendar"
license=("GPL3")
depends=("python"
         "python-dateutil"
         "python-google-api-python-client"
         "python-oauth2client")
makedepends=("python-setuptools" "python-pip")
source=(gcalendar-$pkgver.tar.gz::"https://github.com/slgobinath/gcalendar/archive/v$pkgver.tar.gz")
sha1sums=('6d8edfedc7b31f75adc3a7e343dbd1534491f1b3')

package() {
    cd "$srcdir/gcalendar-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
