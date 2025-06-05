## XIV-Proton 10-4 Latest

Updated to GE-Proton10-4. For use with XIVLauncher-RB in Proton mode.
更新至 GE-Proton10-4。用于 Proton 模式下的 XIVLauncher-RB。

NTSync patches require kernel 6.14 or later, or an appropriately patched kernel. You also need to make sure that the ntsync kernel module is actually loaded.
NTSync 补丁需要内核 6.14 或更高版本，或者需要经过适当修补的内核。您还需要确保 ntsync 内核模块已实际加载。

Important note for the wayland driver:
Do not use the wayland checkbox in the wine tab. Instead, set PROTON_ENABLE_WAYLAND=1 in Additional Game Arguments in the Game tab . The wayland checkbox sets DISPLAY=, which may break some things when using proton wayland mode.
wayland 司机的重要注意事项： 不要使用 wine 选项卡中的 wayland 复选框。相反，请在 Game 选项卡的 Additional Game Arguments 中设置 PROTON_ENABLE_WAYLAND=1 。wayland 复选框设置 DISPLAY=，这在使用 proton wayland 模式时可能会破坏一些事情。

## XIV-Proton 10-2

There were apparently some bugs in GE-Proton 10 that have now been fixed. Hopefully this release is more stable. You may want to clear your proton prefix if you are still having issues.
显然 GE-Proton 10 中存在一些错误，现在已经被修复。希望此版本更稳定。如果您仍然有问题，您可能需要清除 proton 前缀。

Updated to GE-Proton10-2. For use with XIVLauncher-RB in Proton mode.
更新至 GE-Proton10-2。用于 Proton 模式下的 XIVLauncher-RB。

NTSync patches require kernel 6.14 or later, or an appropriately patched kernel. You also need to make sure that the ntsync kernel module is actually loaded.
NTSync 补丁需要内核 6.14 或更高版本，或者需要经过适当修补的内核。您还需要确保 ntsync 内核模块已实际加载。




## XIV-Proton10-1

Updated to GE-Proton10-1. For use with XIVLauncher-RB in Proton mode.
更新至 GE-Proton10-1。用于 Proton 模式下的 XIVLauncher-RB。

Only two patches have been added: the unix-pid mapping patch for XIVLauncher, and the portable-pdb patch to fix dalamud crashes. The ping fix and dualsense patches are now part of upstream GE-Proton.
仅添加了两个补丁：用于 XIVLuncher 的 unix-pid 映射补丁，以及用于修复 dalamud 崩溃的 portable-pdb 补丁。ping 修复和 dualsense 补丁现在是上游 GE-Proton 的一部分。

I have also created an ntsync patch from the CachyOS wine repo. The exact branch has already been deleted as of this release, but it applied cleanly and seems to work just fine.
我还从 CachyOS wine 存储库创建了一个 ntsync 补丁。截至此版本，确切的分支已被删除，但它应用得很干净，并且似乎工作正常。
