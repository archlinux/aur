# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="qualcoder-bin"
pkgver=3.3
pkgrel=1
pkgdesc="Qualitative data analysis for text, images, audio and video written in python3 and Qt6"
url="https://github.com/ccbogel/QualCoder"
license=("MIT")
arch=("x86_64")
provides=("qualcoder")
conflicts=("qualcoder")
depends=("python>=3.7" "vlc")
optdepends=("ffmpeg: speech to text and waveform image")
source=("qualcoder.png"
        "qualcoder.desktop"
        "QualCoder-$pkgver::$url/releases/download/$pkgver/QualCoder-$pkgver-Ubuntu-22.04")
sha256sums=('f587124e59e9bc49741627a260862b5f26b9a899bad826008d4946ddb252539a'
            'e09cdab17e0f6b868c621bc9b580ce9de02371b188800ca9a794a1ed34412bc7'
            '16f0ae61b679f23db3432b73e56784e3c1c4d6c8e1087ed50131d166e2060384')

package(){
 install -D -m 755 "QualCoder-$pkgver" "$pkgdir/usr/bin/qualcoder"
 install -D -m 644 "qualcoder.png" "$pkgdir/usr/share/pixmaps/qualcoder.png"
 install -D -m 644 "qualcoder.desktop" "$pkgdir/usr/share/applications/qualcoder.desktop" 
}
