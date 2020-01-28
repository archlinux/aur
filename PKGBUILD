# Maintainer: Cindy Wang (CindyLinz) <cindylinz@gmail.com>

pkgname=taipei-sans-tc
pkgver=1.000
pkgrel=1
pkgdesc="JT Foundry - Taipei Sans TC Beta font"
arch=(any)
url="https://sites.google.com/view/jtfoundry/"
license=(custom:SIL)
depends=(fontconfig)
source=(
    'TaipeiSansTCBeta-Regular.ttf::https://drive.google.com/uc?export=download&id=1eGAsTN1HBpJAkeVM57_C7ccp7hbgSz3_'
    'TaipeiSansTCBeta-Light.ttf::https://drive.google.com/uc?export=download&id=1QdaqR8Setf4HEulrIW79UEV_Lg_fuoWz'
    'TaipeiSansTCBeta-Bold.ttf::https://drive.google.com/uc?export=download&id=1Om8izPz02Msc15onhS_ki1lrlAIf05Pd'
    LICENSE
)
sha256sums=(
    8cc967e1e428c552701c461e8169e6ae76c7a23694ea1a6a786d6746adec53c4
    d69a9ea6a77f694c3a1a1fb766c764aa74cb3e2c4c69f1b532edf98b3f2bb662
    5249d3bdda9c9f4c62840e804b4d2530b7f4dfab6d68fb508c120b0e7e600419
    6a73f9541c2de74158c0e7cf6b0a58ef774f5a780bf191f2d7ec9cc53efe2bf2
)

package() {
  install -Dm 644 *.ttf -t $pkgdir/usr/share/fonts/TTF
  install -Dm 644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}
