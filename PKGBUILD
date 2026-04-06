pkgname=auto_sober
pkgver=0.0.1
pkgrel=1
pkgdesc="A convenient launcher for Roblox on Linux"
arch=('any')
url='https://llaun.ch/'
license=('GPL3')

depends=('bash' 'flatpak' 'zenity')

source=("autosober"
        "autosober.desktop")

sha256sums=('SKIP'
            'SKIP')

package() {
   install -Dm755 "$srcdir/autosober" "$pkgdir/usr/bin/autosober"
   install -Dm644 "$srcdir/autosober.desktop" "$pkgdir/usr/share/applications/autosober.desktop"
}
