pkgname=abinot
pkgver=1.0.0
pkgrel=1
pkgdesc="Abinot for Arch Linux"
arch=('x86_64')
url="https://abinot.ir/arch-package"
license=('GPL3')
depends=('bash' 'yay' 'base-devel' 'git' 'python')  # yay برای نصب پکیج‌های AUR الزامی است
#optdepends=()
source=(
  "abinot-setup.sh"          # اسکریپت تنظیمات
  #"abinot-service.service"   # فایل سرویس systemd (اختیاری)
)
sha256sums=('SKIP')  # بعد از آپلود فایل، هش واقعی را جایگزین کنید

package() {
  # نصب اسکریپت اصلی در مسیر /usr/bin
  install -Dm755 "$srcdir/$pkgname-$pkgver/abinot-setup" "$pkgdir/usr/bin/abinot-setup"

  # نصب فایل‌های پیکربندی (اختیاری)
  #install -Dm644 "$srcdir/$pkgname-$pkgver/configs/abinot.conf" "$pkgdir/etc/abinot.conf"
}
