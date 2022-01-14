pkgname=mpv-mpris-bin
pkgver=0.6
pkgrel=1
pkgdesc='MPRIS (Media Player Remote Interface Spec) plugin for mpv (prebuilt)'
arch=('x86_64')
url='https://github.com/hoyon/mpv-mpris'
license=('MIT')
depends=('mpv' 'glib2')
conflicts=('mpv-mpris')
provides=("mpv-mpris=$pkgver")
source=("https://github.com/hoyon/mpv-mpris/releases/download/$pkgver/mpris.so")
sha256sums=('3a05a402d904f5bbcfb0a3d0a39996ea03fcbdab3bc869dbc5472e7a3882c832')
package() (install -Dm0644 mpris.so "${pkgdir}/etc/mpv/scripts/mpris.so")
