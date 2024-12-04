# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-cursors-macchiato
pkgver=1.0.2 # renovate: datasource=github-tags depName=catppuccin/cursors
pkgrel=1
pkgdesc='Soothing pastel mouse cursors - Macchiato'
arch=('any')
license=('GPL2')
url='https://github.com/catppuccin/cursors'
source=(
	"$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-blue-cursors.zip"
	"$pkgname-$pkgver-dark.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-dark-cursors.zip"
	"$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-flamingo-cursors.zip"
	"$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-green-cursors.zip"
	"$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-lavender-cursors.zip"
	"$pkgname-$pkgver-light.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-light-cursors.zip"
	"$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-maroon-cursors.zip"
	"$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-mauve-cursors.zip"
	"$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-peach-cursors.zip"
	"$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-pink-cursors.zip"
	"$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-red-cursors.zip"
	"$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-rosewater-cursors.zip"
	"$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-sapphire-cursors.zip"
	"$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-sky-cursors.zip"
	"$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-teal-cursors.zip"
	"$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/catppuccin-macchiato-yellow-cursors.zip"
)

sha256sums=('c4352db9719451c6fb32aaf1615b77a49f9739757e26bd8735efed11f591da3e'
            '8533408d03c55efd41764ec5d31b182ab063c1be658333ea06a6d2f1d4a1bab6'
            '290c47aad1f1e6ac31e92b50e4b3b7ffc0b2e5fbcb3e2601f3a4a9f805b227b3'
            '08a2bcabd315344c5fe5b7e80a04243700e0e078a65857eabf10c9a6546eb71a'
            '0342c17d16978d6663bfd0b44b9cd59b74d98841f8b46d671c0a66d84c7b3613'
            '22e02245a6f892da5f56e6e1fb90a6da0e1ca7f049b4ac45485ae2c66365b398'
            '920ebfc41ccfc05d280e349338073ebc303fc2e7eba9ae6ae12062fbfd8588c1'
            '9aa8f077dd3f9ac823239a39459d743ef0cebd68cffc00b37b7c812b0e4e3bac'
            'a036d9e5186ef2f08d314ba256ff427ae8f12abd7a642726d3883083cb12f19e'
            'e5fa313df8d516f48ea740668612b6be88e83fc1c59e0b4111be6050181f6b2f'
            '22ba12f986c78049685ab87f5b4514d08b8d826389b5c56d218ab29f42ac963e'
            'addef0b7c79ab12ed07dcc59590575b6b1d8355bf0f57db0fbdad1d84a539300'
            'e142ba350e5e0a43a04cab98ea2d72324a952756ebdf0c5fe2188df709dba1d7'
            '35104ece5cf839c9ed1c5d6f85d58897f98f223ac552d7f0517462ecc533a36a'
            'aaf5e8bd1052200e86ed8d24e5288c004a15ebc8b138e8e407587a2445bd42dd'
            '41e4c1e28a3c23525e92ef8b2451ac99c4c80dc0e64a6388d7704d693b5922cc')

package() {
	install -d "$pkgdir/usr/share/icons/"
	cp -r -a --no-preserve=ownership catppuccin-macchiato-* "$pkgdir/usr/share/icons"
}
