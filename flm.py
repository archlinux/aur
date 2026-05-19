import subprocess
import json
import psutil
from typing import List, Dict, Optional

def get_all_models() -> List[Dict]:
    try:
        res = subprocess.run(["flm", "list", "--json"], 
                           capture_output=True, text=True, check=True)
        data = json.loads(res.stdout)
        models = data.get("models", [])
        models.sort(key=lambda x: (not x.get('installed', False), x['model']))
        return models
    except Exception as e:
        print(f"Error listing models: {e}")
        return []

def is_model_in_memory(server_process: Optional[subprocess.Popen]) -> bool:
    """Determines if the flm server is running at a physical process level."""
    if server_process and server_process.poll() is None:
        return True
        
    try:
        result = subprocess.run(["pgrep", "-f", "flm serve"], capture_output=True)
        return result.returncode == 0
    except Exception as e:
        print(f"Error executing process tracking: {e}")
        return False

def has_sufficient_ram(required_gb=4.0) -> bool:
    """Ensures the host machine doesn't OOM crash under heavy local execution loads."""
    try:
        mem = psutil.virtual_memory()
        available_gb = mem.available / (1024 ** 3)
        return available_gb >= required_gb
    except Exception as e:
        print(f"RAM evaluation failed: {e}")
        return True

def start_flm_serve(model: str, current_server_process: Optional[subprocess.Popen]) -> subprocess.Popen:
    if current_server_process:
        current_server_process.terminate()
    return subprocess.Popen(["flm", "serve", model], 
                             stdout=subprocess.DEVNULL, 
                             stderr=subprocess.DEVNULL)
