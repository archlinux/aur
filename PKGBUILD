# Maintainer: jdigi78 <jdigiovanni78 at gmail dot com>

pkgname=rcedit-bin
pkgver=2.0.0
pkgrel=2

source=("https://github.com/electron/rcedit/releases/download/v$pkgver/rcedit-x64.exe"
        "https://raw.githubusercontent.com/electron/rcedit/b807b34a644c86c0b0d89c7f073967e79202731a/LICENSE"
        "rcedit")
        
sha256sums=('3e7801db1a5edbec91b49a24a094aad776cb4515488ea5a4ca2289c400eade2a'
            '224fcc506ef97afd088b487edab374abcad7e3d4de55fb8cce4f04328397213f'
            '51ff67860d12a15d52794cd2fd1d1d8bd751ad30cc111890e940f6dd4c7cb84b')

pkgdesc='Command line tool to edit resources of windows exe files'
arch=('any')
url='https://github.com/electron/rcedit/'
license=('MIT')
depends=('wine')
provides=('rcedit')
conflicts=('rcedit' 'rcedit-git')

package() {
    install -Dm755 "rcedit-x64.exe" "$pkgdir/opt/rcedit/rcedit-x64.exe"
    install -Dm755 "rcedit" "$pkgdir/usr/bin/rcedit"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
