# Maintainer: aatdark <aatdark at vishap dot at>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab


pkgname=symfony2
pkgver=2.8.4
pkgrel=1
pkgdesc="A web-application framework for PHP projects"
arch=('any')
url="http://symfony.com"
license=('MIT')
depends=(php)
source=(
$pkgname::http://symfony.com/installer 
$pkgname.bash::https://raw.github.com/wyrfel/Symfony-Bash-Completion-Script/master/etc/bash_completion.d/symfony
)

install=$pkgname.install
options=(!emptydirs !strip)

package() {
    cd "$srcdir"/


    install -Dm755 symfony2 "$pkgdir"/usr/share/webapps/symfony
}
md5sums=('45c408c12b4740610f1e7fd5e462943e'
         '2772cb1b65cc83a90e25122dbc526078')
