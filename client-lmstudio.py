import requests
import json

def send_lm_studio_request(model, prompt_file, output_file):
    """
    Sends a request to the LM Studio server with the prompt from a file
    and saves the response to another file.
    """
    # Update the URL to LM Studio's local server
    url = "http://localhost:8000/v1/completions"  # Adjust port if necessary
    headers = {'Content-Type': 'application/json'}
    
    try:
        # Read the prompt from the file
        with open(prompt_file, 'r') as f:
            prompt = f.read()
    except FileNotFoundError:
        print(f"Error: Prompt file '{prompt_file}' not found.")
        return
    
    # Define the request payload
    data = {
        "model": model,  # Use the qwen2.5-coder-3b model
        "prompt": prompt,
        "max_tokens": 512,  # Optional: Set max tokens for the response
        "temperature": 0.7  # Optional: Control randomness of the output
    }
    
    try:
        # Send the POST request to the LM Studio API
        response = requests.post(url, headers=headers, data=json.dumps(data))
        response.raise_for_status()  # Raise HTTPError for bad responses (4xx or 5xx)
    except requests.exceptions.RequestException as e:
        print(f"Error: Could not connect to LM Studio API: {e}")
        return
    
    if response.status_code == 200:
        try:
            # Parse the JSON response
            response_json = response.json()
            # Extract the generated text (adjust key based on LM Studio's response structure)
            response_text = response_json.get('choices', [{}])[0].get('text', '').strip()
        except json.JSONDecodeError:
            print("Error: Could not decode JSON response.")
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
    model_name = "qwen2.5-coder-3b"  # Replace with your desired model
    prompt_file = "req.txt"          # Path to the file containing the prompt
    output_file = "resp.txt"         # Path to the file where the response will be saved
    
    send_lm_studio_request(model_name, prompt_file, output_file)
