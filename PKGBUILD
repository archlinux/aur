# Maintainer: Sid <sidpranjale127@protonmail.com>
# Continuing the work of:
# Maintainer: Jan Cholasta <jan at cholasta net>

pkgname=buildgdx
pkgver=1.18
pkgrel=1
pkgdesc="A port of the Build Engine games based on Java's libGDX"
arch=('i686' 'x86_64')
url='http://m210.duke4.net/index.php'
license=('GPL')
depends=('java-environment=8')
provides=('buildgdx')
conflicts=('buildgdx')
source=('https://m210.duke4.net/index.php/downloads/send/8-java/54-buildgdx.zip'
        'buildgdx.desktop'
        'buildgdx')
sha256sums=('8f9758b7a0a4392d91f25e7551a42c3027d78d71b06772d84a0a7c6bf118178b'
            '52e5c860572f0f1e38c6fb2d55221e9dfeaa4b49e89142166634c9934d35f4f5'
            'f74ba6eae81693f79434c3f8dec4bca75b51a55b67b5875d4e1dd2340ff55c5c')

package() {
    install -D -t "$pkgdir"/usr/bin buildgdx
    install -D -t "$pkgdir"/usr/share/$pkgname "$srcdir"/BuildGDX.jar
    install -D -t "$pkgdir"/usr/share/applications -m 644 "$srcdir"/buildgdx.desktop
}
