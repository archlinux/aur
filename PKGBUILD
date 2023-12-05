# Maintainer: jdigi78 <jdigiovanni78 at gmail dot com>

pkgname=rcedit-bin
pkgver=2.0.0
pkgrel=1
pkgdesc='Command line tool to edit resources of windows exe files'
arch=('any')
url='https://github.com/electron/rcedit/'
license=('MIT')
depends=('wine')

source=("https://github.com/electron/rcedit/releases/download/v$pkgver/rcedit-x64.exe"
        "https://raw.githubusercontent.com/electron/rcedit/b807b34a644c86c0b0d89c7f073967e79202731a/LICENSE"
        "rcedit")
        
sha256sums=('3e7801db1a5edbec91b49a24a094aad776cb4515488ea5a4ca2289c400eade2a'
            '224fcc506ef97afd088b487edab374abcad7e3d4de55fb8cce4f04328397213f'
            '4d42d20aafe098f9403db50ab804070c9710d57f07462eef98ee5a77976e2d17')

package() {
    install -Dm755 "rcedit-x64.exe" "$pkgdir/opt/rcedit/rcedit-x64.exe"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "rcedit" "$pkgdir/usr/bin/rcedit"
}
