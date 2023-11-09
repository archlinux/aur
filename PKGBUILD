# Maintainer: sim
pkgname=ttf-jasonhandwriting
_commit='e7388aeba04c1d6aebe05be50735bb63a3d1d5b4'
pkgver=1.25
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
	      "README.md::https://github.com/jasonhandwriting/JasonHandwriting/raw/${_commit}/README.md")
package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/JasonHandwriting"
  install -m 644 JasonHandwriting1.ttf "${pkgdir}/usr/share/fonts/JasonHandwriting/JasonHandwriting1.ttf"
  install -m 644 JasonHandwriting2.ttf "${pkgdir}/usr/share/fonts/JasonHandwriting/JasonHandwriting2.ttf"
  install -m 644 JasonHandwriting3.ttf "${pkgdir}/usr/share/fonts/JasonHandwriting/JasonHandwriting3.ttf"
  install -m 644 JasonHandwriting3p.ttf "${pkgdir}/usr/share/fonts/JasonHandwriting/JasonHandwriting3p.ttf"  
  install -m 644 JasonHandwriting4.ttf "${pkgdir}/usr/share/fonts/JasonHandwriting/JasonHandwriting4.ttf"
  install -m 644 JasonHandwriting5.ttf "${pkgdir}/usr/share/fonts/JasonHandwriting/JasonHandwriting5.ttf"
  install -m 644 JasonHandwriting5p.ttf "${pkgdir}/usr/share/fonts/JasonHandwriting/JasonHandwriting5p.ttf"
  install -m 644 JasonHandwriting6.ttf "${pkgdir}/usr/share/fonts/JasonHandwriting/JasonHandwriting6.ttf"
  install -m 644 JasonHandwriting6p.ttf "${pkgdir}/usr/share/fonts/JasonHandwriting/JasonHandwriting6p.ttf"  
  sed -n '/JasonHandwriting/,/License./p' README.md > LICENSE
  sed -i 1,1d LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('de76a15b1e2c1a7050d061485e28195f5b682d45e37499cf730c2b8554c44cf3'
            'b67dce349d32e92e4ee7befeb0339d04ca69551bb523e60cfb5ea8f5fbd5d669'
            '7747c276f3b16306c7ab7d52465647c566d01f91faeefa70c271a3890ed35fb0'
            '4b982b009b214898d74ecd65839212fbc146d35c6e915c0c1f3a6a2db8a94f77'
            '1db91107a80c78e6d04b6d78f86a4b8946f083cb0b41ff5864009c4e1698ee4b'
            '2f0a54b56a79961e44f38d95ea293d113362e6eff438a2c351e60390d60f7960'
            '20cbc01f25637dc098ad98aa8c8e460b00613409c103879465c4185a1cb6c7a9'
            '2fa5886c15b4053eb32f3dc9e83fd7a8bf8fc599dcddd37e6c706b3fefe32ffd'
            '761cced23f78f56c8254ecfc7d0f8566d53eded61dcb0a7b7936bdde747dedee'
            '8acd902ea20ff5aa8c9672f1bcd02a4b5519f759cf1a5ade1ac26cc7039b7226')
