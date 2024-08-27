import argparse
import requests
from bs4 import BeautifulSoup
import weasyprint
import os

def save_content_as_pdf(url, pdf_name, id=None, class_name=None, exclude_classes=None):
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'
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
        

def save_and_delete_images(url, pdf_name, id=None, class_name=None, exclude_classes=None):
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'
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

            image_tags = content.find_all('img')
            
            save_folder = pdf_name
            image_filenames = []
            
            if not os.path.exists(save_folder):
                os.makedirs(save_folder)

            for idx, img_tag in enumerate(image_tags):
                img_url = img_tag.get('src')
                
                img_response = requests.get(img_url)
                if img_response.status_code == 200:
					#save images
                    img_filename = os.path.join(save_folder, f"image_{idx}.jpg")
                    #save name to array
                    image_filenames.append(img_filename)
                    
                    with open(img_filename, "wb") as file:
                        file.write(img_response.content)
                    print(f"Image downloaded and saved successfully: {img_filename}")
                else:
                    print("Failed to download the image. Status code:", img_response.status_code)

            # After saving all images, create a PDF using the 'convert' command in Linux

            # Use the 'convert' command to create a PDF from images in the folder
            image_files_str = " ".join(image_filenames)
            convert_command = f"magick {image_files_str} {pdf_name}.pdf"
            print(image_files_str)
            # Run the convert command using os.system
            os.system(convert_command)

            print(f"PDF file created from images: {pdf_name}")
        else:
            print(f"No content found based on the provided ID or class on {url}")
    else:
        print(f"Failed to retrieve content from {url}. Status code: {response.status_code}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Save webpage content as PDF or images')

    parser.add_argument('url', type=str, help='URL of the webpage to scrape')
    parser.add_argument('--id', type=str, help='ID of the content to extract')
    parser.add_argument('--class', dest='class_name', type=str, help='Class name of the content to extract')
    parser.add_argument('--exclude', nargs='+', help='Class names of elements to exclude')
    parser.add_argument('--comic-mode', action='store_true', help='Save images and pdf them (like a real comic or manga)')
    parser.add_argument('pdf_name', type=str, help='Name of the PDF file to save')

    args = parser.parse_args()

    if args.comic_mode:
        save_and_delete_images(args.url, args.pdf_name, args.id, args.class_name, args.exclude)
    else:
        save_content_as_pdf(args.url, args.pdf_name, args.id, args.class_name, args.exclude)
