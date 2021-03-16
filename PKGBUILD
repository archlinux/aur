# Maintainer : Maxim Logaev <maximlogaev2001ezro@gmail.com>

pkgname=plank-theme-bigsur
pkgver=0.1
pkgrel=1
pkgdesc='BigSur, BigSur-Dark and BigSur-Grey theme for Plank'
url='https://www.gnome-look.org/p/1407624/'
arch=('any')
source=('BigSur.tar.gz')
license=('GPL3')
depends=('plank')
md5sums=('SKIP')

package() {
    mkdir -p "${pkgdir}"/usr/share/plank/themes
    cp -rf BigSur BigSur-Grey BigSur-Dark "$pkgdir"/usr/share/plank/themes
    chmod -R 755 "$pkgdir"/usr/share/plank/themes
}

