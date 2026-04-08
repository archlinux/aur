import os
import json
import requests
import minecraft_launcher_lib
import subprocess
from uuid import uuid4


class LauncherLogic:
    def __init__(self):
        # Базовый путь в домашней директории пользователя
        self.base_path = os.path.expanduser("~/.violet_launcher")
        self.config_file = os.path.join(self.base_path, "config.json")
        if not os.path.exists(self.base_path):
            os.makedirs(self.base_path)

    def load_config(self):
        if os.path.exists(self.config_file):
            with open(self.config_file, 'r') as f: return json.load(f)
        return {"username": "", "profiles": [], "selected_profile": None, "ram": 4}

    def save_config(self, data):
        with open(self.config_file, 'w') as f: json.dump(data, f, indent=4)

    def get_allowed_versions(self):
        # ТВОЙ СТРОГИЙ СПИСОК ВЕРСИЙ - ВОЗВРАЩЕН
        return ["1.16.5", "1.18.2", "1.19.4", "1.20.1", "1.21.1", "1.21.4"]

    def search_modrinth(self, query, version, loader, project_type="mod"):
        # Универсальный поиск для модов, текстур и шейдеров
        if project_type in ["resourcepack", "shader"]:
            facets = f'[["versions:{version}"], ["project_type:{project_type}"]]'
        else:
            facets = f'[["versions:{version}"], ["categories:{loader.lower()}"], ["project_type:mod"]]'

        params = {"query": query, "facets": facets, "limit": 15}
        try:
            r = requests.get("https://api.modrinth.com/v2/search",
                             params=params,
                             headers={'User-Agent': 'VioletLauncher/1.0'},
                             timeout=5)
            return r.json().get("hits", [])
        except:
            return []

    def download_content(self, project_id, version, profile_name, project_type="mod"):
        # Папки для разных типов контента
        folders = {
            "mod": "mods",
            "resourcepack": "resourcepacks",
            "shader": "shaderpacks"
        }
        sub_folder = folders.get(project_type, "mods")
        target_path = os.path.join(self.base_path, "profiles", profile_name, sub_folder)

        if not os.path.exists(target_path): os.makedirs(target_path)

        try:
            v_data = requests.get(f"https://api.modrinth.com/v2/project/{project_id}/version",
                                  headers={'User-Agent': 'VioletLauncher/1.0'}).json()
            for v in v_data:
                if version in v['game_versions']:
                    file_info = v['files'][0]
                    r = requests.get(file_info['url'])
                    with open(os.path.join(target_path, file_info['filename']), "wb") as f:
                        f.write(r.content)
                    return True
        except:
            return False

    def install_loader(self, version, loader_type):
        if loader_type == "Fabric":
            minecraft_launcher_lib.fabric.install_fabric(version, self.base_path)
            for v in minecraft_launcher_lib.utils.get_installed_versions(self.base_path):
                if "fabric" in v['id'] and version in v['id']: return v['id']
        minecraft_launcher_lib.install.install_minecraft_version(version, self.base_path)
        return version

    def generate_launch_command(self, version_id, username, jvm_args, profile_name):
        profile_path = os.path.join(self.base_path, "profiles", profile_name)
        if not os.path.exists(profile_path): os.makedirs(profile_path)
        options = {
            "username": username, "uuid": str(uuid4()), "token": "0",
            "jvmArguments": jvm_args, "gameDirectory": profile_path
        }
        return minecraft_launcher_lib.command.get_minecraft_command(version_id, self.base_path, options)