import org.eclipse.swt.*;
import org.eclipse.swt.browser.*;
import org.eclipse.swt.layout.*;
import org.eclipse.swt.widgets.*;
import org.eclipse.swt.graphics.Color;
import org.eclipse.swt.custom.CTabFolder;
import org.eclipse.swt.custom.CTabItem;
import org.eclipse.swt.custom.StackLayout;
import java.io.File;
import java.util.ArrayList;

public class WeeklyBrowse {
    private static String searchBase = "https://www.google.com/search?q=";
    private static ArrayList<String[]> bookmarks = new ArrayList<>();
    private static Composite bookmarksBar;
    private static GridData bmData;

    public static void main(String[] args) {
        var display = new Display();
        var shell = new Shell(display);
        shell.setText("WeeklyBrowse");
        shell.setSize(1200, 800);

        Color ieGrey = display.getSystemColor(SWT.COLOR_WIDGET_BACKGROUND);
        Color white = display.getSystemColor(SWT.COLOR_WHITE);
        shell.setBackground(white);

        var shellLayout = new GridLayout(1, false);
        shellLayout.marginHeight = 0;
        shellLayout.marginWidth = 0;
        shellLayout.verticalSpacing = 0; 
        shell.setLayout(shellLayout);

        // --- 1. TABS ---
        var folder = new CTabFolder(shell, SWT.TOP | SWT.FLAT);
        folder.setLayoutData(new GridData(SWT.FILL, SWT.TOP, true, false));
        folder.setSimple(true);
        folder.setBorderVisible(false);
        folder.setBackground(ieGrey);
        folder.setSelectionBackground(white);

        // --- 2. SMART BOOKMARKS BAR ---
        bookmarksBar = new Composite(shell, SWT.NONE);
        bmData = new GridData(SWT.FILL, SWT.TOP, true, false);
        bmData.heightHint = 0; 
        bmData.exclude = true;
        bookmarksBar.setLayoutData(bmData);
        bookmarksBar.setBackground(white);
        var bmLayout = new RowLayout(SWT.HORIZONTAL);
        bmLayout.marginTop = 2;
        bmLayout.marginLeft = 10;
        bookmarksBar.setLayout(bmLayout);

        // --- 3. ADDRESS BAR ROW ---
        var toolbar = new Composite(shell, SWT.NONE);
        toolbar.setLayoutData(new GridData(SWT.FILL, SWT.TOP, true, false));
        toolbar.setBackground(white);
        var navLayout = new GridLayout(5, false);
        navLayout.marginHeight = 5;
        toolbar.setLayout(navLayout);

        var backBtn = new Button(toolbar, SWT.PUSH | SWT.FLAT);
        backBtn.setText(" ← "); 

        var urlBar = new Text(toolbar, SWT.BORDER);
        urlBar.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false));

        var searchBox = new Text(toolbar, SWT.BORDER);
        var searchData = new GridData(SWT.RIGHT, SWT.CENTER, false, false);
        searchData.widthHint = 180;
        searchBox.setLayoutData(searchData);

        var addTabBtn = new Button(toolbar, SWT.PUSH | SWT.FLAT);
        addTabBtn.setText(" + ");

        var settingsBtn = new Button(toolbar, SWT.PUSH | SWT.FLAT);
        settingsBtn.setText(" ⚙ ");

        var contentStack = new Composite(shell, SWT.NONE);
        contentStack.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, true));
        var stackLayout = new StackLayout();
        contentStack.setLayout(stackLayout);

        // UI Update for Bookmarks
        Runnable refreshBookmarks = () -> {
            for (Control c : bookmarksBar.getChildren()) c.dispose();
            if (bookmarks.isEmpty()) {
                bmData.heightHint = 0;
                bmData.exclude = true;
            } else {
                bmData.heightHint = 32;
                bmData.exclude = false;
                for (String[] bm : bookmarks) {
                    var btn = new Button(bookmarksBar, SWT.PUSH | SWT.FLAT);
                    btn.setText("★ " + bm[0]);
                    btn.addListener(SWT.Selection, e -> ((Browser) folder.getSelection().getData("browser")).setUrl(bm[1]));
                }
            }
            bookmarksBar.setVisible(!bookmarks.isEmpty());
            shell.layout(true, true);
        };

        Runnable createTab = () -> {
            var item = new CTabItem(folder, SWT.NONE);
            item.setText("New Tab");
            Browser b = new Browser(contentStack, SWT.NONE);
            item.setData("browser", b);

            b.addLocationListener(new LocationAdapter() {
                @Override
                public void changed(LocationEvent event) {
                    if (folder.getSelection() == item) {
                        urlBar.setText(event.location);
                        urlBar.forceFocus();
                        urlBar.selectAll();
                    }
                    if (!event.location.contains("newtab.html")) {
                        item.setText(b.getUrl().length() > 15 ? b.getUrl().substring(0, 15) : b.getUrl());
                    }
                }
            });

            folder.setSelection(item);
            stackLayout.topControl = b;
            contentStack.layout();
            File file = new File("newtab.html");
            b.setUrl("file://" + file.getAbsolutePath());
        };

        // --- GLOBAL FILTERS (FIXED CTRL+W) ---
        display.addFilter(SWT.KeyDown, event -> {
            boolean control = (event.stateMask & SWT.CTRL) != 0;
            if (control) {
                switch (event.keyCode) {
                    case 'l':
                        urlBar.forceFocus();
                        urlBar.selectAll();
                        break;
                    case 'd':
                        var b = (Browser) folder.getSelection().getData("browser");
                        bookmarks.add(new String[]{folder.getSelection().getText(), b.getUrl()});
                        refreshBookmarks.run();
                        break;
                    case 't':
                        createTab.run();
                        break;
                    case 'w':
                        if (folder.getItemCount() > 1) {
                            var item = folder.getSelection();
                            var browser = (Browser) item.getData("browser");
                            browser.dispose();
                            item.dispose();
                            // Re-sync UI after close
                            var newActive = (Browser) folder.getSelection().getData("browser");
                            stackLayout.topControl = newActive;
                            urlBar.setText(newActive.getUrl());
                            contentStack.layout();
                            urlBar.forceFocus();
                            urlBar.selectAll();
                        } else {
                            shell.close();
                        }
                        break;
                }
            }
        });

        folder.addListener(SWT.Selection, e -> {
            var b = (Browser) folder.getSelection().getData("browser");
            stackLayout.topControl = b;
            urlBar.setText(b.getUrl());
            contentStack.layout();
            urlBar.forceFocus();
            urlBar.selectAll();
        });

        addTabBtn.addListener(SWT.Selection, e -> createTab.run());
        urlBar.addListener(SWT.DefaultSelection, e -> {
            String input = urlBar.getText().trim();
            ((Browser)folder.getSelection().getData("browser")).setUrl(input.startsWith("http") ? input : "http://" + input);
        });

        createTab.run();
        shell.open();
        while (!shell.isDisposed()) {
            if (!display.readAndDispatch()) display.sleep();
        }
        display.dispose();
    }
}
