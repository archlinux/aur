import csv
from bs4 import BeautifulSoup
import sys

try:
    with open('/home/spacingbat3/coverage.html', 'r') as f:
        soup = BeautifulSoup(f.read(), 'html.parser')

    with open('/home/spacingbat3/coverage.csv', 'w', newline='') as f:
        writer = csv.writer(f)
        
        headers = []
        for th in soup.find_all('th'):
            headers.append(''.join(th.stripped_strings))
        writer.writerow(headers)
        
        for tr in soup.find('tbody').find_all('tr'):
            row = []
            for td in tr.find_all('td'):
                row.append(''.join(td.stripped_strings))
            writer.writerow(row)
    print("Success")
except Exception as e:
    print(e)
