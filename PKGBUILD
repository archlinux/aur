pkgname=android-environment
pkgver=7
pkgrel=3
pkgdesc='Script providing common environment variables and functions for Android builds.'
arch=('any')
url='https://aur.archlinux.org/packages/android-evironment'
license=('MIT')
source=('android-env.sh')
md5sums=('2b3a4c39a6fbd9cc347d24858fc8b68d')

package() {
    install -d "${pkgdir}/usr/bin"
    install -m755 android-env.sh "${pkgdir}/usr/bin/android-env"
}
