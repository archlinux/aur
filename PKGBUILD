# Maintainer: sim
pkgname=ttf-jasonhandwriting
_commit='e488583c07077850aa4a2a6280baa20374cccde2'
# The collection has no shared version; use the upstream snapshot date.
pkgver=20251228
pkgrel=1
pkgdesc='An open source Traditional Chinese (Taiwan) fonts created by Jason(Yu Ching Sung)'
arch=('any')
url='https://github.com/jasonhandwriting/JasonHandwriting'
license=('custom:SIL Open Font License')
source=("JasonHandwriting1.ttf::https://github.com/jasonhandwriting/JasonHandwriting/raw/${_commit}/JasonHandwriting1.ttf"
        "JasonHandwriting2.ttf::https://github.com/jasonhandwriting/JasonHandwriting/raw/${_commit}/JasonHandwriting2.ttf"
        "JasonHandwriting3.ttf::https://github.com/jasonhandwriting/JasonHandwriting/raw/${_commit}/JasonHandwriting3.ttf"
        "JasonHandwriting3p.ttf::https://github.com/jasonhandwriting/JasonHandwriting/raw/${_commit}/JasonHandwriting3p.ttf"
        "JasonHandwriting4.ttf::https://github.com/jasonhandwriting/JasonHandwriting/raw/${_commit}/JasonHandwriting4.ttf"
        "JasonHandwriting5.ttf::https://github.com/jasonhandwriting/JasonHandwriting/raw/${_commit}/JasonHandwriting5.ttf"
        "JasonHandwriting5p.ttf::https://github.com/jasonhandwriting/JasonHandwriting/raw/${_commit}/JasonHandwriting5p.ttf"
        "JasonHandwriting6.ttf::https://github.com/jasonhandwriting/JasonHandwriting/raw/${_commit}/JasonHandwriting6.ttf"
        "JasonHandwriting6p.ttf::https://github.com/jasonhandwriting/JasonHandwriting/raw/${_commit}/JasonHandwriting6p.ttf"
        "JasonHandwriting7.ttf::https://github.com/jasonhandwriting/JasonHandwriting/raw/${_commit}/JasonHandwriting7.ttf"
        "JasonHandwriting7p.ttf::https://github.com/jasonhandwriting/JasonHandwriting/raw/${_commit}/JasonHandwriting7p.ttf"
        "JasonHandwriting8.ttf::https://github.com/jasonhandwriting/JasonHandwriting/raw/${_commit}/JasonHandwriting8.ttf"
        "JasonHandwriting8p.ttf::https://github.com/jasonhandwriting/JasonHandwriting/raw/${_commit}/JasonHandwriting8p.ttf"
        "JasonHandwriting9.ttf::https://github.com/jasonhandwriting/JasonHandwriting/raw/${_commit}/JasonHandwriting9.ttf"
        "JasonHandwriting9p.ttf::https://github.com/jasonhandwriting/JasonHandwriting/raw/${_commit}/JasonHandwriting9p.ttf"
        "README.md::https://github.com/jasonhandwriting/JasonHandwriting/raw/${_commit}/README.md")
sha256sums=('de76a15b1e2c1a7050d061485e28195f5b682d45e37499cf730c2b8554c44cf3'
            'b67dce349d32e92e4ee7befeb0339d04ca69551bb523e60cfb5ea8f5fbd5d669'
            '7747c276f3b16306c7ab7d52465647c566d01f91faeefa70c271a3890ed35fb0'
            '4b982b009b214898d74ecd65839212fbc146d35c6e915c0c1f3a6a2db8a94f77'
            '1db91107a80c78e6d04b6d78f86a4b8946f083cb0b41ff5864009c4e1698ee4b'
            '2f0a54b56a79961e44f38d95ea293d113362e6eff438a2c351e60390d60f7960'
            '20cbc01f25637dc098ad98aa8c8e460b00613409c103879465c4185a1cb6c7a9'
            '2fa5886c15b4053eb32f3dc9e83fd7a8bf8fc599dcddd37e6c706b3fefe32ffd'
            '761cced23f78f56c8254ecfc7d0f8566d53eded61dcb0a7b7936bdde747dedee'
            '415a3b569ae977de87377a892f250e53c8d12139e0f47ef7cadd8a8a359c288e'
            'df478acf044569d3f6393057574e20d1962d16ee0a48276f018c16694259ccfd'
            '1437de4a5fee29a5c6b43450df56e734af9cddb5b3a68d236cf5f42be178c93f'
            '368e64b89d468f72986a576674f8a4344c464d4d3f4596c93fe6692c70c18743'
            'b50728e2c7442a76a661c4d43c8ec22142e8edc83909a9d40b7c25d04bd04cf5'
            'e0ea1e62955008e065e1e5fc7186dd8f0ba87303987038f34fbffe5600c06c55'
            '11996d4e9f85c58af598b7dc7992681f8ac11f51122ca3d6997f45b8b2927423')

package() {
  install -dm755 "${pkgdir}/usr/share/fonts/JasonHandwriting"
  install -m644 "${srcdir}"/JasonHandwriting*.ttf "${pkgdir}/usr/share/fonts/JasonHandwriting/"
  sed -n '/JasonHandwriting/,/License./p' "${srcdir}/README.md" | sed '1d' > LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
