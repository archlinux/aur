import atexit
import os
from datetime import datetime
from reportlab.lib.pagesizes import A4
from reportlab.lib import colors
from reportlab.lib.units import cm
from reportlab.lib.styles import ParagraphStyle
from reportlab.platypus import SimpleDocTemplate, Table, TableStyle, Paragraph, Spacer, PageBreak
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from config import _, APPNAME, WERSJA, PRODUCENT

# --- MECHANIZM SPRZĄTANIA PLIKÓW TYMCZASOWYCH ---
PDF_FILES_TO_CLEAN = []

def cleanup_generated_files():
    """Usuwa tymczasowe pliki PDF wygenerowane podczas sesji."""
    for file_path in PDF_FILES_TO_CLEAN:
        try:
            if os.path.exists(file_path):
                os.remove(file_path)
        except Exception:
            pass

atexit.register(cleanup_generated_files)

class PDFReportGenerator:
    def __init__(self):
        self.font_name = "Helvetica"
        self.fonts_registered = False

    def register_system_font(self):
        if self.fonts_registered: return
        font_candidates = [
            "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf",
            "/usr/share/fonts/liberation/LiberationSans-Regular.ttf",
            "/usr/share/fonts/noto/NotoSans-Regular.ttf",
            "C:\\Windows\\Fonts\\arial.ttf"
        ]
        for path in font_candidates:
            if os.path.exists(path):
                try:
                    pdfmetrics.registerFont(TTFont('CustomFont', path))
                    bold_path = path.replace(".ttf", "").replace("-Regular", "") + "-Bold.ttf" if "Regular" in path else path
                    if os.path.exists(bold_path):
                        pdfmetrics.registerFont(TTFont('CustomFont-Bold', bold_path))
                    else:
                        pdfmetrics.registerFont(TTFont('CustomFont-Bold', path))
                    self.font_name = 'CustomFont'
                    break
                except: continue
        self.fonts_registered = True

    def generate(self, filename, title, transactions, prev_balance=0.0, chart_img_buffer=None, liabilities_status=None, accounts_data=None):
        from config import _
        self.register_system_font()
        if liabilities_status is None: liabilities_status = []
        if accounts_data is None: accounts_data = []

        doc = SimpleDocTemplate(
            filename,
            pagesize=A4,
            rightMargin=1.5*cm, leftMargin=1.5*cm,
            topMargin=1.5*cm, bottomMargin=2*cm
        )

        elements = []

        # Style
        title_style = ParagraphStyle('TitleStyle', fontName=self.font_name, fontSize=20, textColor=colors.HexColor("#2c3e50"), spaceAfter=10)
        normal_style = ParagraphStyle('NormalStyle', fontName=self.font_name, fontSize=10, spaceAfter=5)
        desc_style = ParagraphStyle('DescStyle', fontName=self.font_name, fontSize=8, leading=10)
        header_table_style = ParagraphStyle('HTStyle', fontName=self.font_name, fontSize=11, spaceBefore=10, spaceAfter=8, fontWeight='BOLD')
        sub_desc_style = ParagraphStyle('SubDescStyle', fontName=self.font_name, fontSize=7, textColor=colors.grey, leading=8)

        # --- 1. NAGŁÓWEK ---
        elements.append(Paragraph(title.upper(), title_style))
        elements.append(Paragraph(f"{_('Data wygenerowania')}: {datetime.now().strftime('%Y-%m-%d %H:%M')}", normal_style))
        elements.append(Spacer(1, 0.25*cm))

        # --- 2. OBLICZENIA I AGREGACJA STATYSTYK ---
        incomes, expenses = {}, {}
        acc_names_map = {acc[0]: acc[1] for acc in accounts_data}

        total_inc = 0.0
        total_exp = 0.0
        debt_repayments_sum = 0.0
        total_lia_repayments = 0.0
        savings_sum = 0.0

        transactions.sort(key=lambda x: x[1])

        for row in transactions:
            t_type, t_cat, t_amt = row[2], row[3], row[5]

            # LICZYMY TYLKO STATYSTYKI MIESIĘCZNE.
            # NIE dotykamy sald kont (accounts_data), bo one są już gotowe i poprawne!
            if t_type == "income":
                incomes[t_cat] = incomes.get(t_cat, 0.0) + t_amt
                total_inc += t_amt
            elif t_type == "debtor_repayment":
                debt_repayments_sum += t_amt
                total_inc += t_amt
            elif t_type == "expense":
                expenses[t_cat] = expenses.get(t_cat, 0.0) + t_amt
                total_exp += t_amt
            elif t_type in ["savings", "goal_deposit"]:
                savings_sum += t_amt
                total_exp += t_amt
            elif t_type == "liability_repayment":
                total_lia_repayments += t_amt
                total_exp += t_amt
            elif t_type == "savings_migration":
                # Migracja to transfer. Do statystyki oszczędności dodajemy tylko gdy > 0 (wpływ na cel),
                # ale NIE doliczamy do total_exp, żeby nie psuć bilansu portfela.
                if t_amt > 0:
                    savings_sum += t_amt

        # Zmienne dla podsumowania (Naprawa NameError)
        final_inc_sum = total_inc + prev_balance
        net_balance = final_inc_sum - total_exp

        # --- STRONA 1: STAN POSZCZEGÓLNYCH KONT ---
        elements.append(Paragraph(_("STAN POSZCZEGÓLNYCH KONT (NA KONIEC OKRESU)"), header_table_style))
        data_acc = [[_("Konto / Portfel"), _("Saldo")]]

        # WYŚWIETLAMY DOKŁADNIE TO, CO WYLICZYŁO BUDGET-APP.PY
        # Żadnej dodatkowej matematyki tutaj!
        for acc in accounts_data:
            data_acc.append([str(acc[1]), f"{acc[2]:.2f} zł"])

        t_acc = Table(data_acc, colWidths=[12*cm, 4*cm])
        t_acc.setStyle(self._get_table_style(colors.HexColor("#34495e")))
        elements.append(t_acc)
        elements.append(Spacer(1, 0.25*cm))

        # --- PODSUMOWANIE PRZYCHODÓW ---
        elements.append(Paragraph(_("PODSUMOWANIE PRZYCHODÓW / WPŁYWÓW"), header_table_style))
        data_inc = [[_("Źródło"), _("Kwota")]]
        data_inc.append([_("Z poprzedniego miesiąca"), f"{prev_balance:.2f} zł"])
        for cat, val in incomes.items():
            data_inc.append([cat, f"{val:.2f} zł"])
        if debt_repayments_sum > 0:
            data_inc.append([_("Zwroty od dłużników"), f"{debt_repayments_sum:.2f} zł"])

        data_inc.append([_("ŁĄCZNA DOSTĘPNA KWOTA"), f"{final_inc_sum:.2f} zł"])

        t_inc = Table(data_inc, colWidths=[12*cm, 4*cm])
        t_inc.setStyle(self._get_table_style(colors.HexColor("#27ae60")))
        elements.append(t_inc)
        elements.append(Spacer(1, 0.5*cm))

        # BILANS KOŃCOWY
        bilans_text = f"<b>{_('SALDO KOŃCOWE')}: {net_balance:.2f} PLN</b>"
        bilans_color = colors.darkgreen if net_balance >= 0 else colors.red
        elements.append(Paragraph(bilans_text, ParagraphStyle('Bilans', fontName=self.font_name, fontSize=14, alignment=1, textColor=bilans_color)))

        elements.append(PageBreak())

        # --- STRONA 2: WYDATKI ---
        elements.append(Paragraph(title.upper() + " - " + _("WYDATKI"), title_style))
        elements.append(Spacer(1, 0.25*cm))

        elements.append(Paragraph(_("PODSUMOWANIE WYDATKÓW / ROZCHODÓW"), header_table_style))
        data_exp = [[_("Kategoria"), _("Kwota")]]
        for cat, val in expenses.items():
            data_exp.append([cat, f"{val:.2f} zł"])
        if savings_sum > 0:
            data_exp.append([_("Przekazano na oszczędności"), f"{savings_sum:.2f} zł"])
        if total_lia_repayments > 0:
            data_exp.append([_("Spłata zobowiązań"), f"{total_lia_repayments:.2f} zł"])
        data_exp.append([_("SUMA ROZCHODÓW"), f"{total_exp:.2f} zł"])

        t_exp = Table(data_exp, colWidths=[12*cm, 4*cm])
        t_exp.setStyle(self._get_table_style(colors.HexColor("#c0392b")))
        elements.append(t_exp)

        # Powtórzenie bilansu dla czytelności
        elements.append(Spacer(1, 0.8*cm))
        bilans_op_text = f"<b>{_('BILANS MIESIĘCZNY (Suma środków - Wydatki)')}: {net_balance:.2f} PLN</b>"
        elements.append(Paragraph(bilans_op_text, ParagraphStyle('BilansOp', fontName=self.font_name, fontSize=14, alignment=1, textColor=bilans_color)))

        elements.append(PageBreak())

        # --- STRONA 3: REJESTR (IDENTYCZNA KOLEJNOŚĆ 1:1 Z BAZĄ/DASHBOARDEM) ---
        elements.append(Paragraph(_("PEŁNY REJESTR TRANSAKCJI"), title_style))

        headers = [_("ID"), _("Data"), _("Typ / Konto"), _("Kategoria"), _("Opis"), _("Kwota")]
        data_all = [headers]

        type_m = {
            'income': _('Wpływ'), 'expense': _('Wydatek'), 'savings': _('Oszcz.'),
            'savings_migration': _('Transfer'), 'goal_deposit': _('Na Cel'),
            'liability_repayment': _('Spłata'), 'debtor_repayment': _('Zwrot długu')
        }

        # 1. FILTROWANIE: Wyrzucamy zera
        valid_transactions = [t for t in transactions if abs(t[5]) >= 0.01]

        # 2. SORTOWANIE: Od najstarszej (data) i według kolejności dodania (id)
        # To gwarantuje, że 5 transakcji z tego samego dnia będzie w tej samej kolejności co w tabeli
        valid_transactions.sort(key=lambda x: (x[1], x[0]))

        # 3. PĘTLA GENERUJĄCA WIERSZE
        for i, row in enumerate(valid_transactions):
            main_type = type_m.get(row[2], row[2])
            acc_name = acc_names_map.get(row[8], "-") if len(row) > 8 else "-"

            # Komórka Typ / Konto
            type_cell = [
                Paragraph(main_type, desc_style),
                Paragraph(f"<font color='grey'>{acc_name}</font>", sub_desc_style)
            ]

            # Opis (row[4]) + Szczegóły (row[6])
            main_desc = row[4] if row[4] else "-"
            sub_details = str(row[6]).replace('\n', ', ').strip(', ') if len(row) > 6 and row[6] else ""

            desc_cell = [Paragraph(main_desc, desc_style)]
            if sub_details:
                desc_cell.append(Paragraph(f"<i>{sub_details}</i>", sub_desc_style))

            # NUMERACJA: Idzie od 1 do X (zgodnie z kolejnością na liście)
            display_id = str(i + 1)

            data_all.append([
                display_id,         # Nr porządkowy w raporcie
                row[1],             # Data
                type_cell,          # Typ / Konto
                row[3],             # Kategoria
                desc_cell,          # Opis + Szczegóły
                f"{row[5]:.2f}"     # Kwota
            ])

        # colWidths i TableStyle pozostają bez zmian dla zachowania czytelności
        t_details = Table(data_all, colWidths=[1.0*cm, 2.2*cm, 2.5*cm, 3.2*cm, 6.6*cm, 2.5*cm], repeatRows=1)
        t_details.setStyle(TableStyle([
            ('FONTNAME', (0, 0), (-1, -1), self.font_name),
            ('FONTSIZE', (0, 0), (-1, 0), 10),
            ('FONTSIZE', (0, 1), (-1, -1), 8),
            ('BACKGROUND', (0, 0), (-1, 0), colors.HexColor("#2c3e50")),
            ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
            ('GRID', (0, 0), (-1, -1), 0.5, colors.grey),
            ('VALIGN', (0, 0), (-1, -1), 'TOP'),
            ('ALIGN', (0, 0), (0, -1), 'CENTER'),
            ('ALIGN', (5, 0), (5, -1), 'RIGHT'),
        ]))
        elements.append(t_details)

        doc.build(elements, onFirstPage=self._add_footer, onLaterPages=self._add_footer)
        return True

    def _get_table_style(self, header_color):
        return TableStyle([
            ('FONTNAME', (0, 0), (-1, -1), self.font_name),
            ('BACKGROUND', (0, 0), (-1, 0), header_color),
            ('TEXTCOLOR', (0, 0), (-1, 0), colors.white),
            ('GRID', (0, 0), (-1, -1), 0.5, colors.grey),
            ('ALIGN', (1, 0), (1, -1), 'RIGHT'),
            ('FONTSIZE', (0, 0), (-1, -1), 10),
            ('BOTTOMPADDING', (0, 0), (-1, -1), 4),
            ('TOPPADDING', (0, 0), (-1, -1), 4),
        ])

    def _add_footer(self, canvas, doc):
        canvas.saveState()
        canvas.setFont(self.font_name, 8)
        canvas.setFillColor(colors.grey)
        canvas.line(1.5*cm, 1.2*cm, A4[0]-1.5*cm, 1.2*cm)
        footer_text = f"{APPNAME} {WERSJA} | © {PRODUCENT} {datetime.now().year}"
        canvas.drawString(1.5*cm, 0.8*cm, footer_text)
        page_num = f"{_('Strona')} {doc.page}"
        canvas.drawRightString(A4[0]-1.5*cm, 0.8*cm, page_num)
        canvas.restoreState()

class ShoppingPDFGenerator:
    def __init__(self):
        self.font_name = "Helvetica"
        self._register_polish_font()

    def _register_polish_font(self):
        candidates = [
            "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf",
            "/usr/share/fonts/liberation/LiberationSans-Regular.ttf",
            "/usr/share/fonts/truetype/freefont/FreeSans.ttf",
            r"C:\Windows\Fonts\arial.ttf",
            r"C:\Windows\Fonts\calibri.ttf",
            "/Library/Fonts/Arial.ttf",
            "/System/Library/Fonts/Helvetica.ttc"
        ]
        for path in candidates:
            if os.path.exists(path):
                try:
                    pdfmetrics.registerFont(TTFont('CustomFont', path))
                    self.font_name = 'CustomFont'
                    return
                except Exception: continue

    def generate(self, filename, list_name, items):
        from collections import defaultdict
        from reportlab.lib.pagesizes import A4
        from reportlab.pdfgen import canvas
        from reportlab.lib.units import cm
        from config import _

        c = canvas.Canvas(filename, pagesize=A4)
        width, height = A4
        LABEL_OTHER = _("POZOSTAŁE")

        grouped_items = defaultdict(list)
        for prod, qty, store in items:
            key = store if store and store.strip() else LABEL_OTHER
            grouped_items[key].append((prod, qty))

        sorted_stores = sorted([k for k in grouped_items.keys() if k != LABEL_OTHER])
        if LABEL_OTHER in grouped_items:
            sorted_stores.append(LABEL_OTHER)

        margin_left = 1.0 * cm
        margin_right = 1.0 * cm
        margin_top = 1.0 * cm
        margin_bottom = 1.5 * cm

        usable_width = width - margin_left - margin_right
        col_width = usable_width / 4
        col_gap = 0.2 * cm
        effective_col_width = col_width - col_gap

        y_top = height - margin_top

        c.setFont(self.font_name, 10)
        header_text = list_name.upper()
        text_w = c.stringWidth(header_text, self.font_name, 10)

        col_1_center = margin_left + (effective_col_width / 2)
        c.drawString(col_1_center - (text_w / 2), y_top, header_text)
        c.line(col_1_center - (text_w / 2), y_top - 2, col_1_center + (text_w / 2), y_top - 2)

        y_start_list = y_top - 0.8 * cm
        current_y = y_start_list
        current_col = 0
        row_height = 0.5 * cm
        header_height = 0.6 * cm
        box_size = 8
        dot_width = c.stringWidth(".", self.font_name, 9)

        def check_space(needed_height):
            nonlocal current_y, current_col
            if current_y - needed_height < margin_bottom:
                current_col += 1
                current_y = y_start_list
                if current_col > 3:
                    c.showPage()
                    c.setFont(self.font_name, 9)
                    current_col = 0
                    current_y = height - margin_top
                return True
            return False

        for store_name in sorted_stores:
            store_items = grouped_items[store_name]
            check_space(header_height + row_height + 0.2*cm)
            col_x_start = margin_left + (current_col * col_width)
            c.setFont(self.font_name, 9)
            c.drawString(col_x_start, current_y - 0.3*cm, store_name.upper())
            sw = c.stringWidth(store_name.upper(), self.font_name, 9)
            c.setLineWidth(0.5)
            c.line(col_x_start, current_y - 0.35*cm, col_x_start + sw, current_y - 0.35*cm)
            current_y -= (header_height + 0.15 * cm)

            c.setFont(self.font_name, 9)
            for prod_raw, qty_raw in store_items:
                check_space(row_height)
                col_x_start = margin_left + (current_col * col_width)
                col_x_end = col_x_start + effective_col_width
                prod_text = prod_raw.upper()
                qty_text = qty_raw.lower()
                c.setLineWidth(1)
                c.rect(col_x_end - box_size, current_y, box_size, box_size, fill=0)
                qty_w = c.stringWidth(qty_text, self.font_name, 9)
                qty_x = col_x_end - box_size - 4
                c.drawRightString(qty_x, current_y + 1, qty_text)
                max_text_width = qty_x - col_x_start - 5
                display_prod = prod_text
                while c.stringWidth(display_prod, self.font_name, 9) > max_text_width and len(display_prod) > 0:
                    display_prod = display_prod[:-1]
                c.drawString(col_x_start, current_y + 1, display_prod)
                prod_end_x = col_x_start + c.stringWidth(display_prod, self.font_name, 9) + 2
                qty_start_x = qty_x - qty_w - 2
                if qty_start_x > prod_end_x:
                    space = qty_start_x - prod_end_x
                    if space > 0:
                        num_dots = int(space / dot_width)
                        c.drawString(prod_end_x, current_y + 1, "." * num_dots)
                current_y -= row_height
            current_y -= 0.1 * cm
        c.save()
