pkgname=android-environment
pkgver=4
pkgrel=9
pkgdesc='Script providing common environment variables and functions for Android builds.'
arch=('any')
url='https://aur.archlinux.org/packages/android-evironment'
license=('MIT')
source=('android-env.sh')
md5sums=('290dea4706996384b9e83e7a55115aad')

package() {
    install -d ${pkgdir}/usr/bin
    install -m755 android-env.sh ${pkgdir}/usr/bin/android-env
}
