# Maintainer: Marc Straube <email@marcstraube.de>
pkgname=apacheadm
pkgver=1.1
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
sha512sums=('fc7e9382acd3e60f7815f81f236099a841d0f781dc448492f010233bae611ed8e781e60622c9b19f9e6c7cbf6c9ff74048fe9a15e84f7b30f533fedce12c9a50')

package() {
    cd "$pkgname-$pkgver"
    ./install.sh -d "$pkgdir"
}

