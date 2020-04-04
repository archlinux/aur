# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-mx1
pkgver=15.6fa9693
pkgrel=1
epoch=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A Spanish Mexican male voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/example1.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/example2.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/example4.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/example5.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/example6.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/example7.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/example8.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/example9.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/example11.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/example12.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/example13.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/example14.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/example15.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/example16.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/example17.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/example18.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/example19.pho")
sha256sums=('4b4e09c5eea3c2f385ce51eb280c17223118b560b96c0339deb74dee0d7224dc'
            '80de85a36b25f63b991c55a6ee7bbfdd1ab717985c3af42b113a037a39dd328e'
            '474ae264946e9d1a8ddebf707ff27e17c67b0b4963722b1aaaff67814894e091'
            'e63745e5f11178c4a7ff5f2d746dee37f214c0771942aff48cd341ba5cf1a0cd'
            'fed2ab2c3027217418e2a1186ac8250591df68c1450fcf4fadc68831481c71a6'
            '2da2dee72a0abe80c211121e51b1bc39d74f35d251f6df8b9f9fc4471cbbe1d7'
            '855687e7732ef47b8f382b14b4da36f7798e1dcb0f199f619fbde73b3891fd59'
            'eaff886bafeac592b1ed7d74f172561f0a651e05c5623d0af7e73ef032c8909b'
            'd0a5d65ec4e907ed211a711e5b5140a98e321cc16961c9e5a3161c39bbe0e9aa'
            'f50e96dbc8f3332e1893e1d1bc5e0664a8c2c77777bf0bfe0659041aab7b23c7'
            '1e84f27c61059d5ccca5b864ecddfa92943f557ab8671dd0d2a51e3b88a3ddb6'
            'f727473a94f177913ccbd7a0f40034f3e5573bdeaab8d30507a468387a339991'
            'b8567e0c8a895b826b872d423f45ad6958c9bd15c9d0f53ccbadd4c92245b17a'
            '8efa24a8d13fad6c92cdc96d649c43724c3eb9cfe5b6c31fa9dae1850f00138d'
            '74dd236448c462a3d71eaa32a3eeaa4f0b9cd0197eb914b16fe0a0c129597d88'
            '8cd8ee34f879e338177a4a3cdb2e7bc2282cb39381609135d49387d56e58032c'
            '2d1d731667f6c94ccf5e51b04edddd6ed5d362485df7823f04d92b7a608ca5bb'
            'a038e76312fd3dd34d9f33cdd21485f549c302331ba6ee05d05e8f3d8e32225f'
            'c318664efdbfd16121a75cb45ecdb0e0ef96da2feae6bc923b41b5110ad542ee'
            '6af37e5be8009df3a7c2539f83b65d9a691fd66945deb75bc4fb9b1ac9adb862'
            '0e9adee853fc58142741d5c54996ffdbb8701c91a36a1f0466105166e7fd34f1')

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
    mbroli.ini example1.pho example2.pho example4.pho example5.pho \
    example6.pho example7.pho example8.pho example9.pho example11.pho \
    example12.pho example13.pho example14.pho example15.pho example16.pho \
    example17.pho example18.pho example19.pho
}
