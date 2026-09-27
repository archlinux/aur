# pear-desktop-michei69-bin

michei69 版 [Pear Desktop](https://github.com/michei69/pear-desktop)（[pear-devs/pear-desktop](https://github.com/pear-devs/pear-desktop) 的個人 fork）的 AUR 打包工作目錄。

fork 特點：把上游因 Google 政策移除的 `no-google-login` 插件和 YouTube Music 原版圖示加回來，並堆了大量上游沒有的功能（SMTC、工作列讚/踩、歌詞翻譯引擎、資料夾式主題引擎、playlist-search、prefer-song、audio-only 等），同時緊跟上游（0 commits 落後）。

> 上游版本的 AUR 套件為 `pear-desktop` / `pear-desktop-bin` / `pear-desktop-git`（維護者 yochananmarqos）。本套件用 `-michei69-` 中綴避免撞名，比照 `pear-desktop-arjix-git` 的 fork 命名慣例。

## 檔案說明

| 檔案 | 用途 |
|---|---|
| `PKGBUILD` | 主建置腳本，抓 fork 的 v3.12.2 release deb 重打包，支援 x86_64 / aarch64 / armv7h |
| `.SRCINFO` | AUR 元資料，由 `makepkg --printsrcinfo` 產生，push 到 AUR 時必需 |
| `youtube-music.sh` | 啟動 wrapper，支援 `~/.config/youtube-music-flags.conf` 自訂命令列參數 |
| `youtube-music.install` | post_install 提示 hook |

## 本地安裝

```bash
cd ~/Documents/aur-pear-desktop-michei69-bin
makepkg -si
```

會下載約 112MB 的 deb（`youtube-music_3.12.2_amd64.deb`）。安裝後：

- 執行檔：`/usr/bin/youtube-music`
- 主程式：`/opt/YouTube Music/`
- desktop entry：`com.github.th-ch.youtube-music.desktop`

注意 `conflicts` 設了 `pear-desktop` / `youtube-music` / `pear-desktop-bin` / `pear-desktop-git`，安裝前需先移除上游版本。

## 發佈到 AUR

1. 到 <https://aur.archlinux.org> 註冊帳號，在帳號設定上傳 SSH public key
2. 把 `PKGBUILD` 第一行的 `# Maintainer: Your Name <your@email>` 換成自己
3. 推上去：

```bash
git clone ssh://aur@aur.archlinux.org/pear-desktop-michei69-bin.git
cd pear-desktop-michei69-bin
cp ~/Documents/aur-pear-desktop-michei69-bin/{PKGBUILD,.SRCINFO,youtube-music.sh,youtube-music.install} .
git add -A
git commit -m "Initial import: pear-desktop-michei69-bin 3.12.2"
git push origin master
```

之後在 AUR 頁面即可 `paru -S pear-desktop-michei69-bin` 安裝。

## fork 出新版本時的更新流程

1. 改 `PKGBUILD` 的 `pkgver`（例如 `3.12.3`），來源 URL 中的版本會自動跟著變
2. license 的 sha256 也會變，重新計算：

   ```bash
   curl -sL https://raw.githubusercontent.com/michei69/pear-desktop/v<pkgver>/license | sha256sum
   ```

3. 三個架構的 deb checksum 用串流算，不用存檔：

   ```bash
   curl -sL https://github.com/michei69/pear-desktop/releases/download/v<pkgver>/youtube-music_<pkgver>_amd64.deb  | sha256sum
   curl -sL https://github.com/michei69/pear-desktop/releases/download/v<pkgver>/youtube-music_<pkgver>_arm64.deb  | sha256sum
   curl -sL https://github.com/michei69/pear-desktop/releases/download/v<pkgver>/youtube-music_<pkgver>_armv7l.deb | sha256sum
   ```

4. 更新 `.SRCINFO` 並測試建置：

   ```bash
   makepkg --printsrcinfo > .SRCINFO
   makepkg -sf
   ```

5. commit + push 到 AUR

> fork 的版本號可能與上游相同（例如上游和 fork 都可能有 3.12.3），但 deb 內容不同——checksum 不同就代表是 fork 的檔案。

## 套件結構與上游 -bin 的關係

本 PKGBUILD 以 AUR `pear-desktop-bin`（Mark Wagie / yochananmarqos）為基底修改：

- 來源 URL 全部指向 `michei69/pear-desktop`
- `provides=('pear-desktop' 'youtube-music')`，`conflicts` 加入上游三件套
- `package()` 邏輯不變（deb 解包 + desktop-file-edit 改 Exec + AppArmor profile 連結 + 安裝 wrapper 和 license）

已於本機（x86_64）以 `makepkg` 實測建置成功並驗證套件內容（2026-09 時的 v3.12.2）。
