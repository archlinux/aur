import argparse
import requests
from bs4 import BeautifulSoup
import weasyprint

def save_content_as_pdf(url, pdf_name, id=None, class_name=None, exclude_classes=None):
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'
    }

    response = requests.get(url, headers)
    if response.status_code == 200:
        soup = BeautifulSoup(response.content, 'html.parser')
        
        if id:
            content = soup.find(id=id)
        elif class_name:
            content = soup.find(class_=class_name)
        else:
            content = soup.body

        if content:
            if exclude_classes:
                for exclude_class in exclude_classes:
                    elements = content.find_all(class_=exclude_class)
                    for element in elements:
                        element.decompose()

            pdf_filename = f"{pdf_name}.pdf"
            html_content = str(content)
            pdf = weasyprint.HTML(string=html_content, base_url=url).write_pdf(pdf_filename)
            print(f"PDF file saved: {pdf_filename}")
        else:
            print(f"No content found based on the provided ID or class on {url}")
    else:
        print(f"Failed to retrieve content from {url}. Status code: {response.status_code}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Save webpage content as PDF')
    parser.add_argument('url', type=str, help='URL of the webpage to scrape')
    parser.add_argument('--id', type=str, help='ID of the content to extract')
    parser.add_argument('--class', dest='class_name', type=str, help='Class name of the content to extract')
    parser.add_argument('--exclude', nargs='+', help='Class names of elements to exclude')
    parser.add_argument('pdf_name', type=str, help='Name of the PDF file to save')
    args = parser.parse_args()

    save_content_as_pdf(args.url, args.pdf_name, args.id, args.class_name, args.exclude)
