# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-nl2
pkgver=15.6fa9693
pkgrel=1
epoch=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A Dutch male voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/1-10.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/11-20.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/21-30.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/888.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/avond.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/beetje.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/dialog.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/maar.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/middag.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/morgen.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/nee.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/phone.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/singing.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/sta_op.pho")
sha256sums=('f307f28b504d22f151131eb2299f40bb9872586a77d58d7828514da465d68155'
            'c793a6876bdf3b6ee69dc1bf2cce52ce15785a2f85d5bb4d9d766ecd17c8e37e'
            '4efae6fbd9c9dd53667011ad6da8e79b4ca3c55c2e48498551e922003b9732de'
            '7131872b5a75fde20457789269a9c65a4b786682d9860cedbe48f11fafa4ad2c'
            '1bb94b2dd5db5a33023d810aad675256bd0f3bd15b3be07bc81fd618e8eb15cf'
            '818349e0b3008571405dd08cec8bb5848e47c4172f7ef0c34479abcdde03cf11'
            '897dae25dfda3e433c3a7bc87a2a048c7d6431767bb3a412dafb1ca420f8033d'
            '66f71d76c543e95a16e3d6f9c02cc75bc19dd53e97ecf50ed5363b6e51c8959a'
            '110c866dccc035876bd762561152c6022d2fbc26c54eddedf10f50a164cf5c8c'
            '6d8fa8e1498b6f795e903b46372663c35d527f5e207df4b1b34c49b8199aeefb'
            '612d0ddb2ca13158513374cfe27d9788cc972aaf8e9aa730773d5f31a4849242'
            '172489f3b08776a476e688769ce52c15ea983bdc48088a1caa4577197d9d2481'
            'e187b4c9a74404f7609887552022f6b7b8e2c0bfb304c7b9d9da54b1790e290f'
            'ca29e1e4482779b32aa3333bf7ef3d9bd8e465036987e4b0bb370f323021b4f7'
            'fd28c7a8646b618caaf2ee00c35e252627a9df764c980d7359bd23a98e50e223'
            'f2cb12283fd0e06fbd80412fab82a19b178cb0cb959ecdcfd68ded77143e5b37'
            '7e620582ae054214e87ec4c5f846064233614c89a9fcafa7cf15b5706b0e9fd0'
            '41cb2ddb78d332e6a0652d9e7b117a2671c783290c01e99508537b094113a250')

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
    mbroli.ini 1-10.pho 11-20.pho 21-30.pho 888.pho avond.pho beetje.pho \
    dialog.pho maar.pho middag.pho morgen.pho nee.pho phone.pho singing.pho \
    sta_op.pho
}
