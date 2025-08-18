import os
import subprocess
import json
import time
import warnings
def _run_command(command):

    #Works as of version 2.3.5
    # print(f"Running command: {command}")
    try:
        result = subprocess.run(command.split(), capture_output=True, text=True, check=True)
        return result.stdout
    except subprocess.CalledProcessError as e:
        print(f"Command failed: {e}")
        return ""

def get_clients():

    #Works as of version 2.3.5
    try:
        result = _run_command('hyprctl clients -j')
        return json.loads(result)
    except json.JSONDecodeError as e:
        print(f"Error decoding JSON: {e}")
        return []

def get_client_info(address: str):

    #Works as of version 2.3.5
    clients = get_clients()
    for client in clients:
        if client.get("address") == address:
            return client
    print(f"No client found with address: {address}")
    return None

def get_active_window():
    # Returns address
    #Works as of version 2.3.5
    out = _run_command("hyprctl activewindow -j")
    try:
        j = json.loads(out)
        return j.get("address", "")
    except Exception as e:
        print(f"Error getting active window: {e}")
        return ""
def get_window_by_class_and_title(title,class_in):
    #Works as of version 2.3.5

    clients = get_clients()
    for client in clients:
        if client.get("title") == title and client.get("class") == class_in:
            return client
def set_active_window(address, max_count=10):

    #Works as of version 2.3.5
    count = 0
    # while get_active_window() != address and count < max_count:
    _run_command(f"hyprctl dispatch focuswindow address:{address}")
        # time.sleep(0.05)  # tiny wait
        # count += 1
    # return count < max_count

def move_window_local(address, target_x, target_y):

    #Broken as of version 2.3.5
    warnings.warn("Broken as of version 2.3.5",category=DeprecationWarning)
    info = get_client_info(address)
    if not info:
        print("Could not get window info.")
        return

    current_pos = info.get("at", [0, 0])
    dx = target_x - current_pos[0]
    dy = target_y - current_pos[1]

    print(f"Moving window by offset dx={dx}, dy={dy}")
    set_floating(address=address)
    _run_command(f"hyprctl dispatch movewindowpixel {dx} {dy}, address:{address}")
    new_info =  get_client_info(address)
    pos = info.get("at", [0, 0])
    print(f"Window position: {pos[0]}:{pos[1]}")

def move_window_global(address, target_x, target_y,workspace_id):
    warnings.warn("Broken as of version 2.3.5",category=DeprecationWarning)

    #Possibly broken, not very precise as of version 2.3.5 
    info = get_client_info(address)
    if not info:
        print("Could not get window info.")
        return

    current_pos = info.get("at", [0, 0])
    dx = target_x - current_pos[0]
    dy = target_y - current_pos[1]

    print(f"Moving window by offset dx={dx}, dy={dy}")
    set_floating(address=address)
    print("workspace_id",workspace_id)
    set_active_window(address=address)
    move_win_to_workspace(address,workspace_id)
    # set_current_workspace(workspace_id)
    _run_command(f"hyprctl dispatch movewindowpixel {dx} {dy}, address:{address}")
    new_info =  get_client_info(address)
    pos = info.get("at", [0, 0])
    print(f"Window workspace: {new_info.get('workspace')}")
    print(f"Window position: {pos[0]}:{pos[1]}")

def toggle_floating(address):
    # Works as of version 2.3.5
    _run_command(f"hyprctl dispatch togglefloating address:{address}")

def set_floating(address):
    #Works as of version 2.3.5
    window_data = get_client_info(address=address)
    is_floating = window_data['floating']
    if(is_floating == False):
        toggle_floating(address=address)
        window_data = get_client_info(address=address)
        return window_data['floating'] == True
    else:
        return True
def set_tiling(address):
    #Works as of version 2.3.5

    window_data = get_client_info(address=address)
    is_floating = window_data['floating']
    if(is_floating == True):
        toggle_floating(address=address)
        window_data = get_client_info(address=address)
        return window_data['floating'] == False
    else:
        return True

def set_current_workspace(workspace:int):

    #Works as of version 2.3.5 UNLESS already on workspace
    _run_command(f"hyprctl dispatch workspace {workspace}")

def focus_window(address):
    warnings.warn("Broken as of version 2.3.5",category=DeprecationWarning)

    #Broken as of version 2.3.5
    #Just moves your course to the right workspace, 
    _run_command(f"hyprctl dispatch focuswindow address:{address}")

def move_win_to_workspace(address,workspace):
    #Works as of version 2.3.5
    # Notes. In tiled mode, does not retain location when between workspaces
    _run_command(f"hyprctl dispatch movetoworkspacesilent {workspace}, address:{address}")

def get_active_workspace():
    #Works as of version 2.3.5
    return json.loads(_run_command("hyprctl activeworkspace -j"))
def get_active_workspace_id():
    #Works as of version 2.3.5
    workspace_info = get_active_workspace()
    print("workspace_info",workspace_info)
    workspace_id = workspace_info["id"]
    return workspace_id


# hyprctl dispatch focuswindow address:0x56090b1d8c20
# hyprctl dispatch movetoworkspacesilent 1,address:0x56090b1d8c20
# hyprctl dispatch movewindowpixel 0 0, address:0x56090b1d8c20