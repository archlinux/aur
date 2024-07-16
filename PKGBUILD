pkgname=android-environment
pkgver=6
pkgrel=1
pkgdesc='Script providing common environment variables and functions for Android builds.'
arch=('any')
url='https://aur.archlinux.org/packages/android-evironment'
license=('MIT')
source=('android-env.sh')
md5sums=('05b491ea3e38a0d679f5570bdaa577b7')

package() {
    install -d "${pkgdir}/usr/bin"
    install -m755 android-env.sh "${pkgdir}/usr/bin/android-env"
}
