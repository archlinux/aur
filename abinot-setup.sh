#!/bin/bash
echo "=== Abinot for Arch Linux ==="

# نصب پکیج‌های رسمی
sudo pacman -S --noconfirm bash yay git base-devel

# نصب پکیج‌های AUR با yay
yay -S --noconfirm python

# فعال‌سازی سرویس‌ها (مثال)
sudo systemctl enable python.service

# کپی تنظیمات پیش‌فرض
sudo cp /etc/abinot.conf /etc/abinot.conf.backup  # پشتیبان‌گیری
echo "Configuration completed!"
