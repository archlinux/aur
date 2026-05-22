# model lifecycle and ui sync
import init_gi
from gi.repository import Gtk, Adw, GLib
import asyncio
import subprocess
import os
import shutil
import flm
import re
import display
from typing import Optional

async def init_server(app) -> None:
    # load models
    app.models = flm.get_all_models()
    app.update_model_ui()

async def wait_for_server(app) -> None:
    # wait for server
    app.model_loading = True
    app.set_entry_locked(True)
    app.btn_send.set_sensitive(False)
    app.update_model_ui()
    
    for i in range(45):
        # process died
        if app.server_process and app.server_process.poll() is not None:
            rc = app.server_process.poll()
            display.add_system_message(app, f"Error: Server process exited with code {rc}.")
            display.add_system_message(app, "Check ~/.config/flm/server.log for details.")
            app.model_loading = False
            app.update_model_ui()
            return

        if flm.is_server_ready(app.current_model, server_process=app.server_process):
            display.add_system_message(app, f"{app.current_model} is ready.")
            GLib.timeout_add_seconds(2, lambda: display.clear_status_labels(app))
            app.model_loading = False
            app.update_model_ui()
            return
            
        if i % 5 == 0:
            display.add_system_message(app, f"Waiting for {app.current_model} to initialize...")
        
        await asyncio.sleep(1)
            
    display.add_system_message(app, "Error: Runtime server failed to stabilize.")
    app.model_loading = False
    app.update_model_ui()


def confirm_download(app, model_data: dict) -> None:
    # download confirm
    if len(app.downloading_models) > 0:
        display.add_system_message(app, "A download is already in progress. Please wait.")
        return

    model_name = model_data['model']
    dialog = Adw.MessageDialog(
        transient_for=app.win,
        heading="Download Model?",
        body=f"Are you sure you want to download {model_name}? \n\nNote: The chat interface, sidebar, and other controls will be locked while the download is in progress."
    )
    dialog.add_response("cancel", "Cancel")
    dialog.add_response("download", "Download and Lock Interface")
    dialog.set_response_appearance("download", Adw.ResponseAppearance.SUGGESTED)
    
    dialog.connect("response", lambda d, r: on_download_response(app, d, r, model_name))
    dialog.present()

def on_download_response(app, dialog: Adw.MessageDialog, response: str, model_name: str) -> None:
    if response == "download":
        display.add_system_message(app, f"Starting download: {model_name}")
        app.run_task(download_model(app, model_name))
    dialog.destroy()

async def download_model(app, model_name: str) -> None:
    # run download
    app.downloading_models.add(model_name)
    
    progress = Gtk.ProgressBar()
    progress.set_fraction(0.0)
    progress.set_show_text(True)
    progress.set_margin_top(10)
    progress.set_margin_bottom(10)
    progress.add_css_class("suggested-action")
    
    app.chat_box.append(progress)
    app.update_model_ui()
    
    try:
        process = await asyncio.create_subprocess_exec(
            "flm", "pull", model_name, "--force",
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT
        )
        
        downloading_started = False
        
        while True:
            chunk = await process.stdout.read(1024)
            if not chunk:
                break
            
            output = chunk.decode('utf-8', errors='ignore')
            lines = output.split('\r')
            
            for line in lines:
                match = re.search(r"Downloading:\s+(\d+(\.\d+)?)%", line)
                if match:
                    downloading_started = True
                    percent = float(match.group(1)) / 100.0
                    GLib.idle_add(progress.set_fraction, percent)
                    GLib.idle_add(progress.set_text, f"Downloading {model_name}: {match.group(1)}%")
                elif "Download completed" in line and downloading_started:
                    GLib.idle_add(progress.set_text, "Download completed")
                    GLib.idle_add(progress.set_fraction, 1.0)
        
        await process.wait()
        if process.returncode == 0:
            display.add_system_message(app, f"Successfully downloaded {model_name}")
            display.add_system_message(app, f"Starting {model_name}...")
            app.server_process = flm.start_flm_serve(model_name, app.server_process)
            app.run_task(wait_for_server(app))
        else:
            display.add_system_message(app, f"Failed to download {model_name}")
    except Exception as e:
        display.add_system_message(app, f"Download error: {str(e)}")
    finally:
        app.chat_box.remove(progress)
        app.downloading_models.discard(model_name)
        app.models = flm.get_all_models()
        app.update_model_ui()

def update_model_ui(app) -> None:
    # update model ui
    app.models = flm.get_all_models()
    
    is_downloading_any = len(app.downloading_models) > 0
    download_msg = "Please wait for the current download to complete."
    
    # lock stuff during dl
    app.btn_new.set_sensitive(not is_downloading_any)
    app.history_list.set_sensitive(not is_downloading_any)
    if is_downloading_any:
        app.btn_new.set_tooltip_text(download_msg)
        app.history_list.set_tooltip_text(download_msg)
        app.sidebar_box.set_tooltip_text(download_msg)
    else:
        app.btn_new.set_tooltip_text("New Chat")
        app.history_list.set_tooltip_text(None)
        app.sidebar_box.set_tooltip_text(None)
    
    if app.current_model and app.current_model != "none":
        label_text = app.current_model
        model_data = next((m for m in app.models if m['model'] == app.current_model), None)
        if model_data and model_data.get('vlm', False):
            label_text = "👁 " + label_text
        app.model_btn.set_label(label_text)
    else:
        app.model_btn.set_label("Select a model to start")
    
    # toggle model btn
    app.model_btn.set_sensitive(not is_downloading_any and not getattr(app, 'is_welcome_screen', False))
    if is_downloading_any:
        app.model_btn.set_tooltip_text(download_msg)
    elif getattr(app, 'is_welcome_screen', False):
        app.model_btn.set_tooltip_text("Start a new chat to select a model.")
    else:
        app.model_btn.set_tooltip_text("Select Model")

    is_running = flm.is_server_ready(app.current_model, server_process=getattr(app, 'server_process', None)) if app.current_model else False
    ram_ok = flm.has_sufficient_ram()
    
    has_model = app.current_model is not None and app.current_model != "none"
    
    # check if installed
    is_current_installed = False
    if has_model:
        m_data = next((m for m in app.models if m['model'] == app.current_model), None)
        is_current_installed = m_data is not None and m_data.get('installed', False)

    # input toggle rules
    is_input_allowed = (has_model and 
                        is_current_installed and 
                        not is_downloading_any and
                        is_running)
    
    app.set_entry_locked(not is_input_allowed)
    app.btn_send.set_sensitive(is_input_allowed)
    app.btn_attach.set_sensitive(app.is_current_model_capable() and is_current_installed and not is_downloading_any and is_running)
    
    if is_downloading_any:
        app.entry.set_tooltip_text(download_msg)
        app.btn_send.set_tooltip_text(download_msg)
    elif has_model and is_current_installed and not is_running:
        app.entry.set_tooltip_text("Model is unloaded. Click the Load button in the header bar to load it.")
        app.btn_send.set_tooltip_text("Load model to send messages")
    else:
        app.entry.set_tooltip_text("Type your message here")
        app.btn_send.set_tooltip_text("Send message")
    
    if not app.allow_mid_chat_switch and app.history:
        app.model_btn.set_sensitive(False)
        app.model_btn.set_tooltip_text("Model locked in memory during active conversation.")
    elif not ram_ok and not is_running:
        app.model_btn.set_sensitive(False)
        app.model_btn.set_tooltip_text("System RAM is critically low. Free memory to load models.")

    popover = Gtk.Popover()
    
    # popover layout
    main_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
    
    # header
    header_label = Gtk.Label(label="AVAILABLE MODELS")
    header_label.add_css_class("model-picker-header")
    header_label.set_xalign(0.0)
    main_box.append(header_label)
    
    # line
    separator = Gtk.Separator()
    main_box.append(separator)
    
    # scroll
    scrolled = Gtk.ScrolledWindow()
    scrolled.set_min_content_height(350)
    scrolled.set_min_content_width(320)
    main_box.append(scrolled)
    
    listbox = Gtk.ListBox()
    listbox.add_css_class("model-picker-list")
    listbox.set_selection_mode(Gtk.SelectionMode.NONE)
    
    for m in app.models:
        model_name = m['model']
        is_installed = m.get('installed', False)
        is_downloading = model_name in app.downloading_models
        is_vlm = m.get('vlm', False)
        is_active = (app.current_model == model_name)
        
        row = Gtk.ListBoxRow()
        row.add_css_class("model-picker-row")
        if is_active:
            row.add_css_class("selected-model-row")
            
        box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=12)
        box.set_margin_start(12)
        box.set_margin_end(12)
        box.set_margin_top(8)
        box.set_margin_bottom(8)

        # left icon
        icon_name = "view-reveal-symbolic" if is_vlm else "cpu-symbolic"
        icon = Gtk.Image.new_from_icon_name(icon_name)
        icon.add_css_class("model-icon")
        box.append(icon)
        
        # info box
        content_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=4)
        content_box.set_hexpand(True)
        
        name_label = Gtk.Label(label=model_name)
        name_label.add_css_class("model-name-label")
        name_label.set_xalign(0.0)
        content_box.append(name_label)
        
        # badges
        badges_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=4)
        
        if is_active:
            active_badge = Gtk.Label(label="Active")
            active_badge.add_css_class("model-badge")
            active_badge.add_css_class("badge-active")
            badges_box.append(active_badge)
            
        if is_installed:
            inst_badge = Gtk.Label(label="Installed")
            inst_badge.add_css_class("model-badge")
            inst_badge.add_css_class("badge-installed")
            badges_box.append(inst_badge)
        elif is_downloading:
            dl_badge = Gtk.Label(label="Downloading...")
            dl_badge.add_css_class("model-badge")
            dl_badge.add_css_class("badge-downloading")
            badges_box.append(dl_badge)
        else:
            avail_badge = Gtk.Label(label="Available")
            avail_badge.add_css_class("model-badge")
            avail_badge.add_css_class("badge-available")
            badges_box.append(avail_badge)
            
        if is_vlm:
            vlm_badge = Gtk.Label(label="👁 Vision")
            vlm_badge.add_css_class("model-badge")
            vlm_badge.add_css_class("badge-vlm")
            badges_box.append(vlm_badge)
            
        content_box.append(badges_box)
        box.append(content_box)
        
        # actions
        right_area = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=6)
        right_area.set_valign(Gtk.Align.CENTER)
        
        if is_downloading:
            # spinner
            spinner = Gtk.Spinner()
            spinner.start()
            right_area.append(spinner)
            row.set_sensitive(False)
            name_label.add_css_class("dim-label")
        elif is_active:
            # checkmark
            check_icon = Gtk.Image.new_from_icon_name("object-select-symbolic")
            check_icon.add_css_class("model-check-icon")
            right_area.append(check_icon)
        else:
            if is_installed:
                # info btn
                info_btn = Gtk.Button.new_from_icon_name("dialog-information-symbolic")
                info_btn.add_css_class("flat")
                info_btn.add_css_class("info-btn")
                info_btn.set_tooltip_text("Model Details")
                info_btn.connect("clicked", lambda b, m=m: show_model_info(app, m))
                right_area.append(info_btn)
                
                # del btn
                del_btn = Gtk.Button.new_from_icon_name("user-trash-symbolic")
                del_btn.add_css_class("flat")
                del_btn.add_css_class("delete-btn")
                del_btn.set_tooltip_text("Delete Model")
                del_btn.connect("clicked", lambda b, m_data=m: confirm_delete(app, m_data, popover))
                right_area.append(del_btn)
            else:
                # dl btn
                dl_btn = Gtk.Button.new_from_icon_name("emblem-downloads-symbolic")
                dl_btn.add_css_class("flat")
                dl_btn.add_css_class("download-btn")
                dl_btn.set_tooltip_text("Download Model")
                dl_btn.connect("clicked", lambda b, m_data=m: confirm_download_from_btn(app, m_data, popover))
                right_area.append(dl_btn)
                name_label.add_css_class("uninstalled-model-label")
                
        box.append(right_area)
        row.set_child(box)
        listbox.append(row)
        
    listbox.connect("row-activated", lambda lb, row: on_row_activated(app, lb, row, popover))
    
    scrolled.set_child(listbox)
    popover.set_child(main_box)
    app.model_btn.set_popover(popover)
    
    if hasattr(app, "update_shortcuts_sensitivity"):
        app.update_shortcuts_sensitivity()

def confirm_download_from_btn(app, model_data: dict, popover: Gtk.Popover) -> None:
    # inline dl
    popover.popdown()
    confirm_download(app, model_data)

def show_model_info(app, model_data: dict) -> None:
    # model info
    details = (
        f"Model: {model_data.get('model', 'Unknown')}\n"
        f"Installed: {'Yes' if model_data.get('installed') else 'No'}\n"
        f"Vision Support: {'Yes' if model_data.get('vlm') else 'No'}"
    )
    dialog = Adw.MessageDialog(
        transient_for=app.win,
        heading="Model Information",
        body=details
    )
    dialog.add_response("ok", "OK")
    dialog.present()

def confirm_delete(app, model_data: dict, popover: Gtk.Popover) -> None:
    # delete confirm
    popover.popdown()
    model_name = model_data['model']
    
    dialog = Adw.MessageDialog(
        transient_for=app.win,
        heading="Delete Model?",
        body=f"Are you sure you want to permanently delete {model_name}?"
    )
    dialog.add_response("cancel", "Cancel")
    dialog.add_response("delete", "Delete")
    dialog.set_response_appearance("delete", Adw.ResponseAppearance.DESTRUCTIVE)
    
    def on_response(dialog, response):
        on_delete_response(app, dialog, response, model_data)

    dialog.connect("response", on_response)
    dialog.present()

def on_delete_response(app, dialog: Adw.MessageDialog, response: str, model_data: dict) -> None:
    # delete callback
    if response == "delete":
        model_name = model_data['model']
        # stop server first
        if app.current_model == model_name:
            app.execute_eject()

        display.add_system_message(app, f"Removing {model_name}...")
        try:
            # cli remove
            subprocess.run(["flm", "remove", model_name], check=True)
            
            # cleanup files
            repo_folder = None
            url = model_data.get('url') or model_data.get('file_url')
            if url:
                parts = url.split('/')
                # guess folder
                if "huggingface.co" in url and len(parts) >= 5:
                    repo_folder = parts[4]
            
            if repo_folder:
                models_dir = os.path.expanduser("~/.config/flm/models")
                target_path = os.path.join(models_dir, repo_folder)
                if os.path.exists(target_path):
                    shutil.rmtree(target_path)
                    display.add_system_message(app, f"Purged model directory: {repo_folder}")

            display.add_system_message(app, f"Removed {model_name}")
        except subprocess.CalledProcessError:
            display.add_system_message(app, f"Model files were missing. Cleaning up UI.")
        except Exception as e:
            display.add_system_message(app, f"Deletion error: {str(e)}")
        
        # force refresh
        app.models = flm.get_all_models()
        app.update_model_ui()
    dialog.destroy()

def on_row_activated(app, listbox: Gtk.ListBox, row: Gtk.ListBoxRow, popover: Gtk.Popover) -> None:
    # row clicked
    index = row.get_index()
    if index < len(app.models):
        on_model_selected(app, None, app.models[index], popover)

def on_model_selected(app, btn: Optional[Gtk.Button], model_data: dict, popover: Gtk.Popover) -> None:
    # select model
    model_name = model_data['model']
    is_installed = model_data.get('installed', False)
    popover.popdown()

    app.current_model = model_name
    if app.history:
        app.save_session()

    if not is_installed:
        display.add_system_message(app, f"Error: Please download {model_name} before starting.")
        confirm_download(app, model_data)
    else:
        display.add_system_message(app, f"Starting process matrix for {model_name}...")
        app.server_process = flm.start_flm_serve(model_name, app.server_process)
        app.run_task(wait_for_server(app))

    app.update_model_ui()
