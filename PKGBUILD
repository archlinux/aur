# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-tr2
pkgver=15.6fa9693
pkgrel=1
epoch=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A Turkish female voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/ikinci.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/ilki.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/phrase1.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/phrase2.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/phrase3.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/phrase4.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/phrase5.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/radyosentence1.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/radyosentence2.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/radyosentence3.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/uc.pho")
sha256sums=('9d6a9bac0c3ccb1800a914832d1c5d2766fdf1bb053c092c1657f321de32dca1'
            '6c0f88fd7225062bb9c15cdc0b1d4278c00065ce6c279eef6303bfed8b9102de'
            '95b4ba55d37a1835e0ae1d3cca8a88e3807e3f6683fc2c528fc8bfdbee08b6ec'
            '51445c4da36a5a596ea7e50a522a582215d339effd895d3225ba896f77097b3e'
            '40f1ce9b1c460138fbcda2a3e9d7a1db1a49a399373478775aca326cced4a148'
            '5be7dc74c05273e322b2bd2c4f48bdedf7079acc2e99f1f4c5aa38c122c8acda'
            '279a31de91bdd95421ca0edbba42ac3c37a46b1606f70e5cab3cb2e767baf8fd'
            'd633305362e33de8052a31dc31e41e69d5864e91a3d7ea37a81c6a0b4d3ee564'
            'e30f4cea650b7523b41d6e6af4f5ee8fe9b0ab971ba988e77e4c78bb960af446'
            '5e507f35c87fc766fe9e2cd3e779b999991b8866064c0f01da5d2d2959228505'
            '7627c2b943119e7afb0b85c2641246ce920cd1d865f66d68f20903ee63bec575'
            'b9d9d597f26ec4310174d4542dd0749e2889233fea1cf96097ac220fd50d666a'
            '5e2f19ec415f68885e1323fcf8708c0a5ea73aa93f80f4c38f2b99497cb842c6'
            '05813599ce38ac6eb22ee391af20cad53a45fd8e676897786173acc5d0b7d6ad'
            '6feefa346be4f6e367ccaf48e2be0acf9fc1a9adf749b42760605e59e34cfe80')

package(){
  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -D "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}" \
    "${_pkgfile}" README.txt
  # Install test files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}/TEST"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}/TEST" \
    mbroli.ini ikinci.pho ilki.pho phrase1.pho phrase2.pho phrase3.pho \
    phrase4.pho phrase5.pho radyosentence1.pho radyosentence2.pho \
    radyosentence3.pho uc.pho
}
