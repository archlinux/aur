# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="qualcoder-bin"
pkgver=3.1
pkgrel=1
pkgdesc="Qualitative data analysis application written in python3 and Qt6."
url="https://github.com/ccbogel/QualCoder"
license=("MIT")
arch=("x86_64")
provides=("qualcoder")
conflicts=("qualcoder")
depends=("python>=3.7" "vlc")
optdepends=("ffmpeg: speech to text and waveform image")
source=("qualcoder.png"
        "qualcoder.desktop"
        "$url/releases/download/$pkgver/QualCoder-$pkgver")
sha256sums=('f587124e59e9bc49741627a260862b5f26b9a899bad826008d4946ddb252539a'
            'e09cdab17e0f6b868c621bc9b580ce9de02371b188800ca9a794a1ed34412bc7'
            '017272ff145d46e9d0848c57feb05f3517ea9a6ba3411b87c75cef0dc2150360')

package(){
 install -D -m 755 "QualCoder-$pkgver" "$pkgdir/usr/bin/qualcoder"
 install -D -m 644 "qualcoder.png" "$pkgdir/usr/share/pixmaps/qualcoder.png"
 install -D -m 644 "qualcoder.desktop" "$pkgdir/usr/share/applications/qualcoder.desktop" 
}
