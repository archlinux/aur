# Name: v6 with new TOML config support 
### URL: https://github.com/rajasegar/alacritty-themes/releases/tag/v6.0.2
### published at '2024-04-09T09:18:05Z' by rajasegar
---
This new release will support the latest toml config format

- Remove the preview option for now since it is buggy, you have to apply the theme to see the changes
-    If your old config is not preserved, you can restore them by renaming the latest backup file
     ``` mv alacritty.toml.xxxxxx.bak alacritty.toml ```
-    Also ensure you remove these sections in your old config file to the new theme to take effect:
    -   [colors.bright]
    -    [colors.normal]
    -  [colors.primary]

