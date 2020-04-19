# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Joshua Li <josh@jrl.ninja>
# Please submit comments/issues here: https://github.com/JoshuaRLi/PKGBUILDs

pkgname=vape-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="A command-line tool that converts text into 'vaporwave' text - fullwidth UTF-8 characters."
arch=('x86_64')
url="https://github.com/JoshuaRLi/vape"
license=('MIT')
provides=('vape')
options=(!strip)
source=("${url}/releases/download/v${pkgver}/vape-x86_64-unknown-linux-gnu")
sha512sums=('7ca3d1c0eda41187fe4e92bb5b27b435e1f4af7187179211e91175582c1cb62bc9506f9a7026b323951c862f82dee97ae82a43f40986998e343d3a305901dd5f')

package () {
  install -Dm755 "$srcdir"/vape-x86_64-unknown-linux-gnu "${pkgdir}/usr/bin/vape"
}