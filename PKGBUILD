# Maintainer: Michal Sotolar <michal at sotolar dot com>

pkgname=ttf-qr-font
pkgver=1.0.0
pkgrel=2

pkgdesc="Jim's TrueType QR Code Font"
arch=('any')
url='https://qr.jim.sh/'
license=('custom:SIL Open Font License')

source=("https://github.com/jimparis/qr-font/releases/download/v$pkgver/qrfont-1L.ttf"
        "https://github.com/jimparis/qr-font/releases/download/v$pkgver/qrfont-2L.ttf"
        "https://github.com/jimparis/qr-font/releases/download/v$pkgver/qrfont-3L.ttf"
        "https://raw.githubusercontent.com/jimparis/qr-font/refs/tags/v$pkgver/LICENSE-OFL.txt")

package() {
  install -Dm644 qrfont-{1,2,3}L.ttf -t "$pkgdir/usr/share/fonts/qr-font"
  install -Dm644 LICENSE-OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}

b2sums=('4bd61a2cfab810102727459d363457fdef1514ff2e76a960190625ed13c7533ea43fd1b726efeb110d99a4941aea8fa6fcfdf45f9295c6f2ea202c170ba116fb'
        '7ea193202ecd965280202838ddafb725c1ee47f710da44ad9445e15e9514098cd7dba58e6aa77b6d9bb68fccca6da2fdf664ac09714759f4562dcbc5add2b210'
        '5a7d4b2f539b2a7ab0adb2973bff809edf5d252568ee287e6f2ac01f09af7d45e81a79b39007705ab585d21a4fb65e68725ee7e979a4b646d155514929d603fa'
        '4f939219c138f10b1e82bbcd74c922f48205d37cf67c9ba80d64024e41b525eb02c42ee11cd730cb03ec472624080583d678876326114bc5f135e6999e6cd946')
