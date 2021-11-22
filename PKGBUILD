# Maintainer: -=De/\/=-
# Author: Ezequiel
# Contributor: Ezequiel
pkgname=cadzinho
pkgver=0.1.0
pkgrel=6
pkgdesc="Minimalist computer aided design (CAD) software"
arch=('x86_64')
url='https://github.com/zecruel/CadZinho'
license=('MIT')

depends=('sdl2' 'lua')

source=('https://github.com/zecruel/CadZinho/releases/download/${pkgver}-alpha/cadzinho_linux.zip'
        'cadzinho.png'
        'cadzinho'
        'cadzinho.desktop')

package() {
    cd ${srcdir}
    install -D -m644 cadzinho.png ${pkgdir}/opt/cadzinho/cadzinho.png
    install -D -m755 cadzinho ${pkgdir}/usr/local/bin/cadzinho
    install -D -m644 cadzinho.desktop ${pkgdir}/usr/share/applications/cadzinho.desktop
    
    cp -r ${srcdir}/cadzinho_linux/* ${pkgdir}/opt/cadzinho
}

sha256sums=('e3ec740a76a3404a83d1dd51de539fdfd2589318cf998eaa28391e8dd706b1fa'
            '103e5df8fac52c36a5245cb0fbb6208881fc4d9cf7a4faaced74a6c5f62b4e2d'
            '33d113b98dc90d4b2e4a1a90f0636e28fd8dd9d15f8728a771c3bc4f5e7cdde3'
            '0695e2a658bf98d8f0007a7d2ac206c2e0cbc0f5aeb9cdc41096f1b6104423f3')
