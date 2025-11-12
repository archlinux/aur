# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
pkgname=appium
pkgver=3.1.1
pkgrel=1
pkgdesc="Cross-platform automation framework for all kinds of apps"
arch=('x86_64')
url="https://appium.io"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
optdepends=(
  'nodejs-appium-chromium-driver: Appium 2.x driver for Chromium-based browsers that work with Chromedriver'
  'nodejs-appium-espresso-driver: Espresso integration for Appium'
  'nodejs-appium-geckodriver: Appium driver for Gecko-based browsers and web views'
  'nodejs-appium-mac2-driver: XCTest-based Appium driver for macOS apps automation'
  'nodejs-appium-safari-driver: Appium driver for Safari browser'
  'nodejs-appium-uiautomator2-driver: UiAutomator2 integration for Appium'
  'nodejs-appium-windows-driver: Appium bridge to WinAppDriver'
  'nodejs-appium-xcuitest-driver: Appium driver for iOS using XCUITest for backend'
)
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('dfdbfa84113a6617810b32e96e6136fe059d845f84cc4d1f1d9ae89d7ac9e1b0')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
