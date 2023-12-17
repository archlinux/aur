# arch-wine-neteasemusic

### 1、简介

wine 版网易云音乐在 arch 系发行版的构建。

上游是星火商店的打包项目，项目地址：https://www.spark-app.store/store/application/com_dot_163_dot_music_dot_spark



### 2、安装

clone 此项目后：

```bash
cd arch-wine-neteasemusic && makepkg -si
```



### 3、注意事项

本构建中 wine 暂时**使用默认 wine**，而不是 deepinwine 或 sparkwine。

如果你遇到运行问题，或有其他自定义需求，可以自行使用其他 wine 版本。方法是：更改 [PKGBUILD](./PKGBUILD) 文件的 depends，同时更改此文件第 30 行：

```bash
sed -i 's/"spark-wine"/"wine"/' opt/apps/${pkgname}/files/run.sh
```

其中的 `wine` 这一值需要改为其他 wine 二进制名。例如使用 `deepin-wine6-stable`，就改为：

```bash
sed -i 's/"spark-wine"/"deepin-wine6-stable"/' opt/apps/${pkgname}/files/run.sh
```

当然，如果你使用的是 `spark-wine` 本身，可以直接删除此行。

