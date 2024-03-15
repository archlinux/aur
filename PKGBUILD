pkgname=android-environment
pkgver=4
pkgrel=4
pkgdesc='Script providing common environment variables and functions for Android builds.'
arch=('any')
url='https://aur.archlinux.org/packages/android-evironment'
license=('MIT')
source=('android-env.sh')
md5sums=('048697c7601e4cf639ce0781763b938a')

package() {
    install -d ${pkgdir}/usr/bin
    install -m755 android-env.sh ${pkgdir}/usr/bin/android-env
}
