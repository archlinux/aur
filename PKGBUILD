pkgname=android-environment
pkgver=7
pkgrel=2
pkgdesc='Script providing common environment variables and functions for Android builds.'
arch=('any')
url='https://aur.archlinux.org/packages/android-evironment'
license=('MIT')
source=('android-env.sh')
md5sums=('063c6af0caffdeb367b6da953d11a02c')

package() {
    install -d "${pkgdir}/usr/bin"
    install -m755 android-env.sh "${pkgdir}/usr/bin/android-env"
}
