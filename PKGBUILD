pkgname=umanag
pkgver=0.1.0
pkgrel=1
pkgdesc="A basic User Management tool for Unix using Zenity"
arch=('any')
url="https://github.com/example/umanag" # Replace with actual URL if available
license=('MIT')
depends=('bash' 'zenity' 'polkit')
source=("u_manag.sh"
        "umanag.desktop")
sha256sums=('SKIP'
            'SKIP')

package() {
    # Install the script
    install -Dm755 "${srcdir}/u_manag.sh" "${pkgdir}/usr/bin/umanag"

    # Install the desktop entry
    install -Dm644 "${srcdir}/umanag.desktop" "${pkgdir}/usr/share/applications/umanag.desktop"
}
