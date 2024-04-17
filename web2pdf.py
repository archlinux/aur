import argparse
import requests
from bs4 import BeautifulSoup
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import letter

def save_content_as_pdf(url, id, pdf_name):
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'
    }

    response = requests.get(url, headers)
    if response.status_code == 200:
        soup = BeautifulSoup(response.content, 'html.parser')
        novel_content = soup.find(id=id)
        if novel_content:
            pdf_filename = f"{pdf_name}.pdf"
            c = canvas.Canvas(pdf_filename, pagesize=letter)
            c.setFont("Helvetica", 12)
            
            # Define padding values
            top_padding = 30
            left_padding = 30
            right_padding = 30
            bottom_padding = 30
            
            content_text = novel_content.get_text(separator='\n')
            
            lines = content_text.split('\n')
            
            y_position = 800 - top_padding
            for line in lines:
                if y_position < bottom_padding:
                    c.showPage()
                    y_position = 800 - top_padding
                
                words = line.split()
                wrapped_line = ''
                for word in words:
                    if c.stringWidth(wrapped_line + ' ' + word) < 500 - left_padding - right_padding:
                        wrapped_line += ' ' + word
                    else:
                        c.drawString(left_padding, y_position, wrapped_line.strip())
                        y_position -= 20
                        wrapped_line = word
                if wrapped_line:
                    c.drawString(left_padding, y_position, wrapped_line.strip())
                    y_position -= 20
                
            c.save()
            print(f"PDF file saved: {pdf_filename}")
        else:
            print(f"No content with id '{id}' found on {url}")
    else:
        print(f"Failed to retrieve content from {url}. Status code: {response.status_code}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Save webpage content as PDF')
    parser.add_argument('url', type=str, help='URL of the webpage to scrape')
    parser.add_argument('id', type=str, help='ID of the content to extract')
    parser.add_argument('pdf_name', type=str, help='Name of the PDF file to save')
    args = parser.parse_args()

    save_content_as_pdf(args.url, args.id, args.pdf_name)
