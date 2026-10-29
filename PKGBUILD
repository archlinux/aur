# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="qualcoder-bin"
pkgver=4.0
pkgrel=1
pkgdesc="Qualitative data analysis for text, images, audio and video written in python3 and Qt6"
url="https://qualcoder.wordpress.com/"
license=("MIT")
arch=("x86_64")
provides=("qualcoder")
conflicts=("qualcoder")
depends=("python>=3.7" "vlc")
optdepends=("ffmpeg: speech to text and waveform image")
source=("qualcoder.png"
        "qualcoder.desktop"
        "QualCoder-$pkgver::https://github.com/ccbogel/QualCoder/releases/download/$pkgver/QualCoder_${pkgver}_Linux")
b2sums=('8d60ab1d9c9ebebbd54a480ab5ffb3af8a795b97722c1bf3fb9e6d34ae11f749d9ed49f351e0f11f7c0f249ec0b80cbf48782cab629443b17a2443fef9dfd89a'
        'eff60218c9f7aa0675210df3d46c5f31cf345475a66a3c0ca46742442d301367a0448f3e54cdfb688fe32f3399c7830f9bb4753195d7f89e3df062f7dd2d0d6f'
        'd6514a2cf8c88310e0b17038b643af1cdc601b2c25d6929b316fd775746fa5d8edbc0eab660b1c143ffafdc89613e0e56ac7db3d5f74d27786c3fc25382785e7')

package(){
 install -D -m 755 "QualCoder-$pkgver" "$pkgdir/usr/bin/qualcoder"
 install -D -m 644 "qualcoder.png" "$pkgdir/usr/share/pixmaps/qualcoder.png"
 install -D -m 644 "qualcoder.desktop" "$pkgdir/usr/share/applications/qualcoder.desktop" 
}
