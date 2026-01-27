import requests
import json
import os

# Set your OpenRouter API key as an environment variable or replace with the actual key
OPENROUTER_API_KEY = os.getenv("OPENROUTER_API_KEY", "GET_YOUR_KEY_AT_OPENROUTER.AI")

def send_openrouter_request(model, prompt_file, output_file):
    """
    Sends a request to the OpenRouter API with the prompt from a file
    and saves the response to another file.
    """
    # OpenRouter API endpoint
    url = "https://openrouter.ai/api/v1/chat/completions"
    headers = {
        "Authorization": f"Bearer {OPENROUTER_API_KEY}",
        "Content-Type": "application/json",
        "HTTP-Referer": "<YOUR_SITE_URL>",  # Optional. Replace with your site URL.
        "X-Title": "<YOUR_SITE_NAME>",     # Optional. Replace with your site name.
    }

    # Check if the API key is still the placeholder value
    if OPENROUTER_API_KEY == "your_openrouter_api_key_here":
        print("Warning: Replace 'your_openrouter_api_key_here' with your actual OpenRouter API key.")
        return

    try:
        # Read the prompt from the file
        with open(prompt_file, 'r') as f:
            prompt = f.read()
    except FileNotFoundError:
        print(f"Error: Prompt file '{prompt_file}' not found.")
        return
    except IOError as e:
        print(f"Error: Could not read prompt file: {e}")
        return

    # Define the request payload
    data = {
        "model": model,  # Specify the model to use
        "messages": [{"role": "user", "content": prompt}],  # Format for chat-based models
        "max_tokens": 512,  # Optional: Set max tokens for the response
        "temperature": 0.7  # Optional: Control randomness of the output
    }

    try:
        # Send the POST request to the OpenRouter API
        response = requests.post(url, headers=headers, json=data)
        response.raise_for_status()  # Raise HTTPError for bad responses (4xx or 5xx)
    except requests.exceptions.RequestException as e:
        print(f"Error: Could not connect to OpenRouter API: {e}")
        return

    if response.status_code == 200:
        try:
            # Parse the JSON response
            response_json = response.json()
            # Extract the generated text (adjust key based on OpenRouter's response structure)
            response_text = response_json.get('choices', [{}])[0].get('message', {}).get('content', '').strip()
        except json.JSONDecodeError:
            print("Error: Could not decode JSON response.")
            return
        except KeyError:
            print("Error: Unexpected response structure from OpenRouter API.")
            return

        try:
            # Save the response to the output file
            with open(output_file, 'w') as f:
                f.write(response_text)
            print(f"Response saved to '{output_file}'.")
        except IOError as e:
            print(f"Error: Could not write to output file: {e}")
    else:
        print(f"Error: API request failed with status code {response.status_code}")

if __name__ == "__main__":
    model_name = "cognitivecomputations/dolphin3.0-r1-mistral-24b:free"  # Replace with your desired model
    prompt_file = "req.txt"  # Path to the file containing the prompt
    output_file = "resp.txt"  # Path to the file where the response will be saved

    send_openrouter_request(model_name, prompt_file, output_file)
