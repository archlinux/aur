# Maintainer: Luiz Renato <ruizlenato@proton.me>

pkgname=crycord
pkgver=1.4.0
pkgrel=1
pkgdesc="A Discord Client modification with plugins. Uses BeautifulDiscord's CSS injector. Oh it's also written in Crystal!."
arch=('x86_64')
url='https://github.com/GeopJr/Crycord'
license=('BSD 2-Clause')

source=("$url/releases/download/v$pkgver/crycord-$pkgver-linux-${arch}-static.zip")
sha512sums=('3efbb2b70cacfba90200b83a220a06baebcbfb8441adb90362c0bdecec593bc68d23cb3d56517ad5790300b0375bb982328f38a17ca67dbea89de5672a3ae43b')

package() {
    install -Dv crycord -t "$pkgdir/usr/bin"
}
