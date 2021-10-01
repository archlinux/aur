pkgname='chad_launcher-bin'
_pkgname='chad_launcher'
pkgver=0.4.0
pkgrel=1
pkgdesc='GNU/LINUX GAMING UNLEASHED!'
arch=('x86_64')
url='https://gitlab.com/Gnurur/chad_launcher'
license=('GPL3')
depends=(webkit2gtk curl wget openssl appmenu-gtk-module gtk3 libappindicator-gtk3 libvips)
makedepends=()
source=("$pkgname-$pkgver.zip::https://gitlab.com/Gnurur/chad_launcher/-/jobs/artifacts/$pkgver/download?job=tauri:build")
md5sums=('28467e44a55547d370c0ae4dbe395a27')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "chad-launcher"
    install -Dm644 ../chad_launcher.desktop "$pkgdir/usr/share/applications/chad-launcher.desktop"
    install -Dm644 ../icon.svg "$pkgdir/usr/share/pixmaps/chad-launcher.svg"
}

