# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Joris Steyn <jorissteyn@gmail.com>
pkgname=php-codesniffer-drupal
pkgver=8.x_2.3
pkgrel=2
pkgdesc='Drupal coding standard for PHP_CodeSniffer'
arch=('any')
url='http://drupal.org/project/coder'
license=('GPLv2')
depends=('php-codesniffer')
provides=('php-codesniffer-drupal')
source=('http://ftp.drupal.org/files/projects/coder-8.x-2.3.tar.gz')
md5sums=('a2fda7e9fdf55dc5ad36dd0d482973bd')

package() {
    install -d "$pkgdir"/usr/share/pear/PHP/CodeSniffer/Standards/Drupal
    cp -dr --no-preserve=ownership "$srcdir"/coder/coder_sniffer/Drupal/* "$pkgdir"/usr/share/pear/PHP/CodeSniffer/Standards/Drupal/
    install -d "$pkgdir"/usr/share/pear/PHP/CodeSniffer/Standards/DrupalPractice
    cp -dr --no-preserve=ownership "$srcdir"/coder/coder_sniffer/DrupalPractice/* "$pkgdir"/usr/share/pear/PHP/CodeSniffer/Standards/DrupalPractice/
}
