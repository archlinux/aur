# Maintainer: Rph <rphsoftware@gmail.com>
pkgname='shaka-packager-bin'
pkgrel=1
pkgver='2.5.1'
arch=('x86_64')
pkgdesc='Shaka Packager is a tool and a media packaging SDK for DASH and HLS packaging and encryption. It can prepare and package media content for online streaming.'
license=('BSD')
source=(
    "https://github.com/google/shaka-packager/releases/download/v2.5.1/packager-linux"
    "https://raw.githubusercontent.com/google/shaka-packager/cfbe5c08c2285bd22f1ba900629e9a6fcac4dde4/LICENSE"
)
sha256sums=('e7ea0fc7ec6523e2df63a38eeb2c6cb1dc06fcc91a0dbd2e02e6b7d5655080f2'
            '16f1483c4e6e0f851f2606587a222cf8fe6215837ce309a1ad0e3f21580b99f7')
url='https://github.com/google/shaka-packager'
package() {
    mkdir -p "$pkgdir"/usr/bin
    mkdir -p "$pkgdir"/usr/share/licenses/shaka-packager-bin
    cp -a packager-linux "$pkgdir"/usr/bin/shaka-packager
    cp -a LICENSE "$pkgdir"/usr/share/licenses/shaka-packager-bin

    chmod +x "$pkgdir"/usr/bin/shaka-packager
}