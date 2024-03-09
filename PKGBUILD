pkgname=android-environment
pkgver=4
pkgrel=2
pkgdesc='Script providing common environment variables and functions for Android builds.'
arch=('any')
url='https://aur.archlinux.org/packages/android-evironment'
license=('MIT')
source=('android-env.sh')
md5sums=('SKIP')

package() {
    install -d ${pkgdir}/usr/bin
    install -m755 android-env.sh  ${pkgdir}/usr/bin/android-env
}
