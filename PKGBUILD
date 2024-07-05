pkgname=android-environment
pkgver=5
pkgrel=3
pkgdesc='Script providing common environment variables and functions for Android builds.'
arch=('any')
url='https://aur.archlinux.org/packages/android-evironment'
license=('MIT')
source=('android-env.sh')
md5sums=('b924c00e96afa9f10cc52829689810d9')

package() {
    install -d "${pkgdir}/usr/bin"
    install -m755 android-env.sh "${pkgdir}/usr/bin/android-env"
}
