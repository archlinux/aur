gpg -dq ~/.ssh/pass.gpg | sudo -S -v
gpg -dq ~/.ssh/pass.gpg | sudo -S paru -Rs fcitx fcitx-qt6 --noconfirm
gpg -dq ~/.ssh/pass.gpg | sudo -S paru -S fcitx5 fcitx5-qt --noconfirm
makepkg -Cf -p PKGBUILD
gpg -dq ~/.ssh/pass.gpg | sudo -S -v
gpg -dq ~/.ssh/pass.gpg | sudo -S paru -Rs fcitx5 fcitx5-qt --noconfirm
gpg -dq ~/.ssh/pass.gpg | sudo -S paru -S fcitx fcitx-qt6 --noconfirm
(cd src/mozc;patch -p1 -i ../../61.patch)
makepkg -ef -p PKGBUILD.fcitx
(cd src/mozc; git checkout src/data/dictionary_oss/dictionary*.txt)
gpg -dq ~/.ssh/pass.gpg | sudo -S -v
makepkg -ef -p PKGBUILD.fcitx.normal
gpg -dq ~/.ssh/pass.gpg | sudo -S -v
gpg -dq ~/.ssh/pass.gpg | sudo -S paru -Rs fcitx fcitx-qt6 --noconfirm
gpg -dq ~/.ssh/pass.gpg | sudo -S paru -S fcitx5 fcitx5-qt --noconfirm
makepkg -ef -p PKGBUILD.normal
