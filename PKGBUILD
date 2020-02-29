# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-br3
epoch=1
pkgver=15.6fa9693
pkgrel=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A Brazilian Portuguese male voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/1.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/2.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/3.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/4.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/5.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/6.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/7.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/8.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/9.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/10.pho")
sha256sums=('6c8c8210affc0866f5bce4a4422330fb840bf1507788543dc36c3f6722d6c9a8'
            'd2635a7b6305a6f13710d6b1eddfb2d0ffc66965be7c0aebb14f58040d96dc37'
            'b476aa5fdbb8fd87382c0a42202e2d71a0de4fb69156d852d070a1081da2b6cd'
            '5b3156375a107fe2eb3bfff0db1a5e74784eaf5bb75fc9252cbde20b211129e7'
            'ee77b7a7f913c74880d396e8aab1a2dc669bdb5f4b2ff311ac2e093dba078ea5'
            '2514bb01c353e8682695e1f7a5b31886273a80b303aab1403193bd1ac35a54f9'
            '3e678d08d37d2dbd0a77d72ee4543211a105904fcc51324b4de8e0cd5c7518c6'
            'da3c12d52bd2dfb675c010984073c833d131f2982a83ea33c28657f83e3a7f8f'
            '028fc10e64dc582d53df02981884f6cbc2f65a0a0c29ce640bde0e966348850c'
            '218b984ceadb6dd1c04e814c3be982fbfc30e49eebea8afa7f548dcc24eeb099'
            'b2588f7f32e1666a39bae7f3f029eda353005837bf1103fb0d5c921234cff6e4'
            'bfc2c36a401f3fdb37cc9a60038c1fa0457783675e79ebdb7613812ccae92188'
            '1130e02e14767ec2aed039c125b77bf71da7298b7f5dca513446103ae5af89c7'
            '4cf0b69d77fbedee75e43bf24e30da819d900ff6a652eeb5c82c59835e6ed4a6')

package(){
  # Install license file
  install -m 644 -D "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}" \
    "${_pkgfile}" README.txt
  # Install test files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}/test"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}/test" \
    mbroli.ini 1.pho 2.pho 3.pho 4.pho 5.pho 6.pho 7.pho 8.pho 9.pho 10.pho
}
