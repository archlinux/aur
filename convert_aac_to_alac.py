#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
DaVinci Resolve Workspace Script
AAC → ALAC converter with progress UI and first-run help dialog
"""

import os
import sys
import subprocess
import shlex
import inspect
import shutil


CANDIDATE_MODULE_PATHS = [
    "/opt/resolve/Developer/Scripting/Modules"
]
for p in CANDIDATE_MODULE_PATHS:
    if p and os.path.isdir(p) and p not in sys.path:
        sys.path.append(p)

import DaVinciResolveScript as bmd

SUFFIX = "_alac"
CONVERTER_BIN = "aac2alac"


def _config_dir():
    base = os.environ.get("XDG_CONFIG_HOME", os.path.expanduser("~/.config"))
    d = os.path.join(base, "davinci-alac-scripts")
    os.makedirs(d, exist_ok=True)
    return d


FIRST_RUN_FLAG = os.path.join(_config_dir(), "first_run_shown")


def show_first_run_dialog_if_needed():
    if os.path.exists(FIRST_RUN_FLAG):
        return
    fusion = bmd.scriptapp("Fusion")
    ui = fusion.UIManager
    disp = bmd.UIDispatcher(ui)
    win = disp.AddWindow(
        {"WindowTitle": "AAC → ALAC: How to Use", "ID": "win", "Geometry": [200, 200, 520, 220]},
        ui.VGroup({"Spacing": 8, "Margins": 12}, [
            ui.Label({"Text": "This script converts AAC audio tracks to ALAC without changing the video."}),
            ui.Label({"Text": "To run: Workspace → Scripts → convert_aac_to_alac."}),
            ui.Label({"Text": "How to use this script:"}),
            ui.Label({"Text": "1) Select clips in the Media Pool."}),
            ui.Label({"Text": "2) Run the script (Workspace - Scripts - convert_aac_to_alac)"}),
            ui.Label({"Text": "3) The clip will be replaced with the converted one. If it fails, it will be imported into the 'ALAC Converted' bin."}),
            ui.HGroup({"Alignment": {"AlignRight": True}}, [
                ui.CheckBox({"ID": "dontShow", "Text": "Do not show again"}),
                ui.Button({"ID": "ok", "Text": "OK"})
            ])
        ])
    )
    itm = win.GetItems()

    def _ok(ev):
        if itm["dontShow"].Checked:
            with open(FIRST_RUN_FLAG, "w", encoding="utf-8") as f:
                f.write("1")
        win.Hide()
        try:
            disp.ExitLoop()
        except Exception:
            pass

    def _close(ev):
        win.Hide()
        try:
            disp.ExitLoop()
        except Exception:
            pass

    win.On["ok"].Clicked = _ok
    win.On["Close"].Clicked = _close
    try:
        win.On.Close = _close
    except Exception:
        pass

    win.Show()
    disp.RunLoop()
    win.Hide()


class ProgressDialog:
    """
    Robust progress:
      1) ProgressBar (if available)
      2) Slider (read-only)
      3) Label with 'NN %' text
    """
    def __init__(self, title="Converting to ALAC"):
        fusion = bmd.scriptapp("Fusion")
        self.ui = fusion.UIManager
        self.disp = bmd.UIDispatcher(self.ui)
        self._bar_kind = "label"
        bar_widget = self._make_progress_widget()

        self.win = self.disp.AddWindow(
            {"WindowTitle": title, "ID": "win", "Geometry": [300, 300, 520, 160]},
            self.ui.VGroup({"Spacing": 8, "Margins": 12}, [
                self.ui.Label({"ID": "file", "Text": "File: ..."}),
                bar_widget,
                self.ui.HGroup({"Alignment": {"AlignRight": True}}, [
                    self.ui.Button({"ID": "cancel", "Text": "Cancel"})
                ])
            ])
        )
        self.itm = self.win.GetItems()
        self._cancelled = False

        def _cancel(ev):
            self._cancelled = True

        self.win.On["cancel"].Clicked = _cancel
        self.win.Show()

    def _make_progress_widget(self):
        pb_ctor = getattr(self.ui, "ProgressBar", None)
        if callable(pb_ctor):
            self._bar_kind = "progressbar"
            return pb_ctor({"ID": "bar", "Value": 0})
        sl_ctor = getattr(self.ui, "Slider", None)
        if callable(sl_ctor):
            self._bar_kind = "slider"
            return sl_ctor({"ID": "bar", "Value": 0, "Minimum": 0, "Maximum": 100, "Enabled": False})
        self._bar_kind = "label"
        return self.ui.Label({"ID": "bar", "Text": "0 %"})

    def set_file(self, path):
        self.itm["file"].Text = f"File: {os.path.basename(path)}"
        self.pump()

    def set_pct(self, v):
        v = int(max(0, min(100, v)))
        if self._bar_kind in ("progressbar", "slider"):
            self.itm["bar"].Value = v
        else:
            self.itm["bar"].Text = f"{v} %"
        self.pump()

    def cancelled(self):
        return self._cancelled

    def pump(self):
        try:
            self.disp.ProcessEvents()
        except Exception:
            pass

    def close(self):
        self.win.Hide()
        try:
            self.disp.ExitLoop()
        except Exception:
            pass


def _this_script_dir():
    """Reliably determine the current script's directory without __file__."""
    fn = None
    try:
        frame = inspect.currentframe()
        fn = inspect.getfile(frame) if frame else None
    except Exception:
        fn = None
    if not fn:
        if sys.argv and os.path.isfile(sys.argv[0]):
            fn = sys.argv[0]
    if fn:
        return os.path.dirname(os.path.abspath(fn))
    return os.getcwd()


def run_converter_with_progress(converter_tokens, src, out_path, progress: ProgressDialog):
    cmd = converter_tokens + [src, out_path, "--progress"]
    try:
        env = os.environ.copy()
        env.setdefault("LANG", "C.UTF-8")
        env.setdefault("LC_ALL", "C.UTF-8")
        proc = subprocess.Popen(
            cmd,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
            encoding="utf-8",
            errors="replace",
            bufsize=1,
            env=env
        )
    except FileNotFoundError:
        print(f"[ALAC] Converter not found: {cmd[0]}")
        return 127
    except Exception as e:
        print(f"[ALAC] Error launching converter: {e}")
        return 127

    progress.set_file(src)
    progress.set_pct(0)
    for line in proc.stdout:
        if progress.cancelled():
            try:
                proc.terminate()
            except Exception:
                pass
            break
        line = line.strip()
        if line.startswith("PROGRESS "):
            try:
                pct = float(line.split(" ", 1)[1])
                progress.set_pct(pct)
            except Exception:
                pass
        progress.pump()
    rc = proc.wait()
    return rc


def build_output_path(src_path: str, suffix: str = SUFFIX) -> str:
    out_dir = os.environ.get("ALAC_OUTPUT_DIR")
    base_name, _ = os.path.splitext(os.path.basename(src_path))
    name = f"{base_name}{suffix}.mov"
    return os.path.join(out_dir, name) if out_dir else os.path.join(os.path.dirname(src_path), name)


def find_converter_tokens():
    env_cmd = os.environ.get("AAC2ALAC_BIN")
    if env_cmd:
        if env_cmd.lower().endswith(".py"):
            return [sys.executable, env_cmd]
        return shlex.split(env_cmd) if " " in env_cmd else [env_cmd]

    local_py = os.path.join(_this_script_dir(), "aac2alac.py")
    if os.path.isfile(local_py):
        return [sys.executable, local_py]

    exe = shutil.which(CONVERTER_BIN)
    if exe:
        return [exe]

    return [CONVERTER_BIN]


def selected_clips(media_pool):
    sel = media_pool.GetSelectedClips()
    if isinstance(sel, dict):
        return list(sel.values())
    if isinstance(sel, (list, tuple)):
        return list(sel)
    return []


def ensure_root_bin(media_pool, name: str):
    root = media_pool.GetRootFolder()
    try:
        for f in root.GetSubFolderList() or []:
            try:
                if f.GetName() == name:
                    return f
            except Exception:
                pass
    except Exception:
        pass
    return media_pool.AddSubFolder(root, name)


def import_into_bin(media_pool, folder_obj, paths):
    cur = media_pool.GetCurrentFolder()
    try:
        media_pool.SetCurrentFolder(folder_obj)
        media_pool.ImportMedia(paths)
    finally:
        media_pool.SetCurrentFolder(cur)


def main():
    show_first_run_dialog_if_needed()

    resolve = bmd.scriptapp("Resolve")
    pm = resolve.GetProjectManager()
    project = pm.GetCurrentProject()
    if not project:
        print("[ALAC] No active project")
        return

    media_pool = project.GetMediaPool()
    clips = selected_clips(media_pool)
    if not clips:
        print("[ALAC] No clips selected in Media Pool")
        return

    converter_tokens = find_converter_tokens()
    progress = ProgressDialog()

    for clip in clips:
        try:
            src = clip.GetClipProperty("File Path")
        except Exception:
            src = clip.GetFilePath() if hasattr(clip, "GetFilePath") else None
        if not src:
            print("[ALAC] Skipping: Could not get clip path")
            continue

        out_path = build_output_path(src)
        rc = run_converter_with_progress(converter_tokens, src, out_path, progress)

        if rc == 0:
            try:
                ok = clip.ReplaceClip(out_path)
            except Exception:
                ok = False

            if ok:
                print(f"[ALAC] Replaced: {os.path.basename(src)}")
            else:
                print(f"[ALAC] ReplaceClip failed - importing into 'ALAC Converted'")
                bin_ = ensure_root_bin(media_pool, "ALAC Converted")
                import_into_bin(media_pool, bin_, [out_path])

        elif rc == 3:
            print(f"[ALAC] Skipping (not AAC): {os.path.basename(src)}")
        elif rc == 127:
            print("[ALAC] Converter not found. Install aac2alac or specify AAC2ALAC_BIN.")
            break
        else:
            print(f"[ALAC] Conversion failed ({rc}): {os.path.basename(src)}")

    progress.close()


if __name__ == "__main__":
    main()