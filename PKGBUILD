# Maintainer: dougEfresh <dchimento@gmail.com>

pkgname=pi-skill-skill-creator
pkgver=0.1.0
pkgrel=1
pkgdesc='Pi skill for creating and maintaining Pi agent skills'
arch=('any')
url='https://github.com/dougefresh/pi-skill-skill-creator'
license=('MIT')
depends=('python' 'python-yaml')
source=(
  'SKILL.md'
  'README.md'
  'LICENSE'
  'validate_skill.py'
)
sha256sums=('7b486404d3bbaf8f10db606c2f0f3920843eb70ed22a5e943158284eb24389c5'
            'fcfec551f2645c8171d91f92964818358254a99a02eb37a11be4e5cce50265a5'
            '800f3f4c8e12f9c451e7d5aa4c3375f6f3ca10f25ec9280a49b59f35cbe7393a'
            '4db0f9664ad4cb3e6e22f0ae1be76825eff4535fd703b29b0ea9ecc2360105b8')

package() {
  local skilldir="$pkgdir/usr/share/pi/skills/skill-creator"

  install -Dm644 SKILL.md "$skilldir/SKILL.md"
  install -Dm644 README.md "$skilldir/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 validate_skill.py "$skilldir/scripts/validate_skill.py"
}
