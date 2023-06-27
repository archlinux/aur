extern crate reqwest;
use html_escape::decode_html_entities;

#[tokio::main]
async fn main() -> Result<(), reqwest::Error> {
    let client = reqwest::Client::new();

    // GET request to the URL
    let response = client.get("https://www.biblegateway.com/votd/get/?format=json")
        .send()
        .await?;

    // Ensure the response
    if response.status().is_success() {
        // Reads the JSON
        let json: serde_json::Value = response.json().await?;

        // Gets the verse from the JSON
        let verse = json["votd"]["text"].as_str().unwrap_or("Verse not found");
        let reference = json["votd"]["display_ref"].as_str().unwrap_or("Reference not found");

        // Cleans up HTML
        let cleaned_verse = decode_html_entities(verse);

        // Print the verse to the console
        println!("{}", reference);
        //println!("Bible Verse: {}", cleaned_verse);
        println!("{}", cleaned_verse);
    } else {
        println!("Failed to fetch Bible verse: {}", response.status());
    }

    Ok(())
}
