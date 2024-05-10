import sys
from PyPDF2 import PdfReader
import os
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import letter

def extract_text_from_pdf(pdf_path):
    text = ""
    with open(pdf_path, 'rb') as file:
        pdf_reader = PdfReader(file)
        for page in pdf_reader.pages:
            text += page.extract_text()
    return text

def create_pdf_with_text(output_pdf_path, text):
    c = canvas.Canvas(output_pdf_path, pagesize=letter)
    y_position = 750
    line_height = 12
    max_lines_per_page = 50
    padding = 20
    lines = text.split('\n')
    current_line = 0

    for line in lines:
        if y_position < 50:
            c.showPage()
            c.setFont("Helvetica", 12)
            y_position = 750
            current_line = 0

        if current_line < max_lines_per_page:
            c.drawString(50, y_position, line[:90])  # Adjust the number of characters displayed per line
            y_position -= line_height + padding
            current_line += 1

    c.save()

if __name__ == "__main__":
    if len(sys.argv) < 4:
        print("Usage: python pdf_text_extractor.py <input_pdf_file> <output_pdf_file> <target_language>")
        print("Example: python pdf_text_extractor.py input.pdf output.pdf en")
        print("Target Language Codes:")
        print("  en - English")
        print("  fr - French")
        print("  es - Spanish")
        sys.exit(1)

    input_pdf_path = sys.argv[1]
    output_pdf_path = sys.argv[2]
    target_language = sys.argv[3]

    text = extract_text_from_pdf(input_pdf_path)
    
    # Save translated text to a temporary text file
    temp_text_file = "temp_text_file.txt"
    with open(temp_text_file, 'w') as file:
        file.write(text)
    
    # Create PDF with text from the temporary text file
    command = f"trans -b :{target_language} -i {temp_text_file} -o {temp_text_file}_translated"
    os.system(command)

    # Read the translated text from the temporary text file
    with open(temp_text_file + "_translated", 'r') as translated_file:
        translated_text = translated_file.read()

    # Create PDF with translated text
    create_pdf_with_text(output_pdf_path, translated_text)

    # Delete temporary files
    os.remove(temp_text_file)
    os.remove(temp_text_file + "_translated")

    print("------------------")
    print("Your PDF is ready")
