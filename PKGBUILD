# Maintainer: Gobinath <slgobinath@gmail.com>
pkgname=gcalendar
pkgver=0.2
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
sha1sums=('2fe2c52a4ccd6a8101fdaec06825d7e83dedc3cb')

package() {
    cd "$srcdir/gcalendar-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
