pkgname=android-environment
pkgver=4
pkgrel=3
pkgdesc='Script providing common environment variables and functions for Android builds.'
arch=('any')
url='https://aur.archlinux.org/packages/android-evironment'
license=('MIT')
source=('android-env.sh')
md5sums=('7be36fb56e0433dcd6e7ba7758071c67')

package() {
    install -d ${pkgdir}/usr/bin
    install -m755 android-env.sh  ${pkgdir}/usr/bin/android-env
}
