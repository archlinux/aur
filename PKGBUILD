# Maintainer: James An <james@jamesan.ca>

pkgname='aegir-provision-tasks-extra'
pkgver='6.x_2.1'
pkgrel=1
pkgdesc="Extends Aegir provision backend with additional commands"
arch=('any')
url='https://www.drupal.org/project/provision_tasks_extra'
license=('GPL')
depends=('aegir-provision')
source=('http://ftp.drupal.org/files/projects/provision_tasks_extra-6.x-2.1.tar.gz')
md5sums=('d206a628af4891063b434ac792c813ec')

package() {
    install -dm755 "$pkgdir/usr/share/webapps/drush/commands"
    cp -R "${srcdir}/provision_tasks_extra" "$pkgdir/usr/share/webapps/drush/commands"
}
