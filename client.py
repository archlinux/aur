import requests
import json

def send_ollama_request(model, prompt_file, output_file):
    """
    Sends a request to the Ollama server with the prompt from a file
    and saves the response to another file.
    """
    url = "http://localhost:11434/api/generate"
    headers = {'Content-Type': 'application/json'}

    try:
        with open(prompt_file, 'r') as f:
            prompt = f.read()
    except FileNotFoundError:
        print(f"Error: Prompt file '{prompt_file}' not found.")
        return

    data = {
        "model": model,
        "prompt": prompt,
        "stream": False  # Set to False to get the complete response in one JSON object
    }

    try:
        response = requests.post(url, headers=headers, data=json.dumps(data))
        response.raise_for_status()  # Raise HTTPError for bad responses (4xx or 5xx)
    except requests.exceptions.RequestException as e:
        print(f"Error: Could not connect to Ollama API: {e}")
        return

    if response.status_code == 200:
        try:
            response_json = response.json()
            response_text = response_json.get('response', '')  # Extract the response text
        except json.JSONDecodeError:
            print("Error: Could not decode JSON response.")
            return

        try:
            with open(output_file, 'w') as f:
                f.write(response_text)
            print(f"Response saved to '{output_file}'.")
        except IOError as e:
            print(f"Error: Could not write to output file: {e}")
    else:
        print(f"Error: API request failed with status code {response.status_code}")

if __name__ == "__main__":
    model_name = "tinyllama"  # Replace with your model name
    prompt_file = "req.txt"   # Path to the file containing the prompt
    output_file = "resp.txt"  # Path to the file where the response will be saved

    send_ollama_request(model_name, prompt_file, output_file)
