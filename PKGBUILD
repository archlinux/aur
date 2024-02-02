# Maintainer: Brian Wilson <bountonw@proton.me>

pkgname=ttf-sarabun
pkgver=1.0
pkgrel=1
pkgdesc="Google looped Thai font, most popular of SIPA Thailand’s National fonts project." 
arch=('any')
url="https://fonts.google.com/specimen/Sarabun"
license=('OFL-1.1')
makedepends=('git')

_font_commit='c4603d868e87653790ff519f1223b54fb85573da'
_readme_commit='9210f591250d4a69cd4bb133538e51a2f01b1bf1'
_ofl_commit='eb31cbaf1a7a755d69efb6b2c18a77ac6644dbe4'

source=("Sarabun-Bold-${pkgver}.ttf::https://github.com/cadsondemak/Sarabun/raw/${_font_commit}/fonts/Sarabun-Bold.ttf"
        "Sarabun-BoldItalic-${pkgver}.ttf::https://github.com/cadsondemak/Sarabun/raw/${_font_commit}/fonts/Sarabun-BoldItalic.ttf"
        "Sarabun-ExtraBold-${pkgver}.ttf::https://github.com/cadsondemak/Sarabun/raw/${_font_commit}/fonts/Sarabun-ExtraBold.ttf"
        "Sarabun-ExtraBoldItalic-${pkgver}.ttf::https://github.com/cadsondemak/Sarabun/raw/${_font_commit}/fonts/Sarabun-ExtraBoldItalic.ttf"
        "Sarabun-ExtraLight-${pkgver}.ttf::https://github.com/cadsondemak/Sarabun/raw/${_font_commit}/fonts/Sarabun-ExtraLight.ttf"
        "Sarabun-ExtraLightItalic-${pkgver}.ttf::https://github.com/cadsondemak/Sarabun/raw/${_font_commit}/fonts/Sarabun-ExtraLightItalic.ttf"
        "Sarabun-Italic-${pkgver}.ttf::https://github.com/cadsondemak/Sarabun/raw/${_font_commit}/fonts/Sarabun-Italic.ttf"
        "Sarabun-Light-${pkgver}.ttf::https://github.com/cadsondemak/Sarabun/raw/${_font_commit}/fonts/Sarabun-Light.ttf"
        "Sarabun-LightItalic-${pkgver}.ttf::https://github.com/cadsondemak/Sarabun/raw/${_font_commit}/fonts/Sarabun-LightItalic.ttf"
        "Sarabun-Medium-${pkgver}.ttf::https://github.com/cadsondemak/Sarabun/raw/${_font_commit}/fonts/Sarabun-Medium.ttf"
        "Sarabun-MediumItalic-${pkgver}.ttf::https://github.com/cadsondemak/Sarabun/raw/${_font_commit}/fonts/Sarabun-MediumItalic.ttf"
        "Sarabun-Regular-${pkgver}.ttf::https://github.com/cadsondemak/Sarabun/raw/${_font_commit}/fonts/Sarabun-Regular.ttf"
        "Sarabun-SemiBold-${pkgver}.ttf::https://github.com/cadsondemak/Sarabun/raw/${_font_commit}/fonts/Sarabun-SemiBold.ttf"
        "Sarabun-SemiBoldItalic-${pkgver}.ttf::https://github.com/cadsondemak/Sarabun/raw/${_font_commit}/fonts/Sarabun-SemiBoldItalic.ttf"
        "Sarabun-Thin-${pkgver}.ttf::https://github.com/cadsondemak/Sarabun/raw/${_font_commit}/fonts/Sarabun-Thin.ttf"
        "Sarabun-ThinItalic-${pkgver}.ttf::https://github.com/cadsondemak/Sarabun/raw/${_font_commit}/fonts/Sarabun-ThinItalic.ttf"
        "https://github.com/cadsondemak/Sarabun/raw/${_readme_commit}/README.md"
        "https://github.com/cadsondemak/Sarabun/raw/${_ofl_commit}/OFL.txt")

sha256sums=('4c1b05438068d2f39ef11b9aa0c385e05f78eb5278b2e742fb07f263f5200184'
            '2aa0dfe92884a8d97ac1726da252dd2ea33e70d64147bb758009e3fc0a8fe068'
            '18817cfedd03fc96d61b26b2ccaf760c3e725d54aad79e03171f14d2919ff0d7'
            '4886a20f483fe808fc7f09eb67bb631aeb631e695f58ac55d82033e0924e5772'
            '1f9c6c42e7c79439b4a0ba80fee2164c53cdd69ac70dfaeb09461c31e00884b4'
            '6d17b6eb60a79439e9f3f4a7aadcb03551d43bd6a0d033d1ffd23afb2300cda4'
            'b768ae487dd1c5f1ac3b2b9f967c28de493bbd1b0c497670af6273966f1564b5'
            '76fe5ca7ea5721c876f236a37f2b0a0d5ef04a2af000dbaac62e926841151e1f'
            'caa088616719b214beae5945a8d3238024c5767c99f7f808f36041cd866d1da4'
            'b6a2dde1e2c0fd1efa25f8682d8acf845cf9cec9fa278a81761604d93571e90d'
            'efc3fb2fa874482812858323d500ca40aaa74e1da47fdd2e0a1de5458461d939'
            'c04a8e4add372ded2fedc9ba66c218a4084cd7d0d25776bc88b4650efe67467b'
            'e1777b6a4cbbfe1369fa43333e9085d7ec202e17d1a95f90f21aa045752c77fb'
            '17fba010ab0aeb5b0ad0f409c5626d953bfe194211664fdd985b72dd0f0b25a2'
            'efb0299a196c1237304e9c5314187946ec3b65ad03d3bb8b55e077ac4ec8968e'
            '82bd9cab826194a0640e56174023a11057d711f21bb6f5824f6e90543cc19897'
            'b491d80189de599ba10aa7dbfa5878671176793b197ff4730b68d8f745a3818b'
            'b26cae1321380296ba8311b632a397d5eac11b47197f9d0aa0b9310f1531ad60')

package() {
  install -dm755 "${pkgdir}/usr/share/fonts/ttf"

  install -m644 Sarabun-Bold-${pkgver}.ttf "${pkgdir}/usr/share/fonts/ttf/Sarabun-Bold.ttf"
  install -m644 Sarabun-BoldItalic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/ttf/Sarabun-BoldItalic.ttf"
  install -m644 Sarabun-ExtraBold-${pkgver}.ttf "${pkgdir}/usr/share/fonts/ttf/Sarabun-ExtraBold.ttf"
  install -m644 Sarabun-ExtraBoldItalic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/ttf/Sarabun-ExtraBoldItalic.ttf"
  install -m644 Sarabun-ExtraLight-${pkgver}.ttf "${pkgdir}/usr/share/fonts/ttf/Sarabun-ExtraLight.ttf"
  install -m644 Sarabun-ExtraLightItalic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/ttf/Sarabun-ExtraLightItalic.ttf"
  install -m644 Sarabun-Italic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/ttf/Sarabun-Italic.ttf"
  install -m644 Sarabun-Light-${pkgver}.ttf "${pkgdir}/usr/share/fonts/ttf/Sarabun-Light.ttf"
  install -m644 Sarabun-LightItalic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/ttf/Sarabun-LightItalic.ttf"
  install -m644 Sarabun-Medium-${pkgver}.ttf "${pkgdir}/usr/share/fonts/ttf/Sarabun-Medium.ttf"
  install -m644 Sarabun-MediumItalic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/ttf/Sarabun-MediumItalic.ttf"
  install -m644 Sarabun-Regular-${pkgver}.ttf "${pkgdir}/usr/share/fonts/ttf/Sarabun-Regular.ttf"
  install -m644 Sarabun-SemiBold-${pkgver}.ttf "${pkgdir}/usr/share/fonts/ttf/Sarabun-SemiBold.ttf"
  install -m644 Sarabun-SemiBoldItalic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/ttf/Sarabun-SemiBoldItalic.ttf"
  install -m644 Sarabun-Thin-${pkgver}.ttf "${pkgdir}/usr/share/fonts/ttf/Sarabun-Thin.ttf"
  install -m644 Sarabun-ThinItalic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/ttf/Sarabun-ThinItalic.ttf"

  install -Dm644 "$srcdir/OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
