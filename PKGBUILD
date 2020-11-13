# Maintainer: Marc Straube <email@marcstraube.de>
pkgname=apacheadm
pkgver=1.2
pkgrel=1
pkgdesc="Tool to enable and disable apache modules and virtual hosts"
arch=('any')
url="https://github.com/marcstraube/apacheadm"
license=('GPL3')
depends=('apache')
backup=('etc/httpd/conf/mods-available/alias.conf'
        'etc/httpd/conf/mods-available/cgid.conf'
        'etc/httpd/conf/mods-available/dir.conf'
        'etc/httpd/conf/mods-available/headers.conf'
        'etc/httpd/conf/mods-available/log_config.conf'
        'etc/httpd/conf/mods-available/mime.conf'
        'etc/httpd/conf/mods-available/mpm_event.conf'
        'etc/httpd/conf/mods-available/mpm_prefork.conf'
        'etc/httpd/conf/mods-available/mpm_worker.conf'
        'etc/httpd/conf/mods-available/php7.conf'
        'etc/httpd/conf/mods-available/proxy_html.conf'
        'etc/httpd/conf/mods-available/reqtimeout.conf'
        'etc/httpd/conf/mods-available/ssl.conf'
        'etc/httpd/conf/mods-available/unixd.conf')
source=("https://github.com/marcstraube/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('bcdfc3ba487f54bc5a08e66c6a6d3625ca587c704c14db5fe825bcaee583f48e766d9874cbf8a6a532c5acc6af3f13bc20d621ae88394446ef2fc8bfdc3df1d6')

package() {
    cd "$pkgname-$pkgver"
    ./install.sh -d "$pkgdir"
}

