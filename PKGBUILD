# Maintainer: Ondřej Hošek <ondra.hosek@gmail.com>

pkgname=otf-urw-classico
pkgver=2025.01.11
pkgrel=1
pkgdesc="Hermann Zapf's rework of Optima under the auspices of URW"
url='https://ctan.org/pkg/classico'
arch=('any')
source=('https://mirrors.ctan.org/fonts/urw/classico/opentype/URWClassico-Bold.otf'
        'https://mirrors.ctan.org/fonts/urw/classico/opentype/URWClassico-BoldItalic.otf'
        'https://mirrors.ctan.org/fonts/urw/classico/opentype/URWClassico-Italic.otf'
	'https://mirrors.ctan.org/fonts/urw/classico/opentype/URWClassico-Regular.otf')
b2sums=('b76be58df079719d82a92299ef63cb4e33f8b2c46e8009f32a7a38246bef7a4685dd58a21457ee04a9a8ecdcf08b2930a019a4255aa0b9534d7fa8178b5496e1'
        '5e1554963dabd9b92a57b37865666e5db487bb50231a0890a8aae0d39b097eef243ccf0886ac5b378b01ad248a39b076f59342930ec2155a1c65cdf1c544af86'
        '22cdde9d9a6c0ff1f7c6e2d682412c40bf7b1a8f5bff0523d3f7f34cadd105fa0883e913bc503ba386868d0c4fddfd3da0c052f9fff387ba5c407e4e1beb1c88'
        'd0d81cd0911c6355cff9b61393cf9246de7446075b532e7b8110e1f257856bed312fca89d1ef7bfd78350ab272240e785225ca4ecd5d187badcce921626e216e')

package() {
  install -Dm644 "${srcdir}/URWClassico-"*".otf" -t "${pkgdir}/usr/share/fonts/OTF"
}
