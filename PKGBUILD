# Maintainer: Rodolfo Panerai <rodolfo.panerai at gmail dot com>
pkgname=megasync-bin
pkgver=6.2.2
pkgrel=1
pkgdesc="Easy automated syncing between your computers and your MEGA cloud drive"
arch=('x86_64')
url="https://mega.nz/#sync"
license=('custom')
provides=("megasync=$pkgver")
conflicts=('megasync'
           'megatools')
depends=('glibc>=2.33'
         'gcc-libs>=10.2.0'
         'qt5-base>=5.15'
         'qt5-svg'
         'qt5-x11extras'
         'qt5-graphicaleffects'
         'qt5-declarative'
         'qt5-quickcontrols2'
         'qt5-quickcontrols')
optdepends=('xdg-desktop-portal: follow the desktop color scheme (using dbus)'
            'glib2: follow the desktop color scheme (using gsettings)')
source=("https://mega.nz/linux/repo/Arch_Extra/x86_64/megasync-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('5b05a2446dbf924abb019aef92ff3f8f4628441df543864c22ada9af2efeb72e')

package() {
    cp -R "${srcdir}/usr" "${pkgdir}/"
    cp -R "${srcdir}/opt" "${pkgdir}/"
    rm -rf "${pkgdir}/usr/share/icons/ubuntu-mono-dark"
}
