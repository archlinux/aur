# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: wido <widomaker2k7@gmail.com>
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-fr3
pkgver=15.6fa9693
pkgrel=1
epoch=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A French male voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/bonjour.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/ceserait.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/claire.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/jaiete.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/kundera.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/levai.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mavoix.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/nouspouv.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/nouspouvons.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/tagada.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/trenet.pho")
sha256sums=('49450f30f01f87e9c17d1364ba2d46fad8a692b7fe6b59347d32dd423bc1c275'
            '9ae5fe8d250a2a6b75f8a5054964bcc5ce4516e6c515f7bdde4588ae60ef64c2'
            '5ce17b3fa0a6f65ae17801e81fcc0deba1721cf41a6924cc3d2b75b2b9aa3725'
            'b29076c1e7995017a3a9ab5acd17c9f1be59a929321a1aee36ae96a190b7cd6e'
            '93df036e8d53dd96ce227b88216ca4206f643df710ca3d3673f6f662b341657e'
            'ecc8e5bb93ff9b4c2fe883547e8ea07c2a51839782a15cfb42016502ca0e0806'
            '015b146f1fbae0a6c130dc36c9d978a1cc3356854aa878f5e45ca182d0460986'
            'cb538ae1dbdf480491b9ead68291b2864db68ce970dd9ec9c49c70d3a24199ef'
            'c09a8126bca5c9e852149bb9b036eb55da65f31c0536509900190ad37b85d29a'
            '652d79a9b4dd09edd0d340cc52f89549eeef44bc083aa4e89540c0c734a06d2c'
            'e18513001ceefd2fc7ec6a8a0de4859499f0c51f103fa0ffa5f3585e079cc428'
            'c4611c1e7b2b58aed7f16defc93b85cbb91d29e3856cd6326172e4acb3191e25'
            '0257a8a366daa9f02d608faee0d86a774ee4ce218fa0863af5af5bdc31f92f51'
            '8988c2702321a715a94856785cce69e464565feb7679de2187ac10100a0b1699'
            '50b7f2cd0946bda968a3238e7d424352576f92b13c34bd20b3602a3509a2d9d9')

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
    mbroli.ini bonjour.pho ceserait.pho jaiete.pho kundera.pho levai.pho \
    mavoix.pho nouspouv.pho nouspouvons.pho tagada.pho trenet.pho
}
