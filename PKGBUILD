# Maintainer: Tyler Swagar <buttpickle69@shaw.ca>

pkgname=ttf-merriweather
pkgver=1.583
pkgrel=1
pkgdesc='A typeface that is pleasant to read on screens by Sorkin Type Co'
arch=('any')
url='https://fonts.google.com/specimen/Merriweather'
license=('custom:SIL Open Font License v1.1')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
conflicts=('ttf-google-fonts-git' 'ttf-google-fonts-opinionated-git')
install="${pkgname}.install"
source=('https://github.com/google/fonts/raw/master/ofl/merriweather/Merriweather-Black.ttf'
        'https://github.com/google/fonts/raw/master/ofl/merriweather/Merriweather-BlackItalic.ttf'
        'https://github.com/google/fonts/raw/master/ofl/merriweather/Merriweather-Bold.ttf'
        'https://github.com/google/fonts/raw/master/ofl/merriweather/Merriweather-BoldItalic.ttf'
        'https://github.com/google/fonts/raw/master/ofl/merriweather/Merriweather-Italic.ttf'
        'https://github.com/google/fonts/raw/master/ofl/merriweather/Merriweather-Light.ttf'
        'https://github.com/google/fonts/raw/master/ofl/merriweather/Merriweather-LightItalic.ttf'
        'https://github.com/google/fonts/raw/master/ofl/merriweather/Merriweather-Regular.ttf'
        'https://github.com/google/fonts/raw/master/ofl/merriweather/OFL.txt')
sha256sums=('af3e0584567c1c4c65132740df5d4b276d906b74ebe77ec38c0d9bd1db2c10be'
            'c6dc539774b2f075ac60cc78aef8c4b62e4ad27ff615ef9cb8c6f726c915f9e8'
            'ff767f15660790c17208f8c0aeb1a627dc5aca48bc2438faa503f67dc6cf080d'
            '51d56708b246d188c8468e1a792cf2eadecc844f1f2f1a79856d70c70f785b1f'
            '8817efa38565cb6b7625cc35fc9d2ec2da5a5a57e35e616d5af65be8e99339a9'
            'c2edab6e8962dd88fd4f39d598f77066d9d0c8f213bbc7f4e2abb524b028ed31'
            'e7b49e08cf8ab822490ed067d40a9e06691b94877d56d5ced8384fb5f5571a5b'
            '4e3867110091c1220b4d370c8ecef935724b59292a4a54a8b63d9d911e01f560'
            'cc9992063cd0f818e6d754453c43b34907055422b06858b2c7bc82d690a0bccf')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -Dm644 *.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
