# llavon-ime-fcitx5-preview-git

Arch User Repository 上 [`llavon-ime-fcitx5-preview-git`][aur] 的套件中繼資料。

本套件追蹤 `llavon-ime/ime-unix` 的 `preview` 分支，可能包含尚未進入 `main`
的功能，且與正式的 `llavon-ime-fcitx5-git` 套件衝突。

GitHub Actions 會在將每一次 preview 分支更新發佈到 AUR 前，先建置並測試
Unix 服務與 Fcitx5 附加元件。

套件會下載內附的 GGUF 模型，安裝到
`/usr/share/llavon-ime/models/llavon-ime-llama-250m-Q4_K_M.gguf`。

[aur]: https://aur.archlinux.org/packages/llavon-ime-fcitx5-preview-git
