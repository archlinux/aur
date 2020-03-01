# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=mbrola-voices-de7
pkgver=15.6fa9693
pkgrel=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A German female voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/english.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/erzaehl.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/french.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/gale_loud.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/gale_modal.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/gale_soft.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/hallo.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/hoerzu.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/kennen.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/spanish.pho")
sha256sums=('90d4379057f7e313209a57b3182083ea525bf96aeba491349c4443ac8b5327a1'
            'a644345be3362b418d4693b5788932997f215401bd9609a63af08779f20dff06'
            'ff7164dc02f1f0a7f5bcace2558b6281e9f8e72def3701ab463d2766131eabe1'
            'c1f6209b02b35386ee27efdbcb7991e601d4dd87e1efa922b19a8dc27a14702a'
            'fd38b0226bc441a73a461edb2b303e4d0b031932702f22db35e165b793467b9b'
            '2c8bcc728d50438eeacfa9f5525c8de2bd2a80a837525ccd413c0d252b530a54'
            '8ccdc75338aefdedd08b74980a322dad306344f2fb0b125d91dd11de2a4ad195'
            '93a44f4ef6f187fb5e9fecb04e0f9f27f87a1ec0a4741f8418a0c81b41a99ee5'
            'ad92013405088c055ccfc1e0f4e1b6e1d6d95cedfe74d0c165a6f92b8af52990'
            'f5737abe70807b38e3c9ed186569b262fa2d160fe2c15777d8f452e4289d8f0c'
            '53bb18b6dc09b51608b5d89439e17a728d5fb8240ee8e01d725780f3e7ee358c'
            'c4860d69604e88e1918760a06c286c118e6a5d49e1f703daa15e5b945f3e67c2'
            'f63d7e68cbedf581537e4ad4ee0218d72d8bda51afc76d0961d347b6cb3e09ca'
            'bc83060f888b20c9a8dede672140492a1f9d4c8d4fdad4b65d560c03f7596c69')

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
    mbroli.ini english.pho erzaehl.pho french.pho gale_loud.pho gale_modal.pho gale_soft.pho \
    hallo.pho hoerzu.pho kennen.pho spanish.pho
}
