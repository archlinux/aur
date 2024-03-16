pkgname=android-environment
pkgver=4
pkgrel=8
pkgdesc='Script providing common environment variables and functions for Android builds.'
arch=('any')
url='https://aur.archlinux.org/packages/android-evironment'
license=('MIT')
source=('android-env.sh')
md5sums=('83e3da80b1621316a13b92500c40f1ff')

package() {
    install -d ${pkgdir}/usr/bin
    install -m755 android-env.sh ${pkgdir}/usr/bin/android-env
}
