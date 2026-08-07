#!/usr/bin/python3
import re
import sys

def patch_file(filepath, replacements):
    with open(filepath, 'r') as f:
        content = f.read()
    
    for pattern, replacement in replacements:
        content = re.sub(pattern, replacement, content, flags=re.DOTALL)
    
    with open(filepath, 'w') as f:
        f.write(content)

def main():
    if len(sys.argv) < 2:
        print("Usage: patch-dialogs.py <cinnamon-js-dir>")
        sys.exit(1)
    
    js_dir = sys.argv[1]
    
    # Patch desklet.js - remove desklet confirmation
    patch_file(f"{js_dir}/desklet.js", [
        (r'let dialog = new ModalDialog\.ConfirmDialog\(\s*_\("Are you sure you want to remove.*?dialog\.open\(\);',
         'let cmd = "/usr/bin/zenity-confirm-dialog.py --text=\\"Are you sure you want to remove %s?\\" --title=\\"Confirm\\"".format(this._meta.name);\n                Util.spawnCommandLineAsync(cmd, () => this._onRemoveDesklet());')
    ])
    
    # Patch expoThumbnail.js - remove workspace confirmation
    patch_file(f"{js_dir}/expoThumbnail.js", [
        (r'let confirm = new ModalDialog\.ConfirmDialog\(prompt, removeAction\);\s*confirm\.open\(\);',
         'let cmd = "/usr/bin/zenity-confirm-dialog.py --text=\\"Are you sure you want to remove workspace?\\\\" --title=\\"Confirm\\"";\n            Util.spawnCommandLineAsync(cmd, removeAction);')
    ])
    
    # Patch panel.js - multiple dialogs
    with open(f"{js_dir}/panel.js", 'r') as f:
        content = f.read()
    
    # Last panel removed dialog
    content = re.sub(
        r'let lastPanelRemovedDialog = new ModalDialog\.ConfirmDialog\(\s*_\("You don\'t have any panels added.*?lastPanelRemovedDialog\.open\(\);',
        'let cmd = "/usr/bin/zenity-confirm-dialog.py --text=\\"You don\'t have any panels added.\\\\nDo you want to open panel settings?\\" --title=\\"Panel\\"";\n            Util.spawnCommandLineAsync(cmd, function() { Util.spawnCommandLine("cinnamon-settings panel"); });',
        content,
        flags=re.DOTALL
    )
    
    # Remove panel confirmation
    content = re.sub(
        r'let confirm = new ModalDialog\.ConfirmDialog\(_\("Are you sure you want to remove this panel\?"\),\s*function\(\) \{\s*Main\.panelManager\.removePanel\(panelId\);\s*\}\);\s*confirm\.open\(\);',
        'let cmd = "/usr/bin/zenity-confirm-dialog.py --text=\\"Are you sure you want to remove this panel?\\" --title=\\"Confirm\\"";\n            Util.spawnCommandLineAsync(cmd, function() { Main.panelManager.removePanel(panelId); });',
        content,
        flags=re.DOTALL
    )
    
    # Reset panel settings confirmation
    content = re.sub(
        r'let confirm = new ModalDialog\.ConfirmDialog\(_\("Are you sure you want to restore all settings to default\?\\n\\n"\),\s*function\(\) \{.*?\}\);\s*confirm\.open\(\);',
        '''let cmd = "/usr/bin/zenity-confirm-dialog.py --text=\\"Are you sure you want to restore all settings to default?\\" --title=\\"Confirm\\"";
            Util.spawnCommandLineAsync(cmd, function() {
                Util.spawnCommandLine("gsettings reset-recursively org.cinnamon");
                Util.spawnCommandLine("gsettings reset-recursively org.cinnamon.desktop.input-sources");
                Main.restartCinnamon(true);
            });''',
        content,
        flags=re.DOTALL
    )
    
    with open(f"{js_dir}/panel.js", 'w') as f:
        f.write(content)
    
    # Patch appletManager.js - info notifications
    with open(f"{js_dir}/appletManager.js", 'r') as f:
        content = f.read()
    
    # Panel not found notification
    content = content.replace(
        'let dialog = new ModalDialog.NotifyDialog(_("A suitable panel could not be found. The applet has been removed instead."));\n        dialog.open();',
        'Util.spawnCommandLine("/usr/bin/zenity-confirm-dialog.py --info --text=\\"A suitable panel could not be found. The applet has been removed instead.\\" --title=\\"Notice\\"");'
    )
    
    # Multiple instances notification
    content = content.replace(
        'let dialog = new ModalDialog.NotifyDialog(_("Certain applets do not allow multiple instances or were at their max number of instances so were not copied"));\n        dialog.open();',
        'Util.spawnCommandLine("/usr/bin/zenity-confirm-dialog.py --info --text=\\"Certain applets do not allow multiple instances or were at their max number of instances so were not copied.\\" --title=\\"Notice\\"");'
    )
    
    with open(f"{js_dir}/appletManager.js", 'w') as f:
        f.write(content)
    
    print("All dialogs patched successfully!")

if __name__ == "__main__":
    main()
