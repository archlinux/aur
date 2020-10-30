# Maintainer: Marc Straube <email@marcstraube.de>
pkgname=apacheadm
pkgver=1.0
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
md5sums=('0082ffab77840196d0b58e27896d06a8')

package() {
    cd "$pkgname-$pkgver"
    ./install.sh -d "$pkgdir"
}

