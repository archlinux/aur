# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Alexandre Dantas <alex.dantas92@gmail.com>
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-de1
epoch=1
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
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/demo.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/w1.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/w5.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/w6.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/w7.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/w8.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/w9.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/weather.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/wetter2.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/wetter2a.pho")
sha256sums=('405417e16fa10bb777514b8b5c883d6e3427d6d9cdbb92c61a1cc4aba4d65e88'
            '05fc5059986dd56ad55be76453d6a4cd9b96ea8c2b6a0dfdfeb7d2139c47a97e'
            '5b0bafd2b527efcdba47ced3c8429a357f5e1ce960b548e65995aa507ca19d7d'
            'affb56b83324bb4004b5b292ed31c48d40fced51af7fe8b4b45c4fbc45952b33'
            '34685f39009a77c0e3e4c0c2b51d40b0c5c0644a0e8b46c6c3cd4a4d4d8e3af7'
            'e22c8d9f3962c9f42fcfbbab78dc76518528ce0b221dda6397f6e5daaa973f77'
            '3af084d79ce42712b60edc777adf9f0814567a2241591af6eb1258fc2f366ab8'
            '5ff262038f5e1575f65bfc01285325d55050140c1f39b6d52f571ed5c9508838'
            'b5dc1ef132bfd3c4ef9895e066a37d7e1fa4822562b877714c9a7c2f988040f7'
            'd43fb46da8f31887b2cee61780563d591b1bbb990a1a9ded555537062908f102'
            '3e136c414707d51238eec42a3f022cbc9b9efee3ab0f8bd1d0a72bd36585858b'
            'c711b1fb0f07cb6cb8b48516fdad50b9b7c4b7f747a47332525f1623c0962291'
            '3df1d7e81338c2bdae5af0cd67f677562407a778410fff0e9f99e3643bdd98fc'
            '1ac65ff7280be0de92ecbc2c39457419420ff626de55f400bf8f8e65548babfa')

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
    mbroli.ini demo.pho w1.pho w5.pho w6.pho w7.pho w8.pho w9.pho \
    weather.pho wetter2.pho wetter2a.pho
}
