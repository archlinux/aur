#!/usr/bin/env python3
import asyncio
import aiohttp
import json
import yaml
import subprocess
import os
import sys
import time

# Default config path as used by the official ntfy client
CONFIG_PATH = os.path.expanduser("~/.config/ntfy/client.yml")
NTFY_DEFAULT_HOST = "https://ntfy.sh"

# Global dictionary to track last notification time for each error type
last_notification_time = {
    "config_file_not_found": 0,
    "no_subscriptions": 0,
    "config_parse_error": 0,
    "config_create_copy_error": 0,
    "first_run_no_subscriptions": 0,
}
NOTIFICATION_COOLDOWN = 300 # 5 minutes in seconds

# Flag to indicate if the config was just created by the script
first_run_after_copy = False

def send_notification_with_timeout(error_type, title, message):
    global last_notification_time
    current_time = time.time()
    if (current_time - last_notification_time.get(error_type, 0)) > NOTIFICATION_COOLDOWN:
        print(f"{title}: {message}")
        try:
            subprocess.run(["notify-send", "-u", "critical", title, message], check=True)
        except Exception as e:
            print(f"Warning: Could not send desktop notification: {e}")
        last_notification_time[error_type] = current_time

def load_config():
    """Loads and validates the subscriptions from the client.yml file."""
    global first_run_after_copy

    if not os.path.exists(CONFIG_PATH):
        config_dir = os.path.dirname(CONFIG_PATH)
        example_config_path = "/usr/share/examples/ntfy-notify-send-bridge-git/client.yml.example"

        try:
            os.makedirs(config_dir, exist_ok=True)
            subprocess.run(["cp", example_config_path, CONFIG_PATH], check=True)
            message = f"ntfy-notify-send-bridge-git: Example config created at {CONFIG_PATH}. Please edit it to add your ntfy subscriptions and restart the service 'systemctl --user restart ntfy-notify-send-bridge.service'."
            print(message) # This is a one-time event, no cooldown needed
            try:
                subprocess.run(["notify-send", "-u", "critical", "ntfy-notify-send-bridge", message], check=True)
            except Exception as e:
                print(f"Warning: Could not send desktop notification: {e}")
            first_run_after_copy = True # Set flag as config was just created
        except Exception as e:
            message = f"ntfy-notify-send-bridge-git: Error creating or copying config file: {e}. Please check permissions and ensure {example_config_path} exists. The service will retry after 5 minutes."
            send_notification_with_timeout("config_create_copy_error", "ntfy-notify-send-bridge", message)
        return []
        
    try:
        with open(CONFIG_PATH, 'r') as f:
            config = yaml.safe_load(f)
            
        # Extract default host or use ntfy.sh
        default_host = config.get('default-host', NTFY_DEFAULT_HOST).rstrip('/')
        
        subscriptions = []
        for sub in config.get('subscribe', []):
            topic = sub.get('topic')
            command = sub.get('command')
            
            # If no command is specified, use a default notify-send command
            if not command:
                command = "notify-send \"$NTFY_TOPIC\" \"$NTFY_MESSAGE\""

            if topic and command:
                # Construct the full URL for the JSON stream
                url = f"{default_host}/{topic}/json"
                subscriptions.append({
                    'url': url,
                    'topic': topic,
                    'command': command,
                    'user': sub.get('user'),
                    'password': sub.get('password'),
                    'if_condition': sub.get('if', {})
                })
        if not subscriptions:
            if first_run_after_copy:
                message = f"ntfy-notify-send-bridge-git: Please edit {CONFIG_PATH} to add your ntfy subscriptions and restart the service 'systemctl --user restart ntfy-notify-send-bridge.service'. The service will retry after 5 minutes."
                send_notification_with_timeout("first_run_no_subscriptions", "ntfy-notify-send-bridge", message)
            else:
                message = f"ntfy-notify-send-bridge-git: No valid subscriptions found in {CONFIG_PATH}. Please add at least one topic. The service will retry after 5 minutes."
                send_notification_with_timeout("no_subscriptions", "ntfy-notify-send-bridge", message)
            return []
        
        # If config is loaded successfully, reset all notification cooldowns and first_run_after_copy flag
        for key in last_notification_time:
            last_notification_time[key] = 0
        first_run_after_copy = False
        return subscriptions
    except Exception as e:
        message = f"ntfy-notify-send-bridge-git: Error loading or parsing config: {e}. Please check {CONFIG_PATH}. The service will retry after 5 minutes."
        send_notification_with_timeout("config_parse_error", "ntfy-notify-send-bridge", message)
        return []

def run_command(command_template, data):
    """Formats the command and executes it via subprocess."""
    # Mapping ntfy variables to their values
    replacements = {
        '$NTFY_ID': data.get('id', ''), '$id': data.get('id', ''),
        '$NTFY_TIME': str(data.get('time', '')), '$time': str(data.get('time', '')),
        '$NTFY_TOPIC': data.get('topic', ''), '$topic': data.get('topic', ''),
        '$NTFY_MESSAGE': data.get('message', ''), '$m': data.get('message', ''),
        '$NTFY_TITLE': data.get('title', ''), '$t': data.get('title', ''),
        '$NTFY_PRIORITY': str(data.get('priority', '3')), '$prio': str(data.get('priority', '3')), '$p': str(data.get('priority', '3')),
        '$NTFY_TAGS': ','.join(data.get('tags', [])), '$tags': ','.join(data.get('tags', [])), '$ta': ','.join(data.get('tags', [])),
    }

    # Apply substitutions
    final_command = command_template
    for var, val in replacements.items():
        # Using simple string replace for Bash variable syntax
        final_command = final_command.replace(var, val.replace('"', '\\"'))

    try:
        # Execute the command in a shell
        subprocess.run(final_command, shell=True, check=True)
    except subprocess.CalledProcessError as e:
        print(f"Error executing command: {e}")
    except FileNotFoundError:
        print("Command not found (is notify-send installed?).")

def check_condition(data, condition):
    """Checks the 'if' condition for a message."""
    if not condition:
        return True
    
    # Simple priority filter: if: {priority: high,urgent}
    if 'priority' in condition:
        allowed_priorities = [p.strip().lower() for p in condition['priority'].split(',')]
        message_priority = str(data.get('priority', '3')).lower()
        if message_priority not in allowed_priorities:
            return False
            
    # Add other filters (tags, etc.) as needed
    return True

async def subscribe_and_listen(subscriptions):
    """Main loop to listen to all subscriptions concurrently."""
    if not subscriptions:
        print("No valid subscriptions found in config. Exiting.")
        return

    # Startup message
    subscription_topics = ', '.join([sub['topic'] for sub in subscriptions])
    print(f"NTFY: Watching for subscriptions: {subscription_topics}")

    tasks = []
    for sub in subscriptions:
        tasks.append(asyncio.create_task(handle_subscription(sub)))
    
    await asyncio.gather(*tasks)


async def handle_subscription(sub):
    """Handles a single ntfy subscription stream."""
    while True:
        print(f"Starting listener for topic: {sub['topic']} (URL: {sub['url']})")
        auth = aiohttp.BasicAuth(sub['user'], sub['password']) if sub.get('user') else None
        
        try:
            async with aiohttp.ClientSession() as session:
                async with session.get(sub['url'], auth=auth) as response:
                    if response.status != 200:
                        print(f"HTTP Error {response.status} for {sub['topic']}. Retrying in 10s...")
                        await asyncio.sleep(10)
                        continue

                    async for line in response.content:
                        if line:
                            try:
                                data = json.loads(line)
                                if data.get('event') == 'message':
                                    if check_condition(data, sub['if_condition']):
                                        run_command(sub['command'], data)
                            except json.JSONDecodeError:
                                print(f"Received malformed JSON for {sub['topic']}.")
                            except Exception as e:
                                print(f"An error occurred for {sub['topic']}: {e}")
        except aiohttp.ClientError as e:
            print(f"Network error for {sub['topic']}: {e}. Retrying in 10s.")
        except Exception as e:
            print(f"Unexpected error for {sub['topic']}: {e}. Retrying in 10s.")
        
        await asyncio.sleep(10) # Wait before trying to reconnect


if __name__ == "__main__":
    while True:
        subs = load_config()
        if subs:
            asyncio.run(subscribe_and_listen(subs))
        else:
            # If no subscriptions (due to config error), wait for cooldown before retrying
            print(f"ntfy-notify-send-bridge-git: Waiting for {NOTIFICATION_COOLDOWN // 60} minutes before retrying configuration load.")
            time.sleep(NOTIFICATION_COOLDOWN)
