# Maintainer: Galonza Peter
pkgname=mail.ru-screenshoter
pkgver=16.08.0035
pkgrel=1
arch=('i686' 'x86_64')
depends=('libidn11')
license=('Proprietary')
url="https://screenshoter.mail.ru"
pkgdesc="Screenshots are easy. Make and edit screenshots. Send images to friends or save them in the Cloud."
source_i686=(http://r.mail.ru/n235914370)
source_x86_64=(http://r.mail.ru/n235914352)
sha256sums_i686=('0d99a9d06414b7c2d15e86b859252fa9e3de5ef7a417c64fa078821303486f22')
sha256sums_x86_64=('eed49d64ccc0886f03ed910696f3ac23daa76be41ebd2d4cd23cc328a5efb564')

package() {
    cd "${pkgdir}"
    tar xf "${srcdir}/data.tar.xz"
}
