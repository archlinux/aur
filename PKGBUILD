# Maintainer: Noeljunior <gmail {cat} com {dog} liamgliam>

pkgbase=plugin-autenticacao-gov
pkgname=('plugin-autenticacao-gov')
pkgver=2.0.46
pkgrel=1
pkgdesc="Portuguese Government pluggin for national ID card authentication"
arch=('any')
url="https://www.autenticacao.gov.pt/cc-software"
license=('MIT')
depends=('java-runtime' 'opensc')
source=("https://autenticacao.gov.pt/fa/ajuda/software/plugin-autenticacao-gov.jar"
        "pteid-mw-gui.desktop"
        "pteid-scalable.svg")
noextract=("plugin-autenticacao-gov.jar")
sha256sums=('d90380adebf58a3366098ed86ac5b85ddc419ea80ba7822fb1c193fad4e01cbb'
            'c83cc5081b99ceaf7f872e1f5329b3acde7774a4448bc9d4c82e2a07d0d84281'
            'a3c13286b536f007d2776d642a4d5461adf6e0d9be705f289475c7232353a130')

package() {
    install -Dm644 "plugin-autenticacao-gov.jar" "$pkgdir/opt/$pkgname/plugin-autenticacao-gov.jar"
    
    install -Dm644 "pteid-mw-gui.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    install -Dm644 "pteid-scalable.svg" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$pkgname.svg"
}


