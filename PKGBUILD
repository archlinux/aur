pkgname=android-environment
pkgver=7
pkgrel=1
pkgdesc='Script providing common environment variables and functions for Android builds.'
arch=('any')
url='https://aur.archlinux.org/packages/android-evironment'
license=('MIT')
source=('android-env.sh')
md5sums=('5d1764a51cea6480215a09f908e5c5c8')

package() {
    install -d "${pkgdir}/usr/bin"
    install -m755 android-env.sh "${pkgdir}/usr/bin/android-env"
}
