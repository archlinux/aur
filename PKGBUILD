# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Alexandre Dantas <alex.dantas92@gmail.com>
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-br2
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
sha256sums=('ec26d3d229e5384477c99be1f434eb71de5f18e46f6b9a5eb6092f7f0f09c2f6'
            'f248f2947c5c933434dc18739c5185b301a9e87e0ab6da6989e48c388d56674a'
            'bb4fd81cbcbf5bed824ed9117d18cc95a2728e33d362ff409d2af5d876dac2e2'
            'e036a51c8f0a301ab23cac152a18859869c1568c9dd02fad2130f0c269d03d4c'
            '9fa894aadff58299b069e354a911c728e376dea95d1379d282d961596ff1d54c'
            'a10a1ec96f5bc4189245a9e58983dc6eab1c86cd25a59ac19b417639f7239a5c'
            '3c4efc86f8b6c8e5e40edb043e2661a2cf8bdcb239d4e5ea7745aedea221c591'
            '341fe4da836811008d9d5be2d97be1fa16f8f6daad0a8bc2baf54037b872ff72'
            'c52c7d0a61641c7aff396e898280a8586202b198d91bee23f0fa6accda55e3ad'
            'c51afe673c79e09f783ab4f5aeb0265a20f3323cc7c15ba985db85a879de64da'
            'bf3bb45199a4779201988266c5efe91fca5f66d15b7ded74cdcac8d3cb00ffda'
            'f4162cffb4c0eb8a106f26f8eef496bb91a6e3baf3428fc79dc6b9966f7c2e51'
            '3c57a49a6938da2bff0a2f23a6ff6a80b0c47d16af96d03b1cbceed73940ad51'
            '6324e7a1e84cc2b3c38906c324c6f3a882faf81205ec099cbdfe76bc68f8acf9')

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
