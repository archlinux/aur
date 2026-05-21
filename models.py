"""
Module for model management and installation.
Handles server lifecycle, model downloads, and UI synchronization.
"""
import gi
gi.require_version("Gtk", "4.0")
gi.require_version("Adw", "1")
from gi.repository import Gtk, Adw, GLib
import asyncio
import subprocess
import os
import shutil
import json
import flm
import re
import display
from typing import Optional

async def init_server(app) -> None:
    """Initializes available models and updates UI."""
    app.models = flm.get_all_models()
    update_model_ui(app)

async def wait_for_server(app) -> None:
    """Polls server process until it is active or times out, checking for crashes."""
    app.entry.set_sensitive(False)
    app.btn_send.set_sensitive(False)
    
    for i in range(45):
        await asyncio.sleep(1)
        
        # Check if process died unexpectedly
        if app.server_process and app.server_process.poll() is not None:
            rc = app.server_process.poll()
            display.add_system_message(app, f"Error: Server process exited with code {rc}.")
            display.add_system_message(app, "Check ~/.config/flm/server.log for details.")
            update_model_ui(app)
            return

        if flm.is_server_ready(app.current_model):
            display.add_system_message(app, f"{app.current_model} is ready.")
            GLib.timeout_add_seconds(2, lambda: display.clear_status_labels(app))
            update_model_ui(app)
            return
        elif i % 5 == 0:
            display.add_system_message(app, f"Waiting for {app.current_model} to initialize...")
            
    display.add_system_message(app, "Error: Runtime server failed to stabilize.")
    update_model_ui(app)

def confirm_download(app, model_data: dict) -> None:
    """Shows confirmation dialog before starting model download."""
    model_name = model_data['model']
    dialog = Adw.MessageDialog(
        transient_for=app.win,
        heading="Download Model?",
        body=f"Do you want to download {model_name}?"
    )
    dialog.add_response("cancel", "Cancel")
    dialog.add_response("download", "Download")
    dialog.set_response_appearance("download", Adw.ResponseAppearance.SUGGESTED)
    
    dialog.connect("response", lambda d, r: on_download_response(app, d, r, model_name))
    dialog.present()

def on_download_response(app, dialog: Adw.MessageDialog, response: str, model_name: str) -> None:
    """Callback for download confirmation."""
    if response == "download":
        display.add_system_message(app, f"Starting download: {model_name}")
        app.run_task(download_model(app, model_name))
    dialog.destroy()

async def download_model(app, model_name: str) -> None:
    """Executes model download with real-time progress parsing."""
    app.downloading_models.add(model_name)
    
    progress = Gtk.ProgressBar()
    progress.set_fraction(0.0)
    progress.set_show_text(True)
    progress.set_margin_top(10)
    progress.set_margin_bottom(10)
    progress.add_css_class("suggested-action")
    
    app.chat_box.append(progress)
    update_model_ui(app)
    
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
        update_model_ui(app)

def update_model_ui(app) -> None:
    """Refreshes the model selector button UI state."""
    app.models = flm.get_all_models()
    
    if app.current_model and app.current_model != "none":
        label_text = app.current_model
        model_data = next((m for m in app.models if m['model'] == app.current_model), None)
        if model_data and model_data.get('vlm', False):
            label_text = "👁 " + label_text
        app.model_btn.set_label(label_text)
    else:
        app.model_btn.set_label("Select a model to start")
    
    # Always allow new chat if models are available in the registry
    if app.models:
        app.btn_new.set_sensitive(True)
        app.btn_new.set_tooltip_text("New Chat")
    else:
        app.btn_new.set_sensitive(False)
        app.btn_new.set_tooltip_text("No models found in registry.")

    is_running = flm.is_server_ready(app.current_model) if app.current_model else False
    ram_ok = flm.has_sufficient_ram()
    
    # Enforce sensitivity based on model selection and download state
    is_downloading_any = len(app.downloading_models) > 0
    has_model = app.current_model is not None and app.current_model != "none"
    
    # Check if the currently selected model is actually installed
    is_current_installed = False
    if has_model:
        m_data = next((m for m in app.models if m['model'] == app.current_model), None)
        is_current_installed = m_data is not None and m_data.get('installed', False)

    # Input is allowed if we have a session and model selected. 
    # We remove the hard requirement for the server to be running (is_running)
    # to prevent locking the UI on backend crashes.
    is_input_allowed = (app.current_session_id is not None and 
                        has_model and 
                        is_current_installed and 
                        not is_downloading_any)
    
    app.entry.set_sensitive(is_input_allowed)
    app.btn_send.set_sensitive(is_input_allowed)
    app.btn_attach.set_sensitive(app.is_current_model_capable() and is_current_installed and not is_downloading_any)
    
    if app.current_session_id is None:
        app.model_btn.set_sensitive(False)
        app.model_btn.set_tooltip_text("Start a new chat to select a model.")
    elif not app.allow_mid_chat_switch and app.history:
        app.model_btn.set_sensitive(False)
        app.model_btn.set_tooltip_text("Model locked in memory during active conversation.")
    elif not ram_ok and not is_running:
        app.model_btn.set_sensitive(False)
        app.model_btn.set_tooltip_text("System RAM is critically low. Free memory to load models.")
    else:
        app.model_btn.set_sensitive(True)
        app.model_btn.set_tooltip_text("Select Model")

    popover = Gtk.Popover()
    scrolled = Gtk.ScrolledWindow()
    scrolled.set_min_content_height(350)
    scrolled.set_min_content_width(300)
    
    listbox = Gtk.ListBox()
    listbox.set_selection_mode(Gtk.SelectionMode.NONE)
    
    for m in app.models:
        model_name = m['model']
        is_installed = m.get('installed', False)
        is_downloading = model_name in app.downloading_models
        
        row = Gtk.ListBoxRow()
        box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=12)
        box.set_margin_start(12)
        box.set_margin_end(12)
        box.set_margin_top(8)
        box.set_margin_bottom(8)

        label_text = f"⬇ Downloading {model_name}..." if is_downloading else model_name
        if m.get('vlm', False):
            label_text = "👁 " + label_text
        label = Gtk.Label(label=label_text)
        label.set_xalign(0)
        label.set_hexpand(True)
            
        if is_downloading:
            row.set_sensitive(False)
            label.add_css_class("dim-label")
        elif not is_installed:
            label.add_css_class("uninstalled-model-label")
            label.add_css_class("dim-label")
        else:
            label.add_css_class("installed-model-label")
            # Container for actions
            actions = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=4)
            
            # Info Button
            info_btn = Gtk.Button(icon_name="dialog-information-symbolic")
            info_btn.add_css_class("flat")
            info_btn.add_css_class("dim-label")
            info_btn.set_tooltip_text("Model Details")
            info_btn.connect("clicked", lambda b: show_model_info(app, m))
            actions.append(info_btn)

            # Trash Button
            del_btn = Gtk.Button(icon_name="user-trash-symbolic")
            del_btn.add_css_class("flat")
            del_btn.add_css_class("delete-btn")
            del_btn.set_tooltip_text("Delete Model")
            del_btn.connect("clicked", lambda b, m_data=m: confirm_delete(app, m_data, popover))
            actions.append(del_btn)
            
            box.append(actions)
            
        box.append(label)
        row.set_child(box)
        listbox.append(row)
        
    listbox.connect("row-activated", lambda lb, row: on_row_activated(app, lb, row, popover))
    
    scrolled.set_child(listbox)
    popover.set_child(scrolled)
    app.model_btn.set_popover(popover)

def show_model_info(app, model_data: dict) -> None:
    """Shows a dialog with details about the selected model."""
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
    """Shows confirmation dialog before deleting a model, closing popover first."""
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
    """Callback for deletion confirmation with force-refresh and folder cleanup."""
    if response == "delete":
        model_name = model_data['model']
        # Always eject first if it's the current model to stop the server
        if app.current_model == model_name:
            app.execute_eject()

        display.add_system_message(app, f"Removing {model_name}...")
        try:
            # 1. Standard CLI removal
            subprocess.run(["flm", "remove", model_name], check=True)
            
            # 2. Proactive folder cleanup in ~/.config/flm/models/
            # Many models use the repo name as the folder name.
            # We can try to derive this from the 'url' or 'file_url' in model_data.
            repo_folder = None
            url = model_data.get('url') or model_data.get('file_url')
            if url:
                parts = url.split('/')
                # Usually: https://huggingface.co/FastFlowLM/FolderName/...
                if "huggingface.co" in url and len(parts) >= 5:
                    repo_folder = parts[4]
            
            if repo_folder:
                models_dir = os.path.expanduser("~/.config/flm/models")
                target_path = os.path.join(models_dir, repo_folder)
                if os.path.exists(target_path):
                    import shutil
                    shutil.rmtree(target_path)
                    display.add_system_message(app, f"Purged model directory: {repo_folder}")

            display.add_system_message(app, f"Removed {model_name}")
        except subprocess.CalledProcessError:
            display.add_system_message(app, f"Model files were missing. Cleaning up UI.")
        except Exception as e:
            display.add_system_message(app, f"Deletion error: {str(e)}")
        
        # Force model list refresh
        app.models = flm.get_all_models()
        update_model_ui(app)
    dialog.destroy()

def on_row_activated(app, listbox: Gtk.ListBox, row: Gtk.ListBoxRow, popover: Gtk.Popover) -> None:
    """Activated when a model row is selected."""
    index = row.get_index()
    if index < len(app.models):
        on_model_selected(app, None, app.models[index], popover)

def on_model_selected(app, btn: Optional[Gtk.Button], model_data: dict, popover: Gtk.Popover) -> None:
    """Handles model selection and server initialization."""
    model_name = model_data['model']
    is_installed = model_data.get('installed', False)
    popover.popdown()

    app.current_model = model_name
    if app.history:
        app.save_session()

    if not is_installed:
        confirm_download(app, model_data)
    else:
        display.add_system_message(app, f"Starting process matrix for {model_name}...")
        app.server_process = flm.start_flm_serve(model_name, app.server_process)
        app.run_task(wait_for_server(app))

    update_model_ui(app)
