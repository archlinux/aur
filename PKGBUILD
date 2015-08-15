# Maintainer: Damian Nowak <damian.nowak@atlashost.eu>
# Contributor: Ender Bankaoglu <arch@tuxjobs.de>
# Contributor: Martin Schmölzer <mschmoelzer@gmail.com>

# Fork of https://aur.archlinux.org/packages/ttf-win7-fonts/

pkgname='ttf-win7-fonts-autodownload'
pkgver='7.1'
pkgrel='4'
pkgdesc="Microsoft Windows 7 TrueType Fonts (autodownloaded from various places)"
arch=('any')
url="http://www.microsoft.com"
license=('custom')
depends=('fontconfig' 'xorg-mkfontscale' 'xorg-mkfontdir')
makedepends=('fontforge' 'cabextract' 'unzip' 'convmv')
provides=('ttf-vista-fonts' 'ttf-ms-fonts' 'ttf-win7-fonts')
conflicts=('ttf-vista-fonts' 'ttf-ms-fonts' 'ttf-win7-fonts')
install="$pkgname.install"
DLAGENTS+=('fontsupply::/usr/bin/curl -e "http://www.fontsupply.com/" -A "Firefox" -fLC - --retry 3 --retry-delay 3 -o %o `echo "%u" | sed -r "s#fontsupply://(.+)\/(.+)#http://www.fontsupply.com/dl.php?fid=\1\&submitter=Download+The+Font++\2#"` ')
source=('http://valid.co.za/fonts/Arial.zip'
        'http://valid.co.za/fonts/Arialbd.zip'
        'http://valid.co.za/fonts/Arialbi.zip'
        'http://valid.co.za/fonts/Ariali.zip'
        'http://valid.co.za/fonts/Ariblk.zip'
        'http://valid.co.za/fonts/Comic.zip'
        'http://valid.co.za/fonts/Comicbd.zip'
        'http://valid.co.za/fonts/Cour.zip'
        'http://valid.co.za/fonts/Courbd.zip'
        'http://valid.co.za/fonts/Courbi.zip'
        'http://valid.co.za/fonts/Couri.zip'
        'http://valid.co.za/fonts/Georgia.zip'
        'http://valid.co.za/fonts/Georgiab.zip'
        'http://valid.co.za/fonts/Georgiai.zip'
        'http://valid.co.za/fonts/Georgiaz.zip'
        'http://valid.co.za/fonts/Impact.zip'
        'http://valid.co.za/fonts/Symbol.zip'
        'http://valid.co.za/fonts/Times.zip'
        'http://valid.co.za/fonts/Timesbd.zip'
        'http://valid.co.za/fonts/Timesbi.zip'
        'http://valid.co.za/fonts/Timesi.zip'
        'http://valid.co.za/fonts/Trebuc.zip'
        'http://valid.co.za/fonts/Trebucbd.zip'
        'http://valid.co.za/fonts/Trebucbi.zip'
        'http://valid.co.za/fonts/Trebucit.zip'
        'http://valid.co.za/fonts/Verdana.zip'
        'http://valid.co.za/fonts/Verdanab.zip'
        'http://valid.co.za/fonts/Verdanai.zip'
        'http://valid.co.za/fonts/Verdanaz.zip'
        'http://valid.co.za/fonts/Webdings.zip'
        'http://valid.co.za/fonts/Wingding.zip'
        'http://www3.telus.net/jefmil/2005/07/calibri.zip'
        'http://www3.telus.net/jefmil/2005/07/candara.zip'
        'http://www3.telus.net/jefmil/2005/07/corbel.zip'
        'https://github.com/jondot/dotfiles/raw/master/.fonts/constan.ttf'
        'https://github.com/jondot/dotfiles/raw/master/.fonts/constanb.ttf'
        'https://github.com/jondot/dotfiles/raw/master/.fonts/constani.ttf'
        'https://github.com/jondot/dotfiles/raw/master/.fonts/constanz.ttf'
        'http://dl.dropbox.com/u/3395784/aur/ttf-microsoft-consolas/ttf-microsoft-consolas-5.33.tar.xz' # from aur/ttf-microsoft-consolas
        'http://download.microsoft.com/download/0/A/F/0AFB5316-3062-494A-AB78-7FB0D4461357/windows6.1-KB976932-X64.exe'
        'license.rtf')
noextract=(${source[@]##*/})
sha256sums=('2093cc456ec8227ef546e12723d8df5b2c0fc97dfbd744736cb2759554ceb33a'
            '775ad5465c0ca6be552c78c51d949e5d0c360563f5b99d2bfd1acf16fa977a55'
            'b2e7f71852d6297d72492c1e453ef3179e0bded269ad2f830b02c543a007293a'
            'd04db7d2d73dc9a713f44129e5aa2a570eab1d0df7bdb1659cb3a7b73d593725'
            '893ab6cc96bc6ba9d5b4649c35cc53456f14facce14208c909f38d9d64650b61'
            '8fbe129e0bc097508cf8ae09818c9c17819d204ad37f2e5dafb3baae3d801db8'
            'e9066c2a62d5fd3c707011b7fb9a35318ee66929a4a5eda71740ce75ec0afd1e'
            '0dd3c5beaeb7fee5050fb4cddcc18855acd3737106a590ce744d2d30b6d04382'
            '9d1930dca2b2df370d80a757af5286ca35c7e3b69ded9b733b172a1cc6d0d0b9'
            'f761c198b7f12d374a3b25662741f9bc72942d20a372aa5c1ff887313ae3a495'
            '671a64a70ab7118a181cd0f2b44e277ef0cd01d3cde803eba7dc212836ecc130'
            '232138d3500006a104ebed378d1727c540ea0f24574fb3c43645acb3e3f64181'
            '83948f8fe0bb73e5521c4f962394f6ddf3c8c28d918d5e47fedc923532614d39'
            '5fb682038de69d9750080bfc0a580859bf0a463212f1f610b2624c005ed70641'
            '522fd8899c212e58e13952cb72373832e3547823787f58d20390ffe68aca8595'
            'b5a7a9b9b95f74dfdce2607fdf8c069910f48f90f169a927654683e8a0d886f4'
            '5bdf4f870c64d3e2abe7f1c0095595f0d873bd8c9acb363eb5b7e1b4e037117e'
            '22d65d81419ad3524930850cb0aa7210cd8b18bb075a12ad90ebd9058febd454'
            '381e41b1ada19b048d5f20888ba6eeebd18de89af74cb1b40802bbf9d61955f1'
            'c4e204a930afdb997d768d7b17abbb296d795223d7ebab3f4bf5098050512be1'
            '64a6031aead10fac405f915923cb0d5cf26b441525094e3a18c8798e7e9c47a0'
            'fd67e0225de23178970f06c381d8a8d06019a66a99028d43860ba93847458891'
            'a52086e4089d1d452d1124178f1be1fd3a0e5e03ebece417cf2ac0b71c77c806'
            'b2bdcc19f3aea8bda9ea7a6d6fa490245458045b532cee21a976be5e24fda2b4'
            'f540d33bd3388b357212df30ef716920bb88515938693cb316128f52ac5d7ee9'
            'ab3958b8998f6bec56e41bec6bc69e668807a5e3cfd98d539a67a9ed8f0b6b2d'
            'e13c592830d76cb07e9ce419be4d79b44758f47b3fb743b9fe7a84fe8d5d55ce'
            '8b0863aa29c0393b27b6b284068d374f209e4d3eaba2b36be3deaacd717b14ad'
            '8b1da5166d0d852fa324042a1cfa99ac493130663d8f83f0e94a9d491633b7cf'
            'fed45bfe611a9f45da3fcb6eb237a96dfb3003fe3b64097c01755c702667bf7a'
            '63417952e3c0c98820fb9e19fd39357131424249a5a1eca06425df7da718d1a5'
            'c27aa8bcf42c001fbcc461605504518b15bb2998e4999b0a53e6dadb28b86b02'
            '14f0a8b650f7e0edba10117b4a0b4e7a77a23373a98314cc5cbf73cb860da5c7'
            '880feeeb1fe1660029e69995afe6c96fc538b6352759c5743f4ad2c5fc412f7a'
            '735808619bb3f40ea10746aabb2bdea275c7f2c8a00cfeb5d765fcca1c834adb'
            '66b7706fa9e94a9c2907eefe84a1560b081f5aeea624b73a43043d4a2e817ea9'
            '8aa9def1b2b1abf0ef3a3095daf11fafd9557d9221b2ff57e52465b24a83812d'
            '37a083be091532f379dfdcea441ca3e3a3f4aa30e3d8dcf958fe18134219d5b0'
            '2520ac8579ffbbfd0196f27f239af23a24ffdb671a56df7013852630f9aebeb6'
            'f4d1d418d91b1619688a482680ee032ffd2b65e420c6d2eaecf8aa3762aa64c8'
            '096cdd18e26b2b3d8cf0b3ec6a1ffb5b0eaae0fcc2105e3c145f19037a42d467')

build() {
  cd "${srcdir}"

  cabextract -F '*.tt[fc]' -d 'win7_sp1' 'windows6.1-KB976932-X64.exe'
  find 'win7_sp1' -name '*.tt[fc]' -exec cp '{}' . \;

  # cambria.ttc is a TrueType Collection (TTC) which causes problems with
  # LibreOffice (Cambria Reguar cannot be selected) so we need to convert
  # the TTC into a TrueType Font (TTF).
  FONTFORGE_LANGUAGE=ff fontforge -c 'Open("cambria.ttc(Cambria)"); Generate("cambria.ttf")'

  for zip in *.zip; do
    unzip -o "$zip"
  done
  convmv --lower --notest *.TTF

  tar -xf 'ttf-microsoft-consolas-5.33.tar.xz'
}

package() {
  cd "${srcdir}"

  fontdir="${pkgdir}/usr/share/fonts/TTF"

  install -d -m 755 "${fontdir}"

  install -m 644 *.ttf "${fontdir}"
  install -D -m 644 "license.rtf" "${pkgdir}/usr/share/licenses/${pkgname}/license.rtf"
}

# vim: set ts=2 sw=2 ft=sh noet:
