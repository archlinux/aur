{ Main form application }
unit main;

{$mode objfpc}{$H+}

interface



uses
  AsyncQueue, Classes, SysUtils, DB, BufDataset, Forms, Controls, Graphics,
  Dialogs, DBCtrls, dbf, SQLite3Conn, SQLDB, process, FileUtil,
  SynHighlighterHTML, SynEdit, DBDateTimePicker, StdCtrls, ExtCtrls, ComCtrls,
  Menus, DBGrids, ActnList, Buttons, ExtDlgs, blcksock, sockets, Synautil,
  synaip, synsock, ftpsend, db_helpers, db_insertdemo, db_create_tables,
  replacers, editor_in_window, editor_css, editor_js, DateUtils, fgl, regexpr,
  types_for_app, selectorTagsPages, const_for_app, selectors_for_menu,
  RenderHtml, httpsend,  storing_attachments, FontSettings,
  IniFiles, selection_history_dialog, selection_history_manager,
  emoji_shortcodes, func_str_composition; {Use Synaptic}






type




  { ServerThread }



  { TForm1 }

  TForm1 = class(TForm)
    acEditorForSectionNote: TAction;
    acEditorForSectionFullText: TAction;
    acEditorForBlockMarkup: TAction;
    acEditorForHeadTemplate: TAction;
    acEditorForBodyTemplate: TAction;
    acEditorForRubricSectionTemplate: TAction;
    acEditorForRubricItemTemplate: TAction;
    acActionsForMenu: TActionList;
    acFindContentByCaption: TAction;
    acDatabaseOpen: TAction;
    acDatabaseSaveAs: TAction;
    acSaveSpecialSettings: TAction;
    acRestoreSpecialSetting: TAction;
    acBuildSite: TAction;
    acSetFont: TAction;
    acSwitchToRusLocale: TAction;
    acSwitchToEngLocale: TAction;
    acSwitchToEspLocale: TAction;
    acSwitchToChLocale: TAction;
    acSwitchToKoreanLocale: TAction;
    acCutText: TAction;
    acPasteText: TAction;
    alContextActions: TActionList;
    actsEditors: TActionList;
    btFtpUpdate: TButton;
    btnAttachTagToMaterial: TButton;
    btnEditorContent: TButton;
    btnJoin: TButton;
    btnLoadFromWysiwyg: TButton;
    btnOpenWithWysiwyg: TButton;
    btnRemoveAssocTag: TButton;
    btnRemoveOneTag: TButton;
    btStartServer: TButton;
    btStopServer: TButton;
    Buffer: TMemo;
    btnMakeArchive: TButton;
    btnLoad: TButton;
    btnEditorForSectionNote: TButton;
    btnEditorForSectionFullText: TButton;
    btnEditorForBlockMarkup: TButton;
    btnEditorHeadTemplate: TButton;
    btnEditorBodyPagesTemplate: TButton;
    BtnEditorBodySectionsTemplate: TButton;
    btnEditorTemplateOfItem: TButton;
    btnEditorCssOpen: TButton;
    btnEditorJs: TButton;
    btnPublishToGithubPages: TButton;
    btnRefreshTree: TButton;
    btnAlterTableAddField: TButton;
    btnGetCustomFields: TButton;
    btnRemoveCustomField: TButton;
    btnSelectZipArchive: TButton;
    btnUploadWithBridge: TButton;
    btnSetImage: TButton;
    btnSetAttachment: TButton;
    btnGetAttachment: TButton;
    cboLocale: TComboBox;
    chkUseTrees: TCheckBox;
    chkUseModules: TCheckBox;
    chkGetBlocksFromFile: TCheckBox;
    choicePreset: TDBLookupComboBox;
    ds_Attachments: TDataSource;
    dbeAttachmentId: TDBEdit;
    dbeAttachmentCaption: TDBEdit;
    dbImage: TDBImage;
    dbNav_Attachments: TDBNavigator;
    ds_Images: TDataSource;
    DBDateTimePicker1: TDBDateTimePicker;
    dbeImageCaption: TDBEdit;
    dbeImageId: TDBEdit;
    dbePageField1: TDBEdit;
    dbePageField2: TDBEdit;
    dbePageField3: TDBEdit;
    dbePageField4: TDBEdit;
    dbePageField5: TDBEdit;
    dbePageField6: TDBEdit;
    dbePageField7: TDBMemo;
    dbeTree: TDBEdit;
    dbeMenuItemMenuId: TDBEdit;
    dbeMenuItemType: TDBEdit;
    dbeMenuItemCaption: TDBEdit;
    dbGridPages: TDBGrid;
    dbNav_Images: TDBNavigator;
    dbNav_Content: TDBNavigator;
    dbSelectorTag: TDBLookupComboBox;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    ds_MenuItem: TDataSource;
    ds_Menu: TDataSource;
    dbeItemMenuId: TDBEdit;
    dbeItemMenuLinkedWith: TDBEdit;
    dbeMenuId: TDBEdit;
    dbeMenuCaption: TDBEdit;
    dbmMenuTpl: TDBMemo;
    dbmMenuItemTpl: TDBMemo;
    dbNav_MenuItems: TDBNavigator;
    dbNav_Menus: TDBNavigator;
    ds_TagsOnPage: TDataSource;
    dbmTagsTemplate: TDBMemo;
    dbmItemTagTemplate: TDBMemo;
    ds_Tags_Pages: TDataSource;
    dbeTagsPages_id_tag_page: TDBEdit;
    dbeTagsPages_id_tag: TDBEdit;
    dbeTagsPages_id_page: TDBEdit;
    dbNav_TagsPages: TDBNavigator;
    ds_Tags: TDataSource;
    dbeTagId: TDBEdit;
    dbeTagCaption: TDBEdit;
    dbNav_Tags: TDBNavigator;
    dbOrder_Field_Set: TDBComboBox;
    dbOrder_Field: TDBComboBox;
    ds_JsScripts: TDataSource;
    dbeJsScriptId: TDBEdit;
    dbeScriptPath: TDBEdit;
    dbmJsScriptFile: TDBMemo;
    dbNav_JsScripts: TDBNavigator;
    ds_CssStyles: TDataSource;
    dbeCssPath: TDBEdit;
    dbeCssId: TDBEdit;
    dbmCssStyle: TDBMemo;
    dbmSectionFullText: TDBMemo;
    dbNav_Css: TDBNavigator;
    ds_Rubrication: TDataSource;
    dgCounter: TDBGrid;
    ds_Counter: TDataSource;
    ds_Join: TDataSource;
    dbJoin: TDBGrid;
    edGithubPagesPath: TEdit;
    edFieldName: TEdit;
    edFieldType: TEdit;
    edBridgeURL: TEdit;
    edAPIKey: TEdit;
    edListenerUrl: TEdit;
    edPathToZip: TEdit;
    edLocalWysigygServer: TEdit;
    fCaption: TDBEdit;
    fContent: TDBMemo;
    fID: TDBEdit;
    ImageList1: TImageList;
    Label1: TLabel;
    Label12: TLabel;
    lbIsFileUploaded: TLabel;
    lbAttachmentCaption: TLabel;
    lbAttachmentId: TLabel;
    lbAttachmentsList: TLabel;
    lbImageData: TLabel;
    lbImageCaption: TLabel;
    lbImageId: TLabel;
    lbImagesNavigation: TLabel;
    lbDetails: TLabel;
    lbListenerURL: TLabel;
    lbBridgeURL: TLabel;
    lbBridgeAPIKey: TLabel;
    lbPathToZip: TLabel;
    Label4: TLabel;
    lbAttachTagToPage: TLabel;
    lbCategory: TLabel;
    lbDt: TLabel;
    lbFieldsList: TLabel;
    lbFieldName: TLabel;
    lbFieldType: TLabel;
    lbTagsOnPageTab: TLabel;
    lbTreeStructure: TLabel;
    lbTree: TLabel;
    lbMenuItemMenuID: TLabel;
    lbMenuItemType: TLabel;
    lbMenuItemID: TLabel;
    lbMenuItemCaption: TLabel;
    lbMenuItem_LinkFor: TLabel;
    lbMenuItems: TLabel;
    lbMenuId: TLabel;
    lbMenuCaption: TLabel;
    lbMenuTpl: TLabel;
    lbMenuItemTpl: TLabel;
    lbTagsTemplate: TLabel;
    lbItemTagTempate: TLabel;
    lbTagsPages_Page_Tag: TLabel;
    lbTagsPages_Tag_Id: TLabel;
    lbTagsPages: TLabel;
    lbTagsPages_Id_tag_page: TLabel;
    lbTagId: TLabel;
    lbTagCaption: TLabel;
    lbTags: TLabel;
    lbGithubPagesPath: TLabel;
    lbOrderSet: TLabel;
    lbOrderField: TLabel;
    lbProgress: TLabel;
    lbJsScriptId: TLabel;
    lbJsScriptPath: TLabel;
    lbScriptFile: TLabel;
    lbCssPath: TLabel;
    lbCSS_id: TLabel;
    lbCssStyle: TLabel;
    lbCSS: TLabel;
    lbSpecification: TLabel;
    listFields: TListBox;
    listTags: TListBox;
    lvAttachments: TListView;
    lvImages: TListView;
    lvContent: TListView;
    lvMenuItems: TListView;
    lvTagsPages: TListView;
    lvTags: TListView;
    lvJsScripts: TListView;
    lvCSS: TListView;
    lvPresets: TListView;
    lvBlocks: TListView;
    lvSections: TListView;
    mnuPasteText: TMenuItem;
    mnuCutText: TMenuItem;
    mnuKoreanLocale: TMenuItem;
    mnuChineseLocale: TMenuItem;
    mnuSpanishLocale: TMenuItem;
    mnuRussianLocale: TMenuItem;
    mnuEnglishLocale: TMenuItem;
    mnuLocalizations: TMenuItem;
    mnuSetFont: TMenuItem;
    mnuInterface: TMenuItem;
    mnuBuildProject: TMenuItem;
    mnuProject: TMenuItem;
    mmDetails: TMemo;
    mnuSpecialSettings: TMenuItem;
    mnuSaveSpecialSettings: TMenuItem;
    mnuRestoreSpecialSettings: TMenuItem;
    mnuDatabase: TMenuItem;
    mnuOpenDataBase: TMenuItem;
    mnuSaveDataBase: TMenuItem;
    mnuFinder: TMenuItem;
    mnuFind: TMenuItem;
    mmRubrics: TMemo;
    OpenDialog1: TOpenDialog;
    OpenDialog2: TOpenDialog;
    opdSelectPicture: TOpenPictureDialog;
    opdSelectFileAsAttachment: TOpenDialog;
    PageControl1: TPageControl;
    PageControl3: TPageControl;
    PageControl4: TPageControl;
    panCSSList: TPanel;
    panCSSElements: TPanel;
    Panel1: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    panAttachmentNav: TPanel;
    panAttachmentForm: TPanel;
    panAttachmentsActions: TPanel;
    panImageActions: TPanel;
    panImageView: TPanel;
    panImagesNavigation: TPanel;
    panImages: TPanel;
    Panel29: TPanel;
    Panel6: TPanel;
    panPageMainProps: TPanel;
    panPagePropsContainer: TPanel;
    panPageFormView: TPanel;
    Panel18: TPanel;
    Panel24: TPanel;
    Panel26: TPanel;
    panFieldsList: TPanel;
    panAddField: TPanel;
    panMenuProps: TPanel;
    panMenuItems: TPanel;
    panMenusList: TPanel;
    panMenus: TPanel;
    panLvTagsPages: TPanel;
    panTagPagesForm: TPanel;
    panTagsForm: TPanel;
    panJoinAction: TPanel;
    panProgress: TPanel;
    panJsProps: TPanel;
    panJs: TPanel;
    panJoin: TPanel;
    pBar: TProgressBar;
    ds_Content: TDataSource;
    ds_Presets: TDataSource;
    ds_Blocks: TDataSource;
    ds_Sections: TDataSource;
    dbeBlockId: TDBEdit;
    dbeUserField1: TDBEdit;
    dbeUserField2: TDBEdit;
    dbeUserField3: TDBEdit;
    dbeUserField4: TDBEdit;
    dbeUserField5: TDBEdit;
    dbePreset: TDBEdit;
    dbeUserField6: TDBEdit;
    dbeUserField7: TDBEdit;
    dbeSiteName: TDBEdit;
    dbeSiteDirectory: TDBEdit;
    dbeSectionId: TDBEdit;
    dbeSectionCaption: TDBEdit;
    dbeBlockNote: TDBMemo;
    dbeBlockHtml: TDBMemo;
    dbmHeadTemplate: TDBMemo;
    dbmBodyPagesTemplate: TDBMemo;
    dbmSectionNote: TDBMemo;
    dbmBodySectionsTemplate: TDBMemo;
    dbmTemplateOfItem: TDBMemo;
    dbNav_Blocks: TDBNavigator;
    dbNav_Presets: TDBNavigator;
    dbNav_Sections: TDBNavigator;
    edFtpIP: TEdit;
    edFtpPassword: TEdit;
    edFtpPort: TEdit;
    edFtpUsername: TEdit;
    edFileManager: TEdit;
    edArchiveName: TEdit;
    edIpAddress: TEdit;
    edPort: TEdit;
    edPathToBuild: TEdit;
    edItemsPerPage: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    lbIpAddress: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    lbConnectionLog: TLabel;
    lbPort: TLabel;
    lbArchiveName: TLabel;
    lbPathToBuild: TLabel;
    lbFileManager: TLabel;
    lbItemsPerPage: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    mmFtpLog: TMemo;
    PageControl2: TPageControl;
    Panel10: TPanel;
    Panel11: TPanel;
    panUserFields: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    panWebServer: TPanel;
    panServActions: TPanel;
    Panel25: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    pmContextMenu: TPopupMenu;
    PrefferedExtension: TComboBox;
    conn: TSQLite3Connection;
    SaveDialog1: TSaveDialog;
    svdGetFromDatabase: TSaveDialog;
    selSection: TDBLookupComboBox;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    sqlContent: TSQLQuery;
    sqlJoin: TSQLQuery;
    sqlCounter: TSQLQuery;
    sqlCssStyles: TSQLQuery;
    sqlJsScripts: TSQLQuery;
    sqlGetTagsForPage: TSQLQuery;
    sqlMenu: TSQLQuery;
    sqlMenuItem: TSQLQuery;
    sqlGetAllImages: TSQLQuery;
    sqlGetAllAttachments: TSQLQuery;
    sqlTagsPages: TSQLQuery;
    sqlTags: TSQLQuery;
    sqlRubrication: TSQLQuery;
    tabJoin: TTabSheet;
    tabCSS: TTabSheet;
    tabJs: TTabSheet;
    tabMenus: TTabSheet;
    TabSheet1: TTabSheet;
    TabSheet11: TTabSheet;
    TabSheet12: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    tabMainProps: TTabSheet;
    tabEditorProps: TTabSheet;
    tabImages: TTabSheet;
    tabAttachments: TTabSheet;
    tabUploadingWithBridge: TTabSheet;
    tabTagsTemplate: TTabSheet;
    tabItemTagTemplate: TTabSheet;
    tabTagsPages: TTabSheet;
    tabTags: TTabSheet;
    temp_sql: TSQLQuery;
    trans: TSQLTransaction;
    sqlSections: TSQLQuery;
    sqlBlocks: TSQLQuery;
    sqlPresets: TSQLQuery;
    TabSheet13: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    mnuMainMenu: TMainMenu;
    Panel16: TPanel;
    Panel17: TPanel;
    tabUpdateByFTP: TTabSheet;
    tabSpecial: TTabSheet;
    mmAbout: TMemo;
    AppPages: TPageControl;
    Panel12: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Process1: TProcess;
    tabPages: TTabSheet;
    tabWebServer: TTabSheet;
    tabCommonSettings: TTabSheet;
    tabHelp: TTabSheet;
    tabGlobalBlocks: TTabSheet;
    tabSections: TTabSheet;
    tvContent: TTreeView;
    tvSections: TTreeView;
    WebServerLog: TMemo;
    ZipArchiverCommand: TEdit;


    { --------------------------------------------------------- }
    { Группа обработчиков, описывающая действия }
    { Часть обработчиков нужна для вызова окон с редактором }


    { Действие для открытия базы данных }
    procedure acCutMarkupExecute(Sender: TObject);
    procedure acCutTextExecute(Sender: TObject);
    procedure acDatabaseOpenExecute(Sender: TObject);

    { Действие для сохранения базы под новым именем }
    procedure acDatabaseSaveAsExecute(Sender: TObject);

    { Действие для открытия разметки в редакторе }
    procedure acEditorForBlockMarkupExecute(Sender: TObject);

    { Действие для открытия в редакторе шаблона Body }
    procedure acEditorForBodyTemplateExecute(Sender: TObject);

    { Действие для открытия в редактора шаблона Head }
    procedure acEditorForHeadTemplateExecute(Sender: TObject);

    { Действие для открытия в редакторе шаблона элемента рубрики }
    procedure acEditorForRubricItemTemplateExecute(Sender: TObject);

    { Действие для открытия в редактора шаблона тела рубрики }
    procedure acEditorForRubricSectionTemplateExecute(Sender: TObject);

    { Действие для открытия в редакторе подробного описания }
    procedure acEditorForSectionFullTextExecute(Sender: TObject);

    { Действие для открытия в редакторе заметки к рубрике }
    procedure acEditorForSectionNoteExecute(Sender: TObject);

    { Выполняет поиск в базе по заголовку }
    procedure acFindContentByCaptionExecute(Sender: TObject);
    procedure acPasteTextExecute(Sender: TObject);

    { Действие для восстановления специальных настроек }
    procedure acRestoreSpecialSettingExecute(Sender: TObject);

    { Сохраняет специальные настройки программы}
    procedure acSaveSpecialSettingsExecute(Sender: TObject);
    procedure acBuildSiteExecute(Sender: TObject);
    procedure acSetFontExecute(Sender: TObject);
    procedure acSwitchToChLocaleExecute(Sender: TObject);
    procedure acSwitchToEngLocaleExecute(Sender: TObject);
    procedure acSwitchToEspLocaleExecute(Sender: TObject);
    procedure acSwitchToKoreanLocaleExecute(Sender: TObject);
    procedure acSwitchToRusLocaleExecute(Sender: TObject);

    procedure AppPagesChange(Sender: TObject);


    { Обработчик нажатия на кнопку выгрузить по FTP }
    procedure btFtpUpdateClick(Sender: TObject);

    { Обработчик для кнопки добавить новое поле }
    procedure btnAlterTableAddFieldClick(Sender: TObject);

    { Обработчик кнопки добавить новый материал }
    procedure btnAttachTagToMaterialClick(Sender: TObject);

    { Обработчик кнопки открыть окно редактора CSS }
    procedure btnEditorCssOpenClick(Sender: TObject);

    { Обработчик кнопки открыть редактор JavaScript }
    procedure btnEditorJsClick(Sender: TObject);
    procedure btnGetAttachmentClick(Sender: TObject);

    { Обработчик кнопки получить пользовательские поля }
    procedure btnGetCustomFieldsClick(Sender: TObject);

    {  }
    procedure btnJoinClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);


    { Обработчик кнопки получить из WYSIWYG редактора }
    procedure btnLoadFromWysiwygClick(Sender: TObject);

    { Обработчик кнопки открыть в WYSIWYG редакторе }
    procedure btnOpenWithWysiwygClick(Sender: TObject);

    { Обрабатывает нажатие на кнопку опубликовать на Github }
    procedure btnPublishToGithubPagesClick(Sender: TObject);

    { Обработка удаления дерева }
    procedure btnRefreshTreeClick(Sender: TObject);

    { Обработчик для удаления ассоцированного тега }
    procedure btnRemoveAssocTagClick(Sender: TObject);

    { Обработчик для удаления пользовательской колонки }
    procedure btnRemoveCustomFieldClick(Sender: TObject);

    { Обработчик для удаления оддного тега }
    procedure btnRemoveOneTagClick(Sender: TObject);

    { Обработчик для выбора Zip архива }
    procedure btnSelectZipArchiveClick(Sender: TObject);

    { Обработчик для загрузки в базу вложения}
    procedure btnSetAttachmentClick(Sender: TObject);

    { Обработчик для загрузки в базу изображения}
    procedure btnSetImageClick(Sender: TObject);

    { Обработчик кнопки выгрузки zip архива через мост}
    procedure btnUploadWithBridgeClick(Sender: TObject);


    { Обработчик кнопки запуска лок. сервера }
    procedure btStartServerClick(Sender: TObject);

    { Обработчик кнопки останова лок. сервера }
    procedure btStopServerClick(Sender: TObject);


    { Обработчик кнопки создания архива}
    procedure btnMakeArchiveClick(Sender: TObject);


    { Обработчик кнопки вызова редактора контента}
    procedure btnEditorContentClick(Sender: TObject);


    { Обработчик смены списка языка программы }
    procedure cboLocaleChange(Sender: TObject);
    procedure dbeBlockHtmlEnter(Sender: TObject);
    procedure dbmBodyPagesTemplateEnter(Sender: TObject);
    procedure dbmBodySectionsTemplateEnter(Sender: TObject);
    procedure dbmCssStyleEnter(Sender: TObject);
    procedure dbmHeadTemplateEnter(Sender: TObject);
    procedure dbmItemTagTemplateEnter(Sender: TObject);
    procedure dbmJsScriptFileEnter(Sender: TObject);

    { Обработчик смены текста в полном описании раздела }
    procedure dbmSectionFullTextChange(Sender: TObject);
    procedure dbmSectionFullTextEnter(Sender: TObject);
    procedure dbmTagsTemplateEnter(Sender: TObject);
    procedure dbmTemplateOfItemEnter(Sender: TObject);
    procedure dbNav_AttachmentsClick(Sender: TObject; Button: TDBNavButtonType);
    procedure dbNav_ImagesBeforeAction(Sender: TObject; Button: TDBNavButtonType
      );




    { ----------------------------------------------- }


    { Группы обработчиков связанных с навигацией }


    procedure dbNav_MenuItemsClick(Sender: TObject; Button: TDBNavButtonType);
    procedure dbNav_ContentBeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure dbNav_BlocksBeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure dbNav_CssBeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure dbNav_PresetsBeforeAction(Sender: TObject;
      Button: TDBNavButtonType);
    procedure dbNav_SectionsBeforeAction(Sender: TObject;
      Button: TDBNavButtonType);
    procedure fContentEnter(Sender: TObject);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of string);



    procedure lbFieldTypeClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure lvAttachmentsClick(Sender: TObject);

    { --------------------------------------------------------------- }

    { Группа действий связанная с выбором определенного элемента в списке
    ListView слева на каждой вкладке }



    { Выполнится при щелчке по названию блока }
    procedure lvBlocksClick(Sender: TObject);

    { Выполнится при щелчке по названию страницы }
    procedure lvContentClick(Sender: TObject);

    { Выполнится при щелчке по названию CSS таблицы}
    procedure lvCSSClick(Sender: TObject);
    procedure lvImagesClick(Sender: TObject);

    { Выполнится при щелчке по названию JavaScript}
    procedure lvJsScriptsClick(Sender: TObject);

    { Выполнится при щелчке по пункту меню}
    procedure lvMenuItemsClick(Sender: TObject);

    { Выполнится при щелчке при выборе настройки }
    procedure lvPresetsClick(Sender: TObject);

    { Выполнится при щелчке при выборе раздела }
    procedure lvSectionsClick(Sender: TObject);
    procedure mnuCutTextClick(Sender: TObject);

    { Выпоняется при щелчке по списку полей }
    procedure panFieldsListClick(Sender: TObject);

    { ----------------------------------------------------------- }

    { Перерисовывает список элементов меню}
    procedure redrawLvMenuItems();


    { Перестраивает деревья }
    procedure refreshTrees();

    { Перестраивает дерево страниц }
    procedure refreshContentTree();

    { Перестраивает дерево разделов }
    procedure refreshSectionTree();






    { Выполнится при закрытии основного окна программы }
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);

    { Выполнится при создании основного окна программы }
    procedure FormCreate(Sender: TObject);


    { Выполнится при щелчке на конкретный тег в списке }
    procedure lvTagsClick(Sender: TObject);

    { Выполнится при щелчке по опредленному тегу в списке отношений }
    procedure lvTagsPagesClick(Sender: TObject);

    { Выполнится при щелчке на панели JS}
    procedure panJsClick(Sender: TObject);

    { --------------------------------------------- }
    {  Запросы связанные с изменениями в интерфейсе
    в связи с добавлением-удалением данных }


    procedure sqlBlocksAfterPost(DataSet: TDataSet);
    procedure sqlBlocksBeforeDelete(DataSet: TDataSet);
    procedure sqlContentAfterDelete(DataSet: TDataSet);
    procedure sqlContentAfterEdit(DataSet: TDataSet);
    procedure sqlContentAfterInsert(DataSet: TDataSet);


    procedure sqlContentAfterPost(DataSet: TDataSet);
    procedure sqlContentBeforeDelete(DataSet: TDataSet);




    procedure sqlCssStylesAfterPost(DataSet: TDataSet);
    procedure sqlCssStylesBeforeDelete(DataSet: TDataSet);
    procedure sqlCssStylesBeforeRefresh(DataSet: TDataSet);
    procedure sqlGetAllAttachmentsAfterDelete(DataSet: TDataSet);
    procedure sqlGetAllAttachmentsAfterEdit(DataSet: TDataSet);
    procedure sqlGetAllAttachmentsAfterInsert(DataSet: TDataSet);
    procedure sqlGetAllAttachmentsAfterPost(DataSet: TDataSet);
    procedure sqlGetAllAttachmentsBeforeDelete(DataSet: TDataSet);
    procedure sqlGetAllAttachmentsBeforeRefresh(DataSet: TDataSet);

    procedure sqlGetAllImagesAfterDelete(DataSet: TDataSet);
    procedure sqlGetAllImagesAfterEdit(DataSet: TDataSet);

    procedure sqlGetAllImagesAfterPost(DataSet: TDataSet);
    procedure sqlGetAllImagesBeforeDelete(DataSet: TDataSet);


    procedure sqlJsScriptsAfterPost(DataSet: TDataSet);
    procedure sqlJsScriptsBeforeDelete(DataSet: TDataSet);
    procedure sqlJsScriptsBeforeRefresh(DataSet: TDataSet);
    procedure sqlMenuAfterScroll(DataSet: TDataSet);
    procedure sqlMenuBeforeRefresh(DataSet: TDataSet);
    procedure sqlMenuItemBeforeEdit(DataSet: TDataSet);
    procedure sqlMenuItemBeforeInsert(DataSet: TDataSet);
    procedure sqlMenuItemBeforeRefresh(DataSet: TDataSet);

    procedure sqlPresetsAfterPost(DataSet: TDataSet);
    procedure sqlPresetsBeforeDelete(DataSet: TDataSet);
    procedure sqlPresetsBeforeRefresh(DataSet: TDataSet);
    procedure sqlSectionsAfterDelete(DataSet: TDataSet);
    procedure sqlSectionsAfterEdit(DataSet: TDataSet);
    procedure sqlSectionsAfterInsert(DataSet: TDataSet);

    procedure sqlSectionsAfterPost(DataSet: TDataSet);
    procedure sqlSectionsBeforeDelete(DataSet: TDataSet);
    procedure sqlTagsAfterPost(DataSet: TDataSet);
    procedure sqlTagsBeforeDelete(DataSet: TDataSet);
    procedure sqlTagsBeforeRefresh(DataSet: TDataSet);
    procedure sqlTagsPagesAfterPost(DataSet: TDataSet);
    procedure sqlTagsPagesBeforeDelete(DataSet: TDataSet);
    procedure sqlTagsPagesBeforeRefresh(DataSet: TDataSet);




  private
    { private declarations }
  public
    { public declarations }

    {Менеджер буфера обмена}
    SelectionHistoryManager  : TSelectionHistoryManager;

    {Последний получивший фокус элемент управления}
    lastFocusedControl : TControl;

    { Имя файла, в котором хранится база }
    db_filename : String;

    { Список названий страниц }
    Titles : TMemo;

    { Список URL для страниц }
    Urls : TMemo;

    { Список разделов сайта }
    Sections: TMemo;

    { Словарь для отношения теги - страницы }
    PagesTree : sdict;

    { Список URL для разделов }
    SiteSectionUrls : TMemo;

    { Список URL для заголовков разделов }
    SiteSectionTitles: TMemo;

    { Хранит отношение раздел сайта - иерархия }
    SiteSectionTree : sdict;

    { Список имен CSS }
    CssTitles   : TStringList;

    { Список имен JS}
    JsTitles    : TStringList;

    { Отображение для тегов}
    Tags        : sdict;

    { Словарь для связи теги - страницы}
    mTagsPages  : TagsPagesMap;

    { Словарь для связи id изображения - название изображения}
    Images      : sdict;

    { Словарь для связи id вложения - название вложения}
    Attachments : sdict;


    { Какое порядок используется для сортировки }
    POrs   : sdict;

    { Какое поле используется для сортировки }
    POrf   : sdict;


    { Список доступных настроек }
    SitePresets : TMemo;

    { Список SQL запросов }
    sqls : sqls_list;

    { Сокеты для сетевых соединений }
    ListenerSocket, ConnectionSocket: TTCPBlockSocket;

    { Список глобальных блоков }
    Blocks : TStringList;

    { Кеш - для веб сервера }
    Cache : tStringList;


    PostsEditorState : String;

    rubrication_start : String;

    { Хранит специальные настройки программы }
    special_settings : TSpecial_Settings;


    { Очередь для записи файлов}
    Writer : TFilesQueue;


    { новая инициализация  }
    procedure initdbSQL();

    { Собирает Head у страиницы по шаблону }
    function buildHead(title: string; headTemplate: string): string;

    { Собирает Body у страницы по шаблону}
    function buildBody(title: string; body: string; bodyTemplate: string): string;

    { Применяет глобальные блоки к шаблону }
    function useBlocks(part: string): string;


    { ----------------------------------------------}

    { Сканирование используется для наполнения списков ListView
    и для генерации сайтов, так  как заполняются вспомогательные структуры
    данных. По сути сканирование сводится выборке всех элементов из опред.
    таблиц }

    { Сканирование страниц }
    procedure scanLinks();

    { Сканирование разделов }
    procedure scanSections();

    { Сканирование каскадных таблиц }
    procedure scanCss();

    { Сканирование отношения теги - страницы }
    procedure scanTagsPages();

    { Сканирование вложений }
    procedure scanAttachments();

    { ----------------------------------------------}



    { Вставляет быстрые ссылки на страницы }
    function insLinks(body: string): string;

    { Вставляет быстрые ссылки на разделы }
    function insSections(body: string): string;

    { Отображает теги на странице с данным id}
    procedure showTagsOnPage(id : string);




    { Выполняет запуск модуля и возвращает результат его выполнения }
    function moduleexec(cmd: string): string;

    { Задействует пресет для шаблона }
    function usePreset(app : String) : string;

    { Применяет модуль к шаблону}
    function useModules(app: string): string;

    {Выполняет запуск обработчика пользовательского тега}
    function owntagexec(container, cmd: string): string;

    { Применяет к шаблону пользовательские теги}
    function useOwnTags(app: string): string;

    { Построитель отдельной страницы }
    function buildItem(itemtpl: string; itemUrl: string; itemTitle: string; itemDt : TDateTime; ur : user_records; tree : String; tags_html : String): string;

    { Построитель раздела }
    function buildSection(sectiontpl: string; sectionUrl: string;
      sectionTitle: string;
      sectionNote: string;
      sectionFullText : string;
      items: string): string;

    { Построитель переключения страниц }
    function buildPagination(
      url: string; currentPage: byte;
      pagesTotal: integer;
      orf       : String;
      ors       : String;
      useO      : Boolean;
      useTrees : boolean; tree : String
      ): string;

    { Обработчик подключений к локальному серверу}
    procedure AttendConnection(ASocket: TTCPBlockSocket);

    { Пуск локального веб-сервера }
    procedure StartOwnServer();

    { Остановка локального веб-сервера}
    procedure StopOwnServer();


    function OutputHTMLFile(uri: string): string;

    { Применяет к шаблону html пользовательские поля }
    function buildOwnFields(html: string; p : page_params): string;


    { Возвращает предпочитаемое расширение }
    function prefExtension(lin: string): string;

    { Меняет интерфейс на русский }
    procedure localeRUS();

    { Меняет интерфейс на английский }
    procedure localeENG();

    { Меняет интерфейс на испанский }
    procedure localeESP();

    { Меняет интерфейс на китайский }
    procedure localeCn();

    { Меняет интерфейс на корейский}
    procedure localeKp();

    { Применяет к шаблону переключатель страниц }
    function Pager(layout: String; pages: String): String;

    { Применяет к шаблону меню }
    function useMenus(app : String) : String;

    { Применяет к шаблону быстрые ссылки на картинки }
    function useImages(template : String) : String;

    { Применяет к шаблону быстрые ссылки на вложения }
    function useAttachments(template : String) : String;




    { Выполняет инициализацию базы данных, то есть создает структуру в новом
    файле }
    procedure initTransactionSQL();


    { ------------------------------------------------------- }

    { Просмотр базы }

    { Делает источники данных активными }
    procedure makeSqlActive();

    { Делает источники данных неактивными }
    procedure makeSqlInactive();

    { Выполняет запрос для получения списка всех страниц }
    procedure viewPagesSQL();

    { Выполняет запрос для получения списка всех разделов }
    procedure viewSectionsSQL();

    { Выполняет запрос для получения всех глобальных блоков }
    procedure viewBlocksSQL();

    { Выполняет запрос для получения всех настроек (пресетов) }
    procedure viewPresetsSQL();

    { Выполняет запрос для получения всех каскадных таблиц }
    procedure viewCssSQL();

    { Выполняет запрос для получения всех javascript }
    procedure viewJsSQL();


    { Выполняет запросы для получения тегов }
    procedure viewTagsSQL();

    { Выполняет запрос для получения отношения теги - страницы }
    procedure viewTagsPagesSQL();

    { Выполняет запрос для получениях всех меню }
    procedure viewMenuSQL();

    { Выполняет запрос для получения пунктов меню }
    procedure viewMenuItemSQL();

    { Выполняет запрос для получения прикрепленных изображений }
    procedure viewImagesSQL();


    { Выполняет запрос для получения прикрепленных изображений }
    procedure viewAttachmentsSQL();


    { Единая точка для выполнения всех запросов на просмотр }
    procedure viewTablesSQL();


    { ------------------------------------------------------- }

    { Переназначения datasource }

    { Переназначение datasource для таблицы content - страницы }
    procedure changeDataSourcesContent();

    { Переназначение datasource для таблицы section - разделы}
     procedure changeDataSourcesSections();

    { Переназначение datasource для таблицы block - глоб. блоки}
     procedure changeDataSourcesBlocks();

    { Переназначение datasource для таблицы preset - нач. настройки сайта}
     procedure changeDataSourcesPresets();

    { Переназначение datasource для таблицы css - таблицы стилей}
     procedure changeDataSourcesCss();

    { Переназначение datasource для таблицы Tags}
     procedure changeDataSourcesTags();

    { Переназначение datasource для таблицы Tags_Pages - отношение страница - теги}
     procedure changeDataSourcesTagsPages();

    { Переназначение datasource у таблицы js }
     procedure changeDataSourcesJs();


    { Переназначает datasource для таблицы images }
     procedure changeDataSourcesImages();

    { Переназначает datasource для таблицы attachments }
     procedure changeDataSourcesAttachments();




     { Для всех переназначений }
     procedure changeDataSources();

     { ------------------------------------------------------- }

     { Заполнение демо данными }
     procedure makeCreationTables();




     { Используется для сообщений для отладки }
     procedure SilentMessage(msg : String);

     { Автоматическое сохранение базы данных}
     procedure AutoSaveDb();

     { НОВАЯ ВЕРСИЯ СБОРКИ СТРАНИЦ }
     procedure doJoinPages();

     { Собирает страницу с параметрами page и именем filenam}
     procedure  makePageJoin(page : page_params; filenam : String );


     { Обработчик для сборки разделов }
     procedure doSections();


     { Обработчик для сборки карты сайта }
     procedure doSitemap();

     { Обработчик для сборки страницы со списком всех тегов }
     procedure doTagsMap();


     { Вставляет секции и разделы в строку }
     function insertSectionsAndLinks(str : string) : string;

     { Сканирует глобальные блоки }
     procedure scanBlocks();

     { Scan table preset }
     procedure scanPresets();

     { Scan table tags }
     procedure scanTags();

     { Scan table images for /images/ }
     procedure scanImages();




     { All scan actions, place here scan procedures }
     procedure doScan();



     {  Показывает окно редактора  }
     procedure editor_win_show(var sql : TSQLQuery; field : String );

     { Обработчик для таблиц стилей }
     procedure doCssTables();

     { Сканирует таблицу с javascript }
     procedure scanJs();

     { Обработчик таблиц javascript }
     procedure doJs();



     { Обработчик для прикрепленных изображений }
     procedure doImages();

     { Обработчик для вложенных файлов }
     procedure doAttachments();


     { Вставляет параметры в Head из page }
     function insParamsToHead(head: String; page : page_params): String;

     { Вставляет параметры page в Body}
     function insParamsToBody(body: String; page : page_params): String;

     { Получает ссылку на раздел }
     function getSortSelector(section : String; tree : String) : String;


     { Создает отсортированную рубрикацию }
     procedure makeRubricationUsingSorts(page : Integer; itemsPerPage : Integer; pagesInRubrics : Integer;
       rubrication_query: String; selected_orf : String; selected_ors : String; useo : boolean);


     { Действия ПОСЛЕ добавления для изменения списка lv }
     procedure AfterPostHelper(var lv : TListView; var sql : TSQLQuery; field : String);

    { Действия ПОСЛЕ удаления для изменения списка lv }
    procedure BeforeDeleteHelper(var lv : TListView; var sql : TSQLQuery; field : String);


    { Действия при щелчке по списку для выбора определенной строки }
    procedure listViewClickHelper(var lv : TListView; var sql : TSQLQuery; field : String);

    { Вставляет статьи в указанный узел }
    procedure insertArticlesToNode(var Node : TTreeNode; section : String);

    { Обновляет пользовательские колонки}
    procedure updateCustomColumns();

    { Добавляет пользовательскую колонки у указанным именем и типом }
    procedure addCustomColumn(field_name, field_type : String);

    { Удаляет пользовательскую колонку }
    procedure deleteCustomColumn(field_name : String);

    { Для применения к шаблону пользовательских полей }
    function useCustomFields(  template : String; page_id : String) : String;

    { Выполняет запрос к удаленному источнику }
    function remotes_urls(app : String) : String;

    { Сохраняет в файл специальные настройки}
    procedure SaveSpecialSettings(path : String);

    { Восстанавливает из файла специальные настройки }
    procedure RestoreSpecialSettings(path : String);

    { Считывает специальные настройки из интерфейса }
    procedure loadfromui_special_setting();

    { Обновляет у элементов управления настройки согласно заданным }
    procedure updateui_special_setting();



    { Загрузка в базу файла }
    procedure setAttachment();

    { Выгрузка из базы }
    procedure getAttachment();

    {Отображает статус загрузки вложения}
    procedure displayAttachmentStatus();

    {Сборка сайта, будет вызвано в действии}
    procedure actionBuildSite();

    {Выбор шрифта}
    procedure actionSetFont();

    {Назначает шрифты}
    procedure setFontsToUI(SomeFont : TFont);

    {Начальная установка шрифтов}
    procedure initFontsState();

    {Загрузка перевода из INI файла}
    procedure loadLocaleFromIni(FileName : String);

    {Сохранение перевода в INI файл}
    procedure saveLocaleToIni(FileName : String);

    {Применение эмодзи}
    function useEmojies(s: String): String;







       end;










var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
   index : Integer;
   Control : TControl;
begin
  SelectionHistoryManager := TSelectionHistoryManager.Create();

  LastFocusedControl := nil;
  initFontsState();

if not FileExists('special_settings.dat')  then
      form1.SaveSpecialSettings('special_settings.dat')
  else
      begin
      form1.RestoreSpecialSettings('special_settings.dat');
      form1.loadfromui_special_setting();
      end;
  SiteSectionTree:=sdict.Create;
  PagesTree:=sdict.Create;

  rubrication_start:=sqlRubrication.SQL.Text;

  form1.initdbSQL();

  Cache:=TStringList.Create;

  dbNav_Content.DataSource.AutoEdit := True;
  dbNav_Content.Enabled := True;

 // dbNav_Css.DataSource.AutoEdit := True;
 // dbNav_Css.Enabled := True;

  Titles := TMemo.Create(Self); // Заголовки
  Urls := TMemo.Create(Self); // URL страниц
  Sections := TMemo.Create(Self); // Разделы страниц
  CssTitles:=TStringList.Create;
  JsTitles:=TStringList.Create;

  Tags:=sdict.Create;
  mTagsPages:=TagsPagesMap.Create;

  POrf := sdict.create();
  POrs := sdict.create();

  Images:= sdict.create();
  Attachments:=sdict.create();


  SiteSectionUrls := TMemo.Create(Self); // URL разделов
  SiteSectionTitles := TMemo.Create(Self); // Заголовки разделов
  blocks:=TStringList.Create();
  sitePresets:=TMemo.Create(Self);

  doScan();
  edPathToBuild.Text:=GetEnvironmentVariable('HOME')+'/mysite';



end;

procedure TForm1.lvTagsClick(Sender: TObject);
var tag_id : String;
begin
  listViewClickHelper(lvTags, sqlTags, 'tag_id');
end;

procedure TForm1.lvTagsPagesClick(Sender: TObject);
begin
  ListViewClickHelper(lvTagsPages, sqlTagsPages, 'id_tag_page');
end;

procedure TForm1.panJsClick(Sender: TObject);
begin

end;






procedure TForm1.sqlBlocksAfterPost(DataSet: TDataSet);
begin
  AfterPostHelper(lvBlocks, sqlBlocks, 'id');
end;

procedure TForm1.sqlBlocksBeforeDelete(DataSet: TDataSet);
begin
  beforedeletehelper(lvBlocks, sqlblocks, 'id');
end;

procedure TForm1.sqlContentAfterDelete(DataSet: TDataSet);
begin

  form1.refreshContentTree();
end;

procedure TForm1.sqlContentAfterEdit(DataSet: TDataSet);
begin
   form1.refreshContentTree();
end;

procedure TForm1.sqlContentAfterInsert(DataSet: TDataSet);
begin
  form1.refreshContentTree();
end;







procedure TForm1.sqlContentAfterPost(DataSet: TDataSet);
var content_id : String; i : Integer; flag : boolean;
begin
 AfterPostHelper(lvContent, sqlContent, 'id');
end;

procedure TForm1.sqlContentBeforeDelete(DataSet: TDataSet);

begin
  BeforeDeleteHelper(lvContent, sqlContent, 'id');
end;



procedure TForm1.sqlCssStylesAfterPost(DataSet: TDataSet);
begin
  AfterPostHelper(lvCSS,  sqlCssStyles, 'css_id');
end;

procedure TForm1.sqlCssStylesBeforeDelete(DataSet: TDataSet);
begin
  BeforeDeleteHelper(lvCSS, sqlCssStyles, 'css_id');
end;

procedure TForm1.sqlCssStylesBeforeRefresh(DataSet: TDataSet);
begin
  sqlCssStyles.ApplyUpdates;
end;

procedure TForm1.sqlGetAllAttachmentsAfterDelete(DataSet: TDataSet);
begin

end;

procedure TForm1.sqlGetAllAttachmentsAfterEdit(DataSet: TDataSet);
begin

 if not Assigned(Attachments) then Exit;

 Attachments.Clear;
 lvAttachments.Items.Clear;
 sqlGetAllAttachments.First;
 while not sqlGetAllAttachments.EOF do
   begin
          Images.Add( sqlGetAllAttachments.FieldByName('image_id').asString,
                      sqlGetAllAttachments.FieldByName('image_caption').asString);
          lvAttachments.AddItem(sqlGetAllAttachments.FieldByName('image_id').AsString, nil);
           sqlGetAllAttachments.Next;
       end;

 sqlGetAllAttachments.ApplyUpdates;
 sqlGetAllAttachments.Refresh;
  displayAttachmentStatus();
end;

procedure TForm1.sqlGetAllAttachmentsAfterInsert(DataSet: TDataSet);

begin

  displayAttachmentStatus();



end;

procedure TForm1.sqlGetAllAttachmentsAfterPost(DataSet: TDataSet);
begin
  AfterPostHelper(lvAttachments, sqlGetAllAttachments, 'attachment_id');
  displayAttachmentStatus();



end;

procedure TForm1.sqlGetAllAttachmentsBeforeDelete(DataSet: TDataSet);
begin
   BeforeDeleteHelper(lvAttachments, sqlGetAllAttachments, 'attachment_id');
end;

procedure TForm1.sqlGetAllAttachmentsBeforeRefresh(DataSet: TDataSet);
begin
   sqlGetAllAttachments.ApplyUpdates();
end;




procedure TForm1.sqlGetAllImagesAfterDelete(DataSet: TDataSet);
begin
 if not Assigned(Images) then Exit;

 Images.Clear;
 lvImages.Items.Clear;
 sqlGetAllImages.First;
 while not sqlGetAllImages.EOF do
   begin
          Images.Add( sqlGetAllImages.FieldByName('image_id').asString,
                      sqlGetAllImages.FieldByName('image_caption').asString);
          lvImages.AddItem(sqlGetAllImages.FieldByName('image_id').AsString, nil);
           sqlGetAllImages.Next;
       end;

 sqlGetAllImages.ApplyUpdates;
 sqlGetAllImages.Refresh;
end;

procedure TForm1.sqlGetAllImagesAfterEdit(DataSet: TDataSet);
var
  Image_Caption : String;
  Image_Id : String;
begin
  lvImages.Items.Clear;
  Images.Clear;

  sqlGetAllImages.First;
  while not sqlGetAllImages.EOF do
    begin
           Image_id := sqlGetAllImages.FieldByName('image_id').AsString;
           Image_caption := sqlGetAllImages.FieldByName('image_caption').AsString;
           Images.Add(image_id, image_caption);
           lvImages.AddItem( Image_id, nil);
      sqlGetAllImages.Next;
    end;




  sqlGetAllImages.ApplyUpdates;
  sqlGetAllImages.Refresh;


  sqlGetAllImages.First;
end;



procedure TForm1.sqlGetAllImagesAfterPost(DataSet: TDataSet);
begin
  AfterPostHelper(lvImages, sqlGetAllImages, 'image_id');


end;

procedure TForm1.sqlGetAllImagesBeforeDelete(DataSet: TDataSet);
begin
  BeforeDeleteHelper(lvImages, sqlGetAllImages, 'image_id');
end;



procedure TForm1.sqlJsScriptsAfterPost(DataSet: TDataSet);
begin
  AfterPostHelper(lvJsScripts, sqlJsScripts, 'js_id');
end;

procedure TForm1.sqlJsScriptsBeforeDelete(DataSet: TDataSet);
begin
  BeforeDeleteHelper(lvJsScripts, sqlJsScripts, 'js_id');
end;

procedure TForm1.sqlJsScriptsBeforeRefresh(DataSet: TDataSet);
begin
  sqlJsScripts.ApplyUpdates;
end;

procedure TForm1.sqlMenuAfterScroll(DataSet: TDataSet);
var new_request : String;
begin
  new_request:='select * from menu_item where menu_item_menu_id="'+
  sqlMenu.FieldByName('menu_id').AsString+'"';
  //showMessage(new_request);
 // sqlMenuItem.Close;
  sqlMenuItem.SQL.text:=new_request;
  open_sql(new_request, sqlMenuItem);
  sqlMenuItem.Refresh;
  redrawLvMenuItems();

end;

procedure TForm1.sqlMenuBeforeRefresh(DataSet: TDataSet);
begin
  sqlMenu.ApplyUpdates;
end;

procedure TForm1.sqlMenuItemBeforeEdit(DataSet: TDataSet);
begin
  sqlMenuItem.Refresh;
end;

procedure TForm1.sqlMenuItemBeforeInsert(DataSet: TDataSet);
begin
  sqlMenuItem.Refresh;
end;

procedure TForm1.sqlMenuItemBeforeRefresh(DataSet: TDataSet);
begin
  sqlMenuItem.ApplyUpdates;
end;

procedure TForm1.sqlPresetsAfterPost(DataSet: TDataSet);
begin
   AfterPostHelper(lvPresets, sqlPresets, 'id');
end;

procedure TForm1.sqlPresetsBeforeDelete(DataSet: TDataSet);
begin
  BeforeDeleteHelper(lvPresets, sqlPresets, 'id');
end;

procedure TForm1.sqlPresetsBeforeRefresh(DataSet: TDataSet);
begin
  sqlPresets.ApplyUpdates;
end;

procedure TForm1.sqlSectionsAfterDelete(DataSet: TDataSet);
begin
  form1.refreshSectionTree();
  form1.refreshContentTree();
end;

procedure TForm1.sqlSectionsAfterEdit(DataSet: TDataSet);
begin
end;

procedure TForm1.sqlSectionsAfterInsert(DataSet: TDataSet);
begin
end;

procedure TForm1.sqlSectionsAfterPost(DataSet: TDataSet);
begin
  afterPostHelper(lvSections, sqlSections, 'id');

  form1.refreshSectionTree();
  form1.refreshContentTree();

end;























procedure TForm1.sqlSectionsBeforeDelete(DataSet: TDataSet);
begin
  BeforeDeleteHelper(lvSections, sqlSections, 'id');
end;

procedure TForm1.sqlTagsAfterPost(DataSet: TDataSet);
begin
  afterPostHelper(lvTags, sqlTags, 'tag_id');
end;

procedure TForm1.sqlTagsBeforeDelete(DataSet: TDataSet);
begin
  BeforeDeleteHelper(lvTags, sqlTags, 'tag_id');
end;

procedure TForm1.sqlTagsBeforeRefresh(DataSet: TDataSet);
begin
  sqlTags.ApplyUpdates;
end;

procedure TForm1.sqlTagsPagesAfterPost(DataSet: TDataSet);
begin
  afterPostHelper(lvTagsPages, sqlTagsPages, 'id_tag_page');
end;

procedure TForm1.sqlTagsPagesBeforeDelete(DataSet: TDataSet);
begin
  beforedeletehelper(lvTagsPages, sqlTagsPages, 'id_tag_page');
end;

procedure TForm1.sqlTagsPagesBeforeRefresh(DataSet: TDataSet);
begin
  sqlTagsPages.ApplyUpdates;
end;








procedure TForm1.btFtpUpdateClick(Sender: TObject);
var
  IP, Port, FileName, LocalFile, Path, User, Pass: string;
  F: TSearchRec;
  is_file_put : boolean;
  ServerEnabled: boolean;
  FTPClient: TFtpSend;
begin
     // test with vsftpd
  ServerEnabled := False;

  FTPClient := TFTPSend.Create;
  FTPClient.TargetHost := edFtpIp.Text;
  FTPClient.TargetPort := edFtpPort.Text;
  FTPClient.UserName := edFtpUsername.Text;
  FTPClient.Password := edFtpPassword.Text;


  btFtpUpdate.Enabled := False;
  IP := edFtpIP.Text;
  Port := edFtpPort.Text;
  User := edFtpUsername.Text;
  Pass := edFtpPassword.Text;

  Path := sqlPresets.FieldByName('dirpath').AsString;

  if FtpClient.Login then

      ServerEnabled := True;



  if ServerEnabled then mmFtpLog.Lines.Add(
      'Подключение установлено')
  else
    mmFtpLog.Lines.Add('Подключение не установлено');

  if ServerEnabled = True then
  begin
    if FindFirst(Path + DELIM+'*.*', faAnyFile, F) = 0 then
    begin
      while FindNext(F) = 0 do
      begin
        Application.ProcessMessages;
        if (F.Name = '.') or (F.Name = '..') then continue;
        LocalFile := Path + DELIM + F.Name;
        mmFtpLog.Lines.Add('Local file name ' + LocalFile);
        FileName := F.Name;

        // remove file on remote site (only from build)

        if FtpClient.Login then
        begin
          mmFtpLog.Lines.Add('Запрос на удаление ' +
            FileName + ' с сервера');
          if FtpClient.DeleteFile(FileName) then
            mmFtpLog.Lines.Add('... успешно удален')
          else
            mmFtpLog.Lines.Add('... не удалось удалить');
          FtpClient.Logout;
        end;

        // put new file

       is_file_put := FtpPutFile(IP, Port, FileName, LocalFile, User, Pass);
        if is_file_put then
          mmFtpLog.Lines.Add('[+] Файл ' + FileName +
            ' выгружен на сервер из ' + LocalFile)
        else
          mmFtpLog.Lines.Add('[x] Файл ' + FileName +
            ' не удалось выгрузить на сервер из ' + LocalFile);
      end;
    end;
    FindClose(F);

  end;
  FtpClient.Free;
  btFtpUpdate.Enabled := True;

end;

procedure TForm1.btnAlterTableAddFieldClick(Sender: TObject);
var field_name, field_type : String;
begin
  field_name := edFieldName.Text;
  field_type := edFieldType.Text;
  if (field_name<>'') and (field_type<>'') then
    begin
          AddCustomColumn('custom_'+field_name, field_type);
          updateCustomColumns();
    end;
end;





procedure TForm1.btnAttachTagToMaterialClick(Sender: TObject);
var
  link_id : String; id_tag : String; id_page : String;
  add_sql : TSqlQuery;
begin



  add_sql:=TSqlQuery.Create(self);
  add_sql.SQLConnection:=conn;
  add_sql.Transaction:=trans;

   id_tag:=dbSelectorTag.KeyValue;
   id_page:=sqlContent.FieldByName('id').AsString;
   link_id:='linked_'+id_tag+'_with_'+id_page;
   addIntoTagsPages(link_id,  id_tag, id_page,  add_sql, conn, trans);

add_sql.Free;
   form1.showTagsOnPage(id_page);
end;

procedure TForm1.btnEditorCssOpenClick(Sender: TObject);
var ed : TfrmEditorCss;
begin
  ed:=TfrmEditorCss.Create(self);
  ed.editor.Text:=  sqlCssStyles.FieldByName('css_style').AsString;
  ed.ShowModal();



        sqlCssStyles.ApplyUpdates();
        sqlCssStyles.Edit;
        sqlCssStyles.FieldByName('css_style').AsString:=ed.editor.Text;

  ed.close();
  ed.free();
end;

procedure TForm1.btnEditorJsClick(Sender: TObject);
var jE : TfrmEditorJs;
begin
   jE:=TfrmEditorJs.Create(Self);
   jE.editor.text:=sqlJsScripts.FieldByName('js_file').AsString;
   jE.ShowModal;


   sqlJsScripts.ApplyUpdates;
   sqlJsScripts.Edit;
   sqlJsScripts.FieldByName('js_file').AsString:=jE.editor.text;
   sqlJsScripts.Post;

end;

procedure TForm1.btnGetAttachmentClick(Sender: TObject);
begin
  getAttachment();
end;

procedure TForm1.btnGetCustomFieldsClick(Sender: TObject);
begin
  updateCustomColumns();
end;



{ Тестовый код }
procedure TForm1.btnJoinClick(Sender: TObject);
begin
 actionBuildSite();
end;

{{ ===============     ЗАГРУЗКА ИЗ ТЕКСТОВЫХ ФАЙЛОВ ============= }}

procedure TForm1.btnLoadClick(Sender: TObject);
var fbuffer : TStringList; idOfBlocksInBase : TStringList;
   blockFiles : TStringList;
   id, markup : String;
   i, j, k : Integer;
   InstalledIds, InstalledMarkups : TStringList;
   exists : Boolean;
   indexToUpdate : Integer;
begin

  fbuffer:=TStringList.Create();
  // Получим список всех id из текстовых файлов /blocks/*.blk и разметку markup
    idOfBlocksInBase:=TStringList.Create;
    installedIds:=TStringList.Create;
    installedMarkups:=TStringList.Create;
    fbuffer:=TStringList.Create;
  // Установка разметки контейнеров
  sqlPresets.Edit;
  fbuffer.LoadFromFile( GetCurrentDir() + DELIM+'parts'+DELIM+'head.tpl' );
  Form1.dbmHeadTemplate.Text:=fbuffer.text;
  fbuffer.LoadFromFile( GetCurrentDir() + DELIM+'parts' + DELIM+ 'body.tpl' );
  Form1.dbmBodyPagesTemplate.Text :=fbuffer.text;
  fbuffer.LoadFromFile( GetCurrentDir() + DELIM+'parts'+DELIM+'section.tpl' );
  Form1.dbmSectionNote.Text:=fbuffer.text;
  fbuffer.LoadFromFile( GetCurrentDir() + DELIM+'parts'+DELIM+'full_text.tpl' );
  Form1.dbmSectionFullText.Text:=fbuffer.text;
  fbuffer.LoadFromFile( GetCurrentDir() + DELIM+'parts'+DELIM+'item.tpl' );
  Form1.dbmTemplateOfItem.Text:=fbuffer.text;
  sqlPresets.Post; // Применяем изменения
  // Получим список всех ID в таблице sqlBlocks
  sqlBlocks.First;
  while not sqlBlocks.EOF do begin
      idOfBlocksInBase.Add( sqlBlocks.FieldByName('id').AsString);

      sqlBlocks.Next;
      Application.ProcessMessages;
  end;

    blockFiles := FindAllFiles(GetCurrentDir()+DELIM+'blocks', '*.blk', false); // получили список блоков
    // первая строка - id блока
    // остальные HTML разметка
    for i:=0 to blockFiles.Count-1 do
        begin
          fbuffer.LoadFromFile( blockFiles[i] ); // already have abs paths
          id:=fbuffer.Strings[0];
          markup:='';
          for j:=1 to fbuffer.Count-1 do
              begin
                markup:=markup+fbuffer.Strings[j];
              end;
              InstalledIds.Add(id);
              InstalledMarkups.Add(markup);
        end;

     for i:=0 to InstalledIds.Count-1 do
         begin
           exists:=false;
           indexToUpdate := -1;
           for j:=0 to  idOfBlocksInBase.Count -1 do
               begin
                 if idOfBlocksInBase[j]=InstalledIds[i] then
                   begin
                        exists:=true; IndexToUpdate := j; break;
                   end;
               end;
           if exists then
              begin
                   sqlBlocks.First; k := 0;
                   while not sqlBlocks.EOF do
                         begin
                            if k<>indexToUpdate then

                             inc(k) else break;

                             sqlBlocks.Next;
                             application.ProcessMessages;
                         end;
                   sqlBlocks.Edit;
                   sqlBlocks.FieldByName('id').AsString := installedIds[i];
                   sqlBlocks.FieldByName('markup').AsString := installedMarkups[i];
                   sqlBlocks.Post;
              end
           else
           begin
                 sqlBlocks.Insert;
                 sqlBlocks.FieldByName('id').AsString := installedIds[i];
                 sqlBlocks.FieldByName('markup').AsString := installedMarkups[i];
                 sqlBlocks.Post;
           end;
         end;


  fbuffer.Free;
  idOfBlocksInBase.Free;
  installedMarkups.Free;
  installedIds.Free;
end;

procedure TForm1.btnLoadFromWysiwygClick(Sender: TObject);
var
   fileContent : TMemo;
   path : String;
begin

  path := form1.edLocalWysigygServer.Text;

  fileContent := TMemo.Create(Self);
  fileContent.Lines.LoadFromFile(path+'/public/content.txt');
  sqlContent.Edit;
  sqlContent.FieldByName('content').AsString:=fileContent.Text;

  fileContent.Free;


  Process1.CommandLine:='pkill node';
  Process1.Execute;

end;

procedure TForm1.btnOpenWithWysiwygClick(Sender: TObject);
var
   fileContent : TMemo;
   path : String;
   Process2 : TProcess;
   output : String;
begin

  path := form1.edLocalWysigygServer.Text;

  fileContent := TMemo.Create(Self);
  fileContent.Text:=sqlContent.FieldByName('content').AsString;
  fileContent.Lines.SaveToFile(path+'/public/content.txt');
  fileContent.Free;

  Process1.CommandLine:='node '+path+'/index.js';
  Process1.Execute;

  Process2:=TProcess.Create(Self);
  Process2.CommandLine := 'firefox http://127.0.0.1:3000';
  Process2.Execute;



end;

procedure TForm1.btnPublishToGithubPagesClick(Sender: TObject);
var ProcessCopy : TProcess;
begin
   ProcessCopy:=TProcess.Create(Self);
   ProcessCopy.CommandLine:='/usr/bin/bash -c "cp -r  '+form1.edPathToBuild.Text+'/* '+form1.edGithubPagesPath.Text+'" ';
   ProcessCopy.Execute;
   ProcessCopy.WaitOnExit; // ждем завершения копирования
   ProcessCopy.Free;

   ProcessCopy:=TProcess.Create(Self);
   ProcessCopy.CommandLine:='/usr/bin/bash -c "cd '+form1.edGithubPagesPath.Text+' && git add * " ';
   ProcessCopy.Execute;
   ProcessCopy.WaitOnExit; // добавляем файл в коммит
   ProcessCopy.Free;

   ProcessCopy:=TProcess.Create(Self);
   ProcessCopy.CommandLine:='/usr/bin/bash -c " cd '+form1.edGithubPagesPath.Text+' &&  git commit -m /"next commit/"  " ';
   ProcessCopy.Execute;
   ProcessCopy.WaitOnExit; // делаем коммит
   ProcessCopy.Free;







end;

procedure TForm1.btnRefreshTreeClick(Sender: TObject);
begin
     refreshTrees();
end;

procedure TForm1.btnRemoveAssocTagClick(Sender: TObject);
var
  id_page : String;
  remove_sql_tags : TSqlQuery;
begin
  id_page:=sqlContent.FieldByName('id').AsString;
  remove_sql_tags:=TSqlQuery.Create(self);
  remove_sql_tags.SQLConnection:=conn;
  remove_sql_tags.Transaction:=trans;
  remove_sql_tags.SQL.Text:='delete from tags_pages where id_page="'+id_page+'"';
  remove_sql_tags.ExecSQL;
  remove_sql_tags.Free;
  form1.showTagsOnPage(id_page);
end;

procedure TForm1.btnRemoveCustomFieldClick(Sender: TObject);
begin
  if ListFields.ItemIndex>-1 then
     begin
     DeleteCustomColumn(ListFields.Items[ ListFields.ItemIndex ]);
     updateCustomColumns();
     end;
end;

procedure TForm1.btnRemoveOneTagClick(Sender: TObject);
var
  id_tag, tag_caption, id_page : String;
  remove_sql_tag : TSqlQuery;
  get_id_tag_by_name : TSqlQuery;
begin
  if listTags.ItemIndex>-1 then
    begin
       tag_caption:=listTags.Items[ listTags.ItemIndex ];
       id_page:=sqlContent.FieldByName('id').AsString;

       get_id_tag_by_name:=TSQLQuery.Create(self);
       get_id_tag_by_name.SQLConnection:=conn;
       get_id_tag_by_name.Transaction:=trans;
       get_id_tag_by_name.sql.text:='select tag_id from tags WHERE tag_caption="'+tag_caption+'" LIMIT 1';
       get_id_tag_by_name.ExecSQL;
       get_id_tag_by_name.Active:=true;
       get_id_tag_by_name.First;
       id_tag:=get_id_tag_by_name.FieldByName('tag_id').AsString;
       get_id_tag_by_name.Active:=false;
       get_id_tag_by_name.Free;


       conn.ExecuteDirect('delete from tags_pages where (id_page="'+id_page+'") AND (id_tag="'+id_tag+'")');

       form1.showTagsOnPage(id_page);
    end;
end;

procedure TForm1.btnSelectZipArchiveClick(Sender: TObject);
begin
    if OpenDialog2.Execute Then
     form1.edPathToZip.Text:=  OpenDialog2.FileName;
end;

procedure TForm1.btnSetAttachmentClick(Sender: TObject);
begin
   setAttachment();
end;


procedure TForm1.btnSetImageClick(Sender: TObject);
begin
    if opdSelectPicture.Execute then
    begin
      DBImage.Picture.LoadFromFile(opdSelectPicture.FileName);
    end;
end;

procedure TForm1.btnUploadWithBridgeClick(Sender: TObject);
const
   scriptname : String = 'send-files.py';
var
   python_script : String;
   mmPythonScript : TMemo;
   UploadProcess  : TProcess;
   i : Integer;
   OutputLines: TStringList;
begin
  // Create uploading script dynamically
  mmPythonScript:= TMemo.Create(Self);
  mmPythonScript.Lines.Add('import requests');
  mmPythonScript.Lines.Add('domain = "'+ form1.edBridgeURL.Text + '"');
  mmPythonScript.Lines.Add('myurl = "http://" + domain + "' + form1.edListenerUrl.Text + '"');
  mmPythonScript.Lines.Add('files = {"file": open("' + form1.edPathToZip.Text + '", "rb")}');
  mmPythonScript.Lines.Add('data = {"API": "' + form1.edAPIKey.Text + '"}');
  mmPythonScript.Lines.Add('res = requests.post(myurl, data=data, files=files)');;
  mmPythonScript.Lines.Add('print(res.text)');
  mmPythonScript.Lines.SaveToFile(scriptname);

  mmDetails.Clear;
  for i:=0 to mmPythonScript.Lines.Count - 1 do
       begin
          mmDetails.Lines.Add( mmPythonScript.Lines[i] );
       end;
  mmPythonScript.Free;
  UploadProcess:=TProcess.Create(Self);
  UploadProcess.Executable:='/usr/bin/python3';
  UploadProcess.Parameters.Add(scriptname);
  UploadProcess.Options := UploadProcess.Options + [poWaitOnExit, poUsePipes];

  OutputLines:=TStringList.Create;
  UploadProcess.Execute;
  OutputLines.Add('stdout:');
  OutputLines.LoadFromStream(UploadProcess.Output);
  OutputLines.Add('stderr:');
  OutputLines.LoadFromStream(UploadProcess.Stderr);

  For i:=0 to OutputLines.Count - 1 do
       mmDetails.Lines.add(outputlines[i]);

  OutputLines.Free;
  UploadProcess.Free;
end;


procedure TForm1.acEditorForSectionNoteExecute(Sender: TObject);

begin
     editor_win_show( sqlSections, 'note');
end;

procedure TForm1.acFindContentByCaptionExecute(Sender: TObject);
var q : String;
   i : Integer;
   is_find : boolean;
begin
  // TODO Поиск по заголовку
  q:=InputBox('Поиск', 'Ищем ', '');
  is_find:=sqlContent.Locate('caption', q, [loCaseInsensitive, loPartialKey]);
  if is_find then
    begin
  for i:=0 to lvContent.Items.Count-1 do begin
    if lvContent.Items[i]<>NIL then
      if lvContent.Items[i].Caption = sqlContent.FieldByName('id').AsString then
        begin
             lvContent.ItemIndex:=i;
             break;
        end;
  end;
    end;
end;

procedure TForm1.acPasteTextExecute(Sender: TObject);
begin
   SelectionHistoryManager.Paste(lastFocusedControl);
end;

procedure TForm1.acRestoreSpecialSettingExecute(Sender: TObject);
begin
   RestoreSpecialSettings('');
end;

procedure TForm1.acSaveSpecialSettingsExecute(Sender: TObject);
begin
  SaveSpecialSettings('');
end;

procedure TForm1.acBuildSiteExecute(Sender: TObject);
begin
  actionBuildSite();
end;

procedure TForm1.acSetFontExecute(Sender: TObject);
begin
  actionSetFont();
end;

procedure TForm1.acSwitchToChLocaleExecute(Sender: TObject);
begin
  localeCn();
end;

procedure TForm1.acSwitchToEngLocaleExecute(Sender: TObject);
begin
  localeEng();
end;

procedure TForm1.acSwitchToEspLocaleExecute(Sender: TObject);
begin
  localeEsp();
end;

procedure TForm1.acSwitchToKoreanLocaleExecute(Sender: TObject);
begin
  localeKp();
end;

procedure TForm1.acSwitchToRusLocaleExecute(Sender: TObject);
begin
  localeRus();
end;

procedure TForm1.AppPagesChange(Sender: TObject);
begin

end;

procedure TForm1.acEditorForSectionFullTextExecute(Sender: TObject);
begin
    editor_win_show( sqlSections, 'full_text');
end;

procedure TForm1.acEditorForBlockMarkupExecute(Sender: TObject);
begin
     editor_win_show( sqlBlocks, 'markup');
end;

procedure TForm1.acCutMarkupExecute(Sender: TObject);
begin

end;

procedure TForm1.acCutTextExecute(Sender: TObject);


begin

   SelectionHistoryManager.Cut(lastFocusedControl);

end;

procedure TForm1.acDatabaseOpenExecute(Sender: TObject);
var
   filename : String;
 begin
   if OpenDialog1.Execute then begin



   makeSqlInactive;

   filename := OpenDialog1.FileName;
   form1.Caption:=filename;
   conn.DatabaseName := filename;



         conn.Open;

         trans.Active:=True;

         conn.ExecuteDirect('End transaction');
         conn.ExecuteDirect('pragma synchronous = 0');
         conn.ExecuteDirect('pragma foreign_keys = off');
         conn.ExecuteDirect('pragma journal_mode = off');

         trans.Active:=True;
         conn.ExecuteDirect('Begin transaction');


         checkConnect(conn, trans, 'initTransactionSQL');
         makeSqlActive();
         doScan;
         refreshTrees;
     end;
end;



procedure TForm1.acDatabaseSaveAsExecute(Sender: TObject);
var
   dest_filename : String;
   source_filename : String;
begin
  if SaveDialog1.Execute then
   begin
     source_filename := db_filename;
     dest_filename := SaveDialog1.FileName;
     CopyFile(source_filename, dest_filename);
   end;
end;

procedure TForm1.acEditorForBodyTemplateExecute(Sender: TObject);
begin
       editor_win_show(sqlPresets, 'bodytpl');
end;

procedure TForm1.acEditorForHeadTemplateExecute(Sender: TObject);
begin
   editor_win_show(sqlPresets, 'headtpl');
end;

procedure TForm1.acEditorForRubricItemTemplateExecute(Sender: TObject);
begin
  editor_win_show(sqlPresets, 'itemtpl');
end;

procedure TForm1.acEditorForRubricSectionTemplateExecute(Sender: TObject);
begin
   editor_win_show(sqlPresets, 'sectiontpl');
end;



procedure TForm1.btStartServerClick(Sender: TObject);
begin
  btStartServer.Enabled := False;
  btStopServer.Enabled := True;
  StartOwnServer();

end;

procedure TForm1.btStopServerClick(Sender: TObject);
begin

  StopOwnServer();
  btStartServer.Enabled := True;
  btStopServer.Enabled := False;
end;



procedure TForm1.btnMakeArchiveClick(Sender: TObject);
var
  dir: string;
  command_for_archive : String;
begin
  dir := sqlPresets.FieldByName('dirpath').AsString;
  command_for_archive:=applyVar(applyVar(applyVar(ZipArchiverCommand.Text, 'DIR', dir), 'ZIPNAME', edArchiveName.Text),
  'DEST',  edPathToBuild.Text);

  Process1.CommandLine := command_for_archive;
  Process1.Execute;
  Process1.CommandLine := edFileManager.Text + ' '+ edPathToBuild.Text;
  Process1.Execute;

  edFileManager.Text :=  command_for_archive;

end;



procedure TForm1.btnEditorContentClick(Sender: TObject);

begin
  form1.editor_win_show(sqlContent, 'content');
end;



procedure TForm1.cboLocaleChange(Sender: TObject);
begin
  case cboLocale.ItemIndex of
       0  : LocaleRUS();
       1  : LocaleENG();
       2  : LocaleESP();
       3  : LocaleCn();
       4  : LocaleKp();
  end;
end;

procedure TForm1.dbeBlockHtmlEnter(Sender: TObject);
begin
  LastFocusedControl := dbeBlockHtml;
end;

procedure TForm1.dbmBodyPagesTemplateEnter(Sender: TObject);
begin
  LastFocusedControl := dbmBodyPagesTemplate;
end;

procedure TForm1.dbmBodySectionsTemplateEnter(Sender: TObject);
begin
  LastFocusedControl := dbmBodySectionsTemplate;
end;

procedure TForm1.dbmCssStyleEnter(Sender: TObject);
begin
  LastFocusedControl := dbmCssStyle;
end;

procedure TForm1.dbmHeadTemplateEnter(Sender: TObject);
begin
  LastFocusedControl := dbmHeadTemplate;
end;

procedure TForm1.dbmItemTagTemplateEnter(Sender: TObject);
begin
  LastFocusedControl := dbmItemTagTemplate;
end;

procedure TForm1.dbmJsScriptFileEnter(Sender: TObject);
begin
  LastFocusedControl := dbmJsScriptFile;
end;

procedure TForm1.dbmSectionFullTextChange(Sender: TObject);
begin

end;

procedure TForm1.dbmSectionFullTextEnter(Sender: TObject);
begin
  LastFocusedControl := dbmSectionFullText;
end;

procedure TForm1.dbmTagsTemplateEnter(Sender: TObject);
begin
  LastFocusedControl := dbmTagsTemplate;
end;

procedure TForm1.dbmTemplateOfItemEnter(Sender: TObject);
begin
  LastFocusedControl :=  dbmTemplateOfItem;
end;

procedure TForm1.dbNav_AttachmentsClick(Sender: TObject;
  Button: TDBNavButtonType);
begin
    if (Button = nbNext) or (Button = nbNext) or (Button = nbRefresh) then
        displayAttachmentStatus();
end;

procedure TForm1.dbNav_ImagesBeforeAction(Sender: TObject;
  Button: TDBNavButtonType);
begin
  if (Button = nbRefresh) or (Button=nbDelete) then
  begin
   sqlGetAllImages.ApplyUpdates();
   trans.CommitRetaining;
  end;
end;

procedure TForm1.dbNav_MenuItemsClick(Sender: TObject; Button: TDBNavButtonType);
begin

end;



procedure TForm1.dbNav_ContentBeforeAction(Sender: TObject; Button: TDBNavButtonType);
begin
    if (Button = nbRefresh) or (Button=nbDelete) then
  begin
   sqlContent.ApplyUpdates();
   trans.CommitRetaining;
  end;
end;

procedure TForm1.dbNav_BlocksBeforeAction(Sender: TObject;
  Button: TDBNavButtonType);
begin
   if (Button = nbRefresh) or (Button=nbDelete) then
  begin
   sqlBlocks.ApplyUpdates();
   trans.CommitRetaining;
  end;
end;

procedure TForm1.dbNav_CssBeforeAction(Sender: TObject; Button: TDBNavButtonType
  );
begin
   if (Button = nbRefresh) or (Button=nbDelete) then
  begin
   sqlCssStyles.ApplyUpdates();
   trans.CommitRetaining;
  end;
end;

procedure TForm1.dbNav_PresetsBeforeAction(Sender: TObject;
  Button: TDBNavButtonType);
begin
     if (Button = nbRefresh) or (Button=nbDelete) then
  begin
   sqlPresets.ApplyUpdates();
   trans.CommitRetaining;
  end;
end;

procedure TForm1.dbNav_SectionsBeforeAction(Sender: TObject;
  Button: TDBNavButtonType);
begin
    if (Button = nbRefresh) or (Button=nbDelete) then
  begin
   sqlSections.ApplyUpdates();
   trans.CommitRetaining;
  end;
end;

procedure TForm1.fContentEnter(Sender: TObject);
begin
  LastFocusedControl := fContent;
end;

procedure TForm1.FormDropFiles(Sender: TObject; const FileNames: array of string
  );
var
  fileContent : TStringList;
  addedText : String;
  index  : Integer;
begin
  addedText := '';
  fileContent := TStringList.Create();
  for index:=Low(FileNames) to High(FileNames) do begin
               fileContent.Clear;
               fileContent.LoadFromFile(FileNames[index]);
               addedText := addedText + fileContent.Text;
  end;
  if LastFocusedControl <> NIL then
     (LastFocusedControl as tdbmemo).Text:=addedText;
end;


procedure TForm1.lbFieldTypeClick(Sender: TObject);
begin

end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin

end;

procedure TForm1.lvAttachmentsClick(Sender: TObject);
begin
  listViewClickHelper(lvAttachments, sqlGetAllAttachments, 'attachment_id');
  displayAttachmentStatus();
end;

procedure TForm1.lvBlocksClick(Sender: TObject);
begin
    listViewClickHelper(lvBlocks, sqlBlocks, 'id');
end;

procedure TForm1.lvContentClick(Sender: TObject);
begin
  listViewClickHelper(lvContent, sqlContent, 'id');
  showTagsOnPage(sqlContent.FieldByName('id').AsString);


end;

procedure TForm1.lvCSSClick(Sender: TObject);
begin
  listViewClickHelper(lvCSS, sqlCssStyles, 'css_id');
end;

procedure TForm1.lvImagesClick(Sender: TObject);
begin
  listViewClickHelper(lvImages, sqlGetAllImages, 'image_id');
end;

procedure TForm1.lvJsScriptsClick(Sender: TObject);

begin
  listViewClickHelper(lvJsScripts, sqlJsScripts, 'js_id');
end;

procedure TForm1.lvMenuItemsClick(Sender: TObject);
begin
  listViewClickHelper(lvMenuItems, sqlMenuItem, 'menu_item_id');
end;

procedure TForm1.lvPresetsClick(Sender: TObject);
begin
  listViewClickHelper(lvPresets, sqlPresets, 'id');
end;

procedure TForm1.lvSectionsClick(Sender: TObject);
begin
  listViewClickHelper(lvSections, sqlSections, 'id');
end;

procedure TForm1.mnuCutTextClick(Sender: TObject);
begin

end;




procedure TForm1.panFieldsListClick(Sender: TObject);
begin

end;

procedure TForm1.redrawLvMenuItems;
begin
  lvMenuItems.Clear;
  sqlMenuItem.First;
  while not sqlMenuItem.Eof do
         begin
           lvMenuItems.AddItem(sqlMenuItem.FieldByName('menu_item_id').AsString, nil);
           sqlMenuItem.Next;
         end;
  sqlMenuItem.First;
end;

procedure TForm1.refreshTrees;
begin
     refreshSectionTree;
     refreshContentTree;
end;




procedure TForm1.refreshContentTree;
var
  Branch : TStringList; k : Integer;
  Node, rootNode, parentNode, childNode   : TTreeNode;
  tree : String; // '/x/y/z';

  RootId : String;
begin
  tvContent.Items.Clear;

  sqlSections.First;
  while not sqlSections.EOF do
    begin
      tree:=sqlSections.FieldByName('tree').AsString;
      if (tree='') or (tree='/') then
        begin
           RootId:=sqlSections.FieldByName('id').AsString;
           tvContent.Items.Add(nil, RootId );
           RootNode:=tvContent.Items.FindNodeWithText(RootId);
           RootNode.ImageIndex:=0;
           insertArticlesToNode(RootNode, RootId);
           break;
        end;
      sqlSections.Next;
    end;




  sqlSections.ApplyUpdates;
  sqlSections.Refresh;


  sqlSections.First;
  while not sqlSections.EOF do
    begin
      tree:=sqlSections.FieldByName('tree').AsString;
      Branch:=TStringList.Create;
      Branch.Delimiter:='/';
      Branch.DelimitedText:=tree;


       node:=nil;
      for k:=0 to Branch.Count-1 do
          begin

            if (Branch[k] = '') or (Branch[k] = RootId) then continue; // skip empty

            RootNode:=tvContent.Items.FindNodeWithText(RootId);
            Node:=tvContent.Items.FindNodeWithText(Branch[k]);
            if (Node=NIL) and (k=1)   then
              begin
               Node:=tvContent.Items.AddChild(RootNode, Branch[k]);
               Node.ImageIndex:=0;
               insertArticlesToNode(Node, Branch[k]);
              end;
            if (k>1)   then
                begin
                  parentNode:=tvContent.Items.FindNodeWithText(Branch[k-1]);
                  Node:=tvContent.Items.FindNodeWithText(Branch[k]);
                  if (parentNode<>NIL) and (Node = NIL) then
                     childNode:=tvContent.Items.AddChild(parentNode, Branch[k]);
                     childNode.ImageIndex:=0;
                     insertArticlesToNode(childNode, Branch[k]);
                end;




          end;
      Branch.Free;
      sqlSections.Next;

    end;
  sqlSections.First;

end;

procedure TForm1.refreshSectionTree;
 var
  Branch : TStringList; k : Integer;
  Node, rootNode, parentNode    : TTreeNode;
  tree : String; // '/x/y/z';

  RootId : String;
begin
  tvSections.Items.Clear;

  sqlSections.First;
  while not sqlSections.EOF do
    begin
      tree:=sqlSections.FieldByName('tree').AsString;
      if (tree='') or (tree='/') then
        begin
           RootId:=sqlSections.FieldByName('id').AsString;
           tvSections.Items.Add(nil, RootId );
           break;
        end;
      sqlSections.Next;
    end;




  sqlSections.ApplyUpdates;
  sqlSections.Refresh;


  sqlSections.First;
  while not sqlSections.EOF do
    begin
      tree:=sqlSections.FieldByName('tree').AsString;
      Branch:=TStringList.Create;
      Branch.Delimiter:='/';
      Branch.DelimitedText:=tree;


       node:=nil;
      for k:=0 to Branch.Count-1 do
          begin

            if (Branch[k] = '') or (Branch[k] = RootId) then continue; // skip empty

            RootNode:=tvSections.Items.FindNodeWithText(RootId);
            Node:=tvSections.Items.FindNodeWithText(Branch[k]);
            if (Node=NIL) and (k=1)   then
               Node:=tvSections.Items.AddChild(RootNode, Branch[k]);

            if (k>1)   then
                begin
                  parentNode:=tvSections.Items.FindNodeWithText(Branch[k-1]);
                  Node:=tvSections.Items.FindNodeWithText(Branch[k]);
                  if (parentNode<>NIL) and (Node = NIL) then
                     tvSections.Items.AddChild(parentNode, Branch[k]);

                end;




          end;
      Branch.Free;
      sqlSections.Next;

    end;
  sqlSections.First;

end;





















procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  form1.SaveSpecialSettings('special_settings.dat');

  Tags.Free;

  Images.Free;

  try
  form1.makeSqlInactive();
  except
   //showMessage('Проблема при сохранении');
  end;

  if ListenerSocket <> nil then ListenerSocket.Free;
  if ConnectionSocket <> nil then  ConnectionSocket.Free;

  SelectionHistoryManager.Free;

end;



procedure TForm1.initdbSQL;
begin
  // в начале иниц. транзакция
  Form1.initTransactionSQL();
  // по выходу из блока предполагается, что
  // либо база создана с нуля, либо уже заполнена
  SilentMessage('Начальная транзакция сделана...');

  // 2. переключаем источники данных
  form1.changeDataSources(); // назначаем для 4 таблиц
  SilentMessage('Источники подключены...');
  form1.viewTablesSQL(); // 3. вызываем запросы
  SilentMessage('Запросы выполнены...');
end;

function TForm1.buildHead(title: string; headTemplate: string): string;
var
  r: string;
begin
  r := headTemplate;
  r := StringReplace(r, '{title}', title, [rfReplaceAll]);
  r := StringReplace(r, '{sitename}', sqlPresets.FieldByName('sitename').AsString,
    [rfReplaceAll]);
  Result := r;
end;

{{ ============================== ОПОРНЫЕ ЧАСТИ ДВИЖКА - СБОРКА ТЕЛА СТРАНИЦЫ =============================== }}
function TForm1.buildBody(title: string; body: string; bodyTemplate: string): string;
var r : String; s, s2 : string;
begin
 r:=bodyTemplate;
 r:=applyVar(r, 'title', title);
 r:=applyVar(r, 'content', body);
 s:=sqlContent.FieldByName('section').AsString;
 r:=applyVar(r, 'section', s);
 sqlSections.First;
 while not sqlSections.EOF do
       begin
            s2:=sqlSections.FieldByName('id').AsString;
            if s2=s then
               begin
                 r:=applyVar(r, 'sectionName', sqlSections.FieldByName('section').AsString);
                 break;
               end;
               sqlSections.Next;
               Application.ProcessMessages;
       end;
 r:=applyVar(r, 'sitename', sqlPresets.FieldByName('sitename').AsString);
 r:=applyVar(r, 'ext', PrefferedExtension.Text);
 Result:=R;
end;


{{ ============================== ОПОРНЫЕ ЧАСТИ ДВИЖКА - ПРИМЕНЕНИЕ ГЛОБАЛЬНЫХ БЛОКОВ =============================== }}
function TForm1.useBlocks(part: string): string;
var r : String; i, j : Integer; h, t : String;  fbuffer : TStringList;  blockFiles : TStringList;
   log : TStringList;
   key, value : String;
   block_index : integer;
begin
  r := part;
  log := TStringList.Create;
  if not chkGetBlocksFromFile.Checked then // use database
  begin
  if logger_info then  mmRubrics.Lines.Add('USE BLOCKS FROM ram');
  if logger_info then  mmRubrics.Lines.Add('Глобальных блоков '+IntToStr(blocks.Count));
  for block_index:=0 to blocks.Count - 1 do
                     begin

                       key:=Blocks.Names[block_index];
                       value:=Blocks.ValueFromIndex[block_index];
                       //showMessage('key '+key);
                       //showMessage('value = '+value);

        h := '{'+key+'}';
        t :=  value;
        r:=StringReplace(r, h, t, [rfReplaceAll]);
        if logger_info then  mmRubrics.Lines.Add('replace '+h+' ==>> to '+t);
        Application.ProcessMessages;
 end;

  end
  else begin
    if logger_info then  mmRubrics.Lines.Add('USE BLOCKS FROM FILES');
    fbuffer:=TStringList.Create;
    blockFiles := FindAllFiles(GetCurrentDir()+DELIM+'blocks'+DELIM, '*.blk', false); // получили список блоков
    // первая строка - id блока
    // остальные HTML разметка
    for i:=0 to blockFiles.Count-1 do
        begin
          fbuffer.LoadFromFile( blockFiles[i] ); // already have abs paths
          h:=fbuffer.Strings[0];
          t:='';
          for j:=1 to fbuffer.Count-1 do
              begin
                t:=t+fbuffer.Strings[j];
              end;
          r:=StringReplace(r, '{'+h+'}', t, [rfReplaceAll]);

          
  if logger_info then  mmRubrics.Lines.Add('replace {'+h+'+} to '+t);

          log.Add('Replace in '+r+'{'+h+'} on '+t);
          log.Add('===== Result is ====');
          log.Add(r);
          log.Add('======/Result======');

           Application.ProcessMessages;
        end;
    fbuffer.Free;
    log.SaveToFile('log.txt');
    log.Free;
  end;

  if logger_info then
  begin
     form1.mmRubrics.Lines.add('ОБРАБОТКА ГЛОБ. БЛОКОВ до');
     form1.mmRubrics.Lines.add(part);
     form1.mmRubrics.Lines.add('ОБРАБОТКА ГЛОБ. БЛОКОВ после');
     form1.mmRubrics.Lines.Add(r);
     if part = r then
             form1.mmRubrics.Lines.Add('!!! ЗАМЕНА НЕ ВЫПОЛНЕНА !!!');
  end;

  Result:=r;
end;

procedure TForm1.scanLinks;
var
   i : integer;
   sql_GetLinks : TSQLQuery;
begin
   sql_GetLinks:=TSQLQuery.Create(Self);
   sql_GetLinks.SQLConnection:=conn;
   sql_GetLinks.Transaction:=trans;
   sql_GetLinks.SQL.Text:='select content.* , section.tree from content left join section on content.section = section.id';
   sql_GetLinks.ExecSQL;
   sql_GetLinks.Active:=true;

  form1.dbNav_Content.Enabled:=false;

  Titles.Clear;      // Titles is a list of pages captions
  Urls.Clear;        // Urls is a list of urls for pages
  Sections.Clear;
  lvContent.clear;
  PagesTree.Clear;

  if not sql_GetLinks.Eof then  begin
  sql_GetLinks.First;  // lookup from first record
  while not sql_GetLinks.EOF do
  begin
    // add to list so each index is same item
    Titles.Lines.Add(sql_GetLinks.FieldByName('caption').AsString);
    Urls.Lines.Add(sql_GetLinks.FieldByName('id').AsString);
    Sections.Lines.Add(sql_GetLinks.FieldByName('section').AsString);
    PagesTree.Add(sql_GetLinks.FieldByName('id').AsString, sql_GetLinks.FieldByName('tree').AsString);
    sql_GetLinks.Next;  // see next page
    Application.ProcessMessages;
  end;
  sql_GetLinks.Free;  // set cursor to first


  for i:=0 to Urls.Lines.Count-1 do
      begin
        lvContent.AddItem( Urls.Lines.Strings[i] , nil);
      end;

  end;
  form1.dbNav_Content.Enabled:=true;
end;

procedure TForm1.scanSections;
var i : integer;
begin
  // identically as scanLinks
  SiteSectionTree.Clear;
  SiteSectionUrls.Clear;
  SiteSectionTitles.Clear;
  lvSections.clear;

  if not sqlSections.EOF then begin

  sqlSections.First;
  while not sqlSections.EOF do
  begin
    SiteSectionTitles.Lines.Add(sqlSections.FieldByName('section').AsString);
    SiteSectionUrls.Lines.Add(sqlSections.FieldByName('id').AsString);
    SiteSectionTree.Add(sqlSections.FieldByName('id').AsString, sqlSections.FieldByName('tree').AsString );
    sqlSections.Next;
    Application.ProcessMessages;
  end;
  sqlSections.First;



  for i:=0 to SiteSectionUrls.Lines.Count-1 do
      begin
        lvSections.AddItem( SiteSectionUrls.Lines.Strings[i] , nil);
        application.ProcessMessages;
      end;

  if logger_info then mmRubrics.Lines.Add('Заголовков страниц<scanSections>:'+IntToStr(SiteSectionTitles.Lines.Count));
  if logger_info then mmRubrics.Lines.Add('URL страниц<scanSections>:'+IntToStr(SiteSectionUrls.Lines.Count));
  end;
end;

procedure TForm1.scanCss;
var i : integer;
begin
  // identically as scanLinks
  CssTitles.clear;
  lvCss.clear;
  if not sqlCssStyles.eof then
    begin

  sqlCssStyles.First;
  while not  sqlCssStyles.EOF do
  begin
    CssTitles.AddPair(sqlCssStyles.FieldByName('css_id').AsString, '');

      sqlCssStyles.Next;
    Application.ProcessMessages;
  end;
   sqlCssStyles.First;



  for i:=0 to CssTitles.Count-1 do
      begin
        lvCss.AddItem( CssTitles.Names[i] , nil);
        application.ProcessMessages;
      end;


  if logger_info then mmRubrics.Lines.Add('URL страниц CSS<scanCss>:'+IntToStr(CssTitles.Count));
    end;
end;

procedure TForm1.scanTagsPages;
var r : Tag_Page_Link;   i : Integer;
begin
  sqlTagsPages.First;
  while not sqlTagsPages.EOF do
    begin
      r.id_tag_page:=sqlTagsPages.FieldByName('id_tag_page').AsString;

      r.id_tag:=sqlTagsPages.FieldByName('id_tag').AsString;
      r.id_page:=sqlTagsPages.FieldByName('id_page').AsString;

      r.tree:=getTreeByPageId(r.id_page, conn, trans);

      mTagsPages.Add(r.id_tag_page, r);
      sqlTagsPages.Next;

    end;
  sqlTagsPages.First;

  // to ui

  for i:=0 to mTagsPages.Count-1 do
      begin
        lvTagsPages.AddItem( mTagsPages.Keys[i], nil);
      end;

end;

procedure TForm1.scanAttachments;
var ar : TAttachmentRecord;
begin
     Attachments.Clear;
     lvAttachments.Clear;

   sqlGetAllAttachments.First;
  while not sqlGetAllAttachments.EOF do
    begin

      ar.attachment_id :=sqlGetAllAttachments.FieldByName('attachment_id').AsString;
      
      ar.attachment_caption:=sqlGetAllAttachments.FieldByName('attachment_caption').AsString;

      Attachments.AddOrSetData(ar.attachment_id, ar.attachment_caption);

      lvAttachments.AddItem(ar.attachment_id, nil);

      sqlGetAllAttachments.Next;

    end;
  sqlGetAllAttachments.First;
  sqlGetAllAttachments.ApplyUpdates();
  sqlGetAllAttachments.Refresh;
end;



function TForm1.insLinks(body: string): string;
var
  r: string;
  i: integer;
  url, base_url, link : String;
begin
  // in body tag all existing shorttags
  // [linkname] replaced to <a href="linkurl">title</a>
  r := body;
  i := 0;
  while i < Urls.Lines.Count do
  begin
    base_url:='';
    if chkUseTrees.Checked then
      base_url:=PagesTree[ Urls.Lines[i] ];



    link:='<a href="{base_url}/' + Urls.Lines[i] + '.' +
      PrefferedExtension.Text + '">' + Titles.Lines[i] + '</a>';

    link:=ApplyVar(link, 'base_url', base_url);

    r := StringReplace(r, '[' + Urls.Lines[i] + ']',
      link, [rfReplaceAll]);
    Inc(i);
    Application.ProcessMessages;
  end;


  if logger_info then mmRubrics.Lines.Add('ПРОСТАВЛЯЕМ ССЫЛКИ');
  if logger_info then mmRubrics.Lines.Add('Вызвана<insLinks> до '+body);
  if logger_info then mmRubrics.Lines.Add('Вызвана<insLinks> после '+r);
  Result := r;
end;

function TForm1.insSections(body: string): string;
var
  r: string;
  i: integer;
  base_url, url : String;
begin
  //  in body identically as insSections
  //  <<section_url>> will be replaced to <a href="section_url">section_title</a>
  r := body;
  i := 0;
  //showMessage(IntToStr(SiteSectionUrls.Lines.Count));
  while i < SiteSectionUrls.Lines.Count do
  begin
    url:='<a href="{base_url}/section_' + SiteSectionUrls.Lines[i] +
      '.' + PrefferedExtension.Text + '">' + SiteSectionTitles.Lines[i] + '</a>';
    base_url:='';
    if chkUseTrees.Checked then
       base_url:=SiteSectionTree[SiteSectionUrls.Lines[i]];
    url:=applyVar(url, 'base_url', base_url);

    r := StringReplace(r, '<<' + SiteSectionUrls.Lines[i] + '>>', url, [rfReplaceAll]);
    Inc(i);
    Application.ProcessMessages;
  end;
  if logger_info then mmRubrics.Lines.Add('ПРОСТАВЛЯЕМ СЕКЦИИ');
  if logger_info then mmRubrics.Lines.Add('Вызвана<insSections> до ' +body);
  if logger_info then mmRubrics.Lines.Add('Вызвана<insSections> после '+r);
  if logger_info then if r=body then mmRubrics.Lines.Add('!!! СОВПАДАЮТ' );
  Result := r;
end;

procedure TForm1.showTagsOnPage(id: string);
begin
  sqlGetTagsForPage.Clear;
  sqlGetTagsForPage.Transaction:=trans;
  sqlGetTagsForPage.SQLConnection:=conn;
  sqlGetTagsForPage.SQL.LoadFromFile('sql_tags_for_page.txt');


 prepared_transaction_start(sqlGetTagsForPage.SQL.Text,
  sqlGetTagsForPage, trans);

  sqlGetTagsForPage.ParamByName('ID_PAGE').AsString := id;

  prepared_transaction_end( sqlGetTagsForPage, trans);

  sqlGetTagsForPage.Active:=true;

  listTags.Clear;
  sqlGetTagsForPage.First;
  while not sqlGetTagsForPage.EOF do
    begin
      listTags.AddItem(sqlGetTagsForPage.FieldByName('tag_caption').AsString, nil);
      sqlGetTagsForPage.Next;
    end;
  sqlGetTagsForPage.First;

end;




function TForm1.Pager(layout: String; pages: String): String;
var
   r : String;
begin
  r:=applyVar(layout, 'pager', pages );
  if logger_info then mmRubrics.Lines.Add('ПРОСТАВЛЯЕМ ПАГИНАТОР');
  if logger_info then mmRubrics.Lines.Add('Вызвана<insPages> до ' +layout);
  if logger_info then mmRubrics.Lines.Add('Вызвана<insSections> после '+r);
  result:=r;
end;

function TForm1.useMenus(app: String): String;
var
  menu_map : sdict;
  m : Menu;
  sql_getMenuItems : TSqlQuery;
  list_html : String;
  itemView  : String;
  itemTitle : String;
  itemUrl   : String;
  k : Integer;
  tree : String;
  R : String;
  menuView : String;
  RenderItem, RenderList : Render;
begin


  menu_map := sdict.Create;


sqlMenu.Refresh;
 sqlMenu.ApplyUpdates;

 sqlMenu.First;
 while not sqlMenu.EOF do
    begin
       m.menu_id:=sqlMenu.FieldByName('menu_id').AsString;
       m.menu_caption:=sqlMenu.FieldByName('menu_caption').AsString;

       sql_GetMenuItems:=TSqlQuery.Create(nil);


       sql_GetMenuItems.Transaction:=trans;
       sql_GetMenuItems.SQLConnection:=conn;
       sql_GetMenuItems.SQL.Clear;
       sql_GetMenuItems.SQL.Text:=
   'select * from menu_item WHERE '+
   ' menu_item_menu_id = "'+m.menu_id+'"';

   sql_GetMenuItems.Active:=true;

       list_html:='';
       sql_GetMenuItems.First;
       while not sql_getMenuItems.Eof do
          begin
            itemTitle:=sql_GetMenuItems.FieldByName('menu_item_caption').AsString;
            itemUrl:=sql_GetMenuItems.FieldByName('menu_item_link_for').AsString;
            RenderItem:=Render.Create;
            itemView:=sqlMenu.FieldByName('menu_item_tpl').AsString;
            RenderItem.setTemplate(itemView);

            RenderItem.setVar('itemTitle', itemTitle);

            tree:='';
            if sql_GetMenuItems.FieldByName('menu_item_type').AsString='sc' then
              begin

              tree:=getTreeBySectionId(itemUrl, conn, trans);

              itemUrl:='section_'+itemUrl;

              end
            else
               begin
                 tree:=getTreeByPageId(itemUrl, conn, trans);
               end;

            if chkUseTrees.Checked then
                 itemUrl:=tree+'/'+itemUrl;

            if itemUrl[1]<>'/' then itemUrl:='/'+itemUrl;


             RenderItem.setVar( 'itemUrl', itemUrl);




             RenderItem.setVar( 'ext', form1.PrefferedExtension.Text);
             itemView:=RenderItem.getHtml(); RenderItem.Free;
            list_html:=list_html+itemView+'<!-- '+tree+' -->';
            sql_GetMenuItems.Next;
          end;


        menuView:=sqlMenu.FieldByName('menu_wrap_tpl').AsString;
        RenderList:=Render.Create;
        RenderList.setTemplate(menuView);

        RenderList.setVar('items', list_html);
        RenderList.setVar('menuCaption', m.menu_caption);
        menuView:=RenderList.getHtml(); RenderList.Free;

        menu_map.Add( m.menu_id, menuView);

    sql_GetMenuItems.Free;
    sqlMenu.Next;
    end;


 R:=app;
 for k:=0 to menu_map.Count-1 do
     begin
        R:=applyvar(R, 'menu='+menu_map.Keys[k], menu_map.Data[k]);
     end;
 menu_map.free;
 Result:=R;

end;

function TForm1.useImages(template: String): String;
var
   cnt, i : Integer;
   R : String;
begin


  cnt  := Images.Count;

  R := template;

  for i:=0 to cnt-1 do
      begin
        R:=applyImage(R, Images.Keys[i], '/images/' +Images.Keys[i], Images.KeyData[Images.Keys[i]]);
        // Form1.mmRubrics.Append(Images.Keys[i]);
        // Form1.mmRubrics.Append(Images.KeyData[Images.Keys[i]]);


      end;

  Result := R;

end;

function TForm1.useAttachments(template: String): String;
   var
   cnt, i : Integer;
   R : String;
begin


  cnt  := Attachments.Count;

  R := template;

  for i:=0 to cnt-1 do
      begin
        R:=applyFileLink(R, Attachments.Keys[i], '/files/' +Attachments.Keys[i],
                            Attachments.KeyData[Attachments.Keys[i]]);
        //Form1.mmRubrics.Append(Attachments.Keys[i]);
        //Form1.mmRubrics.Append(Attachments.KeyData[Attachments.Keys[i]]);


      end;

  Result := R;
end;
















function TForm1.moduleexec(cmd: string): string;
var
  P: TProcess;
  R: string;
  M: TMemo;
  filenam: string;
begin
  showMessage('Запущен модуль '+cmd);
  P := TProcess.Create(Self);
  M := TMemo.Create(Self);
  P.CommandLine := cmd;
  P.Execute;
  while P.Active do ;
  filenam := Copy(cmd, 1, Pos(' ', cmd) - 1) + '.tmp';
  R := '';
  if FileExists(filenam) then
  begin
    M.Lines.LoadFromFile(filenam);
    R := M.Text;
    DeleteFile(filenam);
  end;
  P.Free;
  M.Free;
  Result := R;
end;

function TForm1.usePreset(app: String): string;
var R : String;
begin
  R:=app;
  R:=ApplyVar(R, 'sitename', sqlPresets.FieldByName('sitename').AsString);
  Result:=R;
end;

{{ ======================== РАСШИРЕНИЕ ВОЗМОЖНОСТЕЙ МОДУЛЯМИ ================ }}

function TForm1.useModules(app: string): string;
var C, Start, En_d : integer;
  replacement : String;
  R : String;
  container: String;
begin

 R:=app;
 if chkUseModules.Checked then begin
                          if logger_info then mmRubrics.Lines.Add('ПОДДЕРЖКА МОДУЛЕЙ ВКЛЮЧЕНА');
  C:=0;
  Start := -1;
  En_d := -1;
  while C<Length(r) do
                           begin
                           if Copy(r, C, 1) = DLM_MODULE then
                              begin
                                if Start<0 then Start:=C else
                                  begin
                                   En_d :=C;

                                   if logger_info then mmRubrics.Lines.Add('ОБНАРУЖЕНИЕ МОДУЛЯ...');
                                   container:=Copy(r, Start+1, En_d-Start-1);
                                   ShowMessage(container);
                                   replacement:=moduleexec(container);
                                   r:=StringReplace(r, Copy(r, Start, En_d-Start+1),
                                   replacement, [rfReplaceAll]);
                                   c:=Start+Length(replacement)-1;
                                   Start:=-1;
                                   En_d := -1;
                                  end;
                              end;
                           C:=C+1;
                           Application.ProcessMessages;
                           end;
 end; // else will be not processed
 Result:=R;
end;

function TForm1.owntagexec(container, cmd: string): string;
var
  M: TMemo;
  P: TProcess;
  R: string;
begin
  //ShowMessage('Запущен '+cmd+' для '+container);
  M := TMemo.Create(Self);
  M.Clear;
  M.Text := container;
  M.Lines.SaveToFile(cmd + '.inp');
  P := TProcess.Create(Self);
  P.CommandLine := cmd;
  P.Execute;
  while P.Active do ;
  R := '';
  if FileExists(cmd + '.out') then
  begin
    M.Clear;
    M.Lines.LoadFromFile(cmd + '.out');
    R := M.Text;
  end;
  if FileExists(cmd + '.inp') then DeleteFile(cmd + '.inp');
  if FileExists(cmd + '.out') then DeleteFile(cmd + '.out');
  M.Free;

  if logger_info then mmRubrics.Lines.Add('ВЫЗОВ ИСПОЛНЯЕМОГО ТЕГА<owntagexec>');
  if logger_info then mmRubrics.Lines.Add('КОНТЕЙНЕР');
  if logger_info then mmRubrics.Lines.Add(container);
  if logger_info then mmRubrics.Lines.Add('ОБРАБОТЧИК');
  if logger_info then mmRubrics.Lines.Add(cmd);
  if logger_info then mmRubrics.Lines.Add('РЕЗУЛЬТАТ');
  if logger_info then mmRubrics.Lines.Add(r);
  //showMessage('Результат обработки '+R);
  Result := R;
end;

function TForm1.useOwnTags(app: string): string;
var
  R: string;

  container: string;
  replacement: string;


  tags_list : TStringList;
  tag_name : String;
  t : Integer;
  RE : TRegExpr;
  Matcher : TRegExpr;
  ReplaceFrom : TStringList;
  ReplaceTo   : TStringList;
  i : integer;
begin
  (* ПЕРЕПИСАНО НА РЕГУЛЯРКИ *)
  R:=app;
  (* 1. НАЙДЕМ ВСЕ ПОЛЬЗОВАТЕЛЬСКИЕ ТЕГИ *)
  re := TRegExpr.Create(DLM_OWN_TAG+'([\w]+)'+DLM_OWN_TAG);
  tags_list:=TStringList.Create;

  if re.Exec(R) then begin
       tag_name:=re.Match[1];
       tags_list.Add(tag_name);
       while re.ExecNext do begin
         tag_name := re.Match[1];
         tags_list.Add( tag_name );
         Application.ProcessMessages;
      end;
  end;







        (* 3 СОЗДАДИМ СПИСОК ЧТО НА ЧТО МЕНЯТЬ *)
        ReplaceFrom := TStringList.Create;
        ReplaceTo := TStringList.Create;

        for t:=0 to tags_list.count-1 do begin
                 tag_name:=tags_list[t];

                 (* НАЙДЕМ ВСЕ, ОБРАМЛЕННОЕ ТЕГОМ *)
                 Matcher := TRegExpr.Create(
                        DLM_OWN_TAG+tag_name+DLM_OWN_TAG+
                         '([\d\D\r\n]+)'+
                         DLM_OWN_TAG+'/'+tag_name+DLM_OWN_TAG);

                (* ДЛЯ ВСЕХ СОВПАДЕНИЙ ЗАПУСТИМ ОБРАБОТЧИК ТЕГОВ *)
                if Matcher.Exec(R) then begin
                   container:=Matcher.Match[1];
                   replacement:=owntagexec(container, tag_name);
                   (* ДОБАВИМ В СПИСКИ ЗАМЕН *)
                   ReplaceFrom.Add(container);
                   ReplaceTo.Add(replacement);




                      while Matcher.ExecNext do begin
                            container := Matcher.Match[1];
                            replacement:=owntagexec(container, tag_name);

                            ReplaceFrom.Add(container);
                            ReplaceTo.Add(replacement);

                            Application.ProcessMessages;
                   end;
               end;

        end;

   (* ВЫПОЛНИМ ВСЕ НАЙДЕННЫЕ ПОДСТАНОВКИ *)
  for i:=0 to ReplaceTo.Count - 1 do
      begin
            //ShowMessage(ReplaceFrom[i] + ' меняется на '+ReplaceTo[i]);
            R:=StringReplace(R, ReplaceFrom[i], ReplaceTo[i], [rfReplaceAll, rfIgnoreCase]);


      end;

   (* УДАЛЯЕМ ТЕГИ *)
  for i:=0 to tags_list.Count - 1 do
      begin
            R:=StringReplace(R, DLM_OWN_TAG+tags_list[i]+DLM_OWN_TAG, '', [rfReplaceAll, rfIgnoreCase]);
            R:=StringReplace(R, DLM_OWN_TAG+'/'+tags_list[i]+DLM_OWN_TAG, '', [rfReplaceAll, rfIgnoreCase]);
      end;

  Result := R;
end;



function TForm1.buildSection(sectiontpl: string; sectionUrl: string;
  sectionTitle: string; sectionNote : string; sectionFullText : string;
  items: string): string;
var
  r: string;
begin

  r := sectionTpl;
  r := applyVar(r, 'sectionUrl', sectionUrl );
  r := applyVar(r, 'sectionTitle', sectionTitle );
  r := applyVar(r, 'sectionNote', sectionNote );
  r := applyVar(r, 'sectionFullText', sectionFullText );
  r := applyVar(r, 'items', items );
  r := insSections(insLinks(r));


  if logger_info then mmRubrics.Lines.Add('СБОРКА СЕКЦИИ<buildSection>');
  if logger_info then mmRubrics.Lines.Add('ШАБЛОН СЕКЦИИ');
  if logger_info then mmRubrics.Lines.Add(sectiontpl);
  if logger_info then mmRubrics.Lines.Add('URL СЕКЦИИ');
  if logger_info then mmRubrics.Lines.Add(sectionUrl);
  if logger_info then mmRubrics.Lines.Add('ЗАГОЛОВОК СЕКЦИИ');
  if logger_info then mmRubrics.Lines.Add(sectionTitle);
  if logger_info then mmRubrics.Lines.Add('ЭЛЕМЕНТЫ СПИСКА');
  if logger_info then mmRubrics.Lines.Add(items);
  if logger_info then mmRubrics.Lines.Add('--- РЕЗУЛЬТАТ ---');
  if logger_info then mmRubrics.Lines.Add(R);






  Result := R;
end;

function TForm1.buildPagination(url: string; currentPage: byte;
  pagesTotal: integer; orf: String; ors: String; useO: Boolean;  useTrees : boolean; tree : String): string;
var
  paginator: string;
  page: byte;

  sorted_folder : string;
begin




  paginator := '<div class="paginator">';
  sorted_folder := '';
    if useO then
      begin
           sorted_folder := '/o/'+orf+'-'+ors+'/';
      end;

  if useTrees then
    sorted_folder:=tree+sorted_folder;

  for page := 1 to pagesTotal do   begin




    if currentPage <> page then
    begin
      if page = 1 then
        paginator :=
          paginator + '<a href="{sorted_folder}/section_' + url + '.' + PrefferedExtension.Text + '">1</a> '
      else
        paginator :=
          paginator + '<a href="{sorted_folder}/section_' + url + '_' + IntToStr(page) + '.' + PrefferedExtension.Text +
          '">' + IntToStr(page) + '</a> ';
    end
    else
      paginator := paginator + ' ' + IntToStr(currentPage) + ' ';
  end;


  {/for}
  paginator := paginator + '</div>';

  paginator:=applyvar(paginator, 'sorted_folder', sorted_folder);

  if logger_info then mmRubrics.Lines.Add('СБОРКА ПЕРЕКЛЮЧАТЕЛЯ СТРАНИЦ<buildPagination>');
  if logger_info then mmRubrics.Lines.Add('URL раздела');
  if logger_info then mmRubrics.Lines.Add(url);
  if logger_info then mmRubrics.Lines.Add('Номер текущей');
  if logger_info then mmRubrics.Lines.Add(IntToStr(currentPage));
  if logger_info then mmRubrics.Lines.Add('Всего страниц в разделе');
  if logger_info then mmRubrics.Lines.Add(IntToStr(pagesTotal));

  if logger_info then mmRubrics.Lines.Add('--- РЕЗУЛЬТАТ ---');
  if logger_info then mmRubrics.Lines.Add(paginator);


  Result := paginator;
end;

procedure TForm1.AttendConnection(ASocket: TTCPBlockSocket);
var
  timeout: integer;
  s: string;
  method, uri, protocol: string;
  OutputDataString: string;
  ResultCode: integer;
  content_type: string;
  test_flag : boolean;
begin
  timeout := 120000;
  Application.ProcessMessages;
  //  WebServerLog.Lines.Add('Полученные заголовки, запрошенный браузером документ:');

  //read request line
  s := ASocket.RecvString(timeout);
  WebServerLog.Lines.Add(s);
  method := fetch(s, ' ');
  uri := fetch(s, ' ');
  protocol := fetch(s, ' ');

  //read request headers
  repeat

    s := ASocket.RecvString(Timeout);
    WebServerLog.Lines.Add(s);
    Application.ProcessMessages;
  until s = '';

  // Now write the document to the output stream

  content_type := 'Text/Html';
  if (pos('.css', uri) > 0) then content_type := 'text/css';

  if (pos('.jpg', uri) > 0) then content_type := 'image/jpeg';
  if (pos('.png', uri) > 0) then content_type := 'image/png';
  if (pos('.gif', uri) > 0) then content_type := 'image/gif';

  if (pos('.js', uri) > 0) then content_type := 'application/javascript';

  test_flag := false;
  test_flag := test_flag or (pos('.jpg', uri) > 0);
  test_flag := test_flag or (pos('.gif', uri) > 0);
  test_flag := test_flag or (pos('.png', uri) > 0);

  test_flag := test_flag or (pos('.htm', uri) > 0);
  test_flag := test_flag or (pos('.html', uri) > 0);
  test_flag := test_flag or (pos('.css', uri) > 0);
  test_flag := test_flag or (pos('.js', uri) > 0);

  test_flag := test_flag or ( uri = '/');

  if ( test_flag ) then
  begin
    // Write the output document to the stream
    OutputDataString := OutputHTMLFile(uri) + CRLF;
    // Write the headers back to the client
    ASocket.SendString('HTTP/1.0 200' + CRLF);
    ASocket.SendString('Content-type: ' + content_type + CRLF);
    ASocket.SendString('Content-length: ' + IntToStr(Length(OutputDataString)) + CRLF);
    ASocket.SendString('Connection: close' + CRLF);
    ASocket.SendString('Date: ' + Rfc822DateTime(now) + CRLF);
    ASocket.SendString('Server: HtmlBuilder' + CRLF);
    ASocket.SendString('' + CRLF);

    //  if ASocket.lasterror <> 0 then HandleError;

    // Write the document back to the browser
    ASocket.SendString(OutputDataString);
  end
  else
    ASocket.SendString('HTTP/1.0 404' + CRLF);
end;

procedure TForm1.StartOwnServer;
begin
  ListenerSocket := TTCPBlockSocket.Create;
  ConnectionSocket := TTCPBlockSocket.Create;

  ListenerSocket.CreateSocket;
  ListenerSocket.setLinger(True, 10);
  ListenerSocket.bind('127.0.0.1', '8080');
  ListenerSocket.listen;

  repeat
    Application.ProcessMessages;
    if ListenerSocket.canread(512) then
    begin
      ConnectionSocket.Socket := ListenerSocket.accept;
      WebServerLog.Lines.Add(
        'Выполняем подключение. Код ошибки (0=Успех): ' +
        IntToStr(ConnectionSocket.lasterror));
      AttendConnection(ConnectionSocket);
    end;
  until ListenerSocket.StopFlag or ConnectionSocket.StopFlag;
  ListenerSocket.Free;
  ConnectionSocket.Free;
end;

procedure TForm1.StopOwnServer;
begin
  ListenerSocket.AbortSocket;
  ConnectionSocket.AbortSocket;

end;

{{ ============== Чтение файла с диска / используется веб-сервером =============== }}

function TForm1.OutputHTMLFile(uri: string): string;
var path : String; filename : String; Buf : TMemo;
  r : String;   fullq : String;
begin

  if uri = '/' then uri:='/index.'+PrefferedExtension.text;
  path := sqlPresets.FieldByName('dirpath').AsString;
  Buf:=TMemo.Create(Self);
  r:='';
  fullq:=path+uri;
  if Cache.Values[uri] <> '' then r:=Cache.values[uri] else begin
  if FileExists(fullq) then begin
  Buf.Lines.LoadFromFile(fullq);
  cache.values[uri]:=Buf.text;
  r:=Buf.Text;
  end;
  end;
  Buf.Free;
  result:=r;
end;

function TForm1.buildOwnFields(html: string; p : page_params): string;
var
  r: string;
  i: byte;

begin
  r := html;
  for i := 1 to 7 do
  begin
    r := StringReplace(r, '{f' + IntToStr( i )  + '}',
                          p.user_field_names[i],
      [rfReplaceAll]);
   r := StringReplace(r, '{v' + IntToStr( i )  + '}',
                          p.user_field_values[i],
      [rfReplaceAll]);

  end;



  if logger_info then mmRubrics.Lines.Add('СБОРКА СОБСТВЕННЫХ ПОЛЕЙ<buildOwnFields>');
  if logger_info then mmRubrics.Lines.Add('ВХОД');
  if logger_info then mmRubrics.Lines.Add(html);
  if logger_info then mmRubrics.Lines.Add('--- РЕЗУЛЬТАТ ---');
  if logger_info then mmRubrics.Lines.Add(R);
  Result := r;
end;

function TForm1.prefExtension(lin: string): string;
var
  r: string;
begin
  r := lin;
  r := StringReplace(r, '{ext}', PrefferedExtension.Text, [rfReplaceAll]);

  if logger_info then mmRubrics.Lines.Add('УСТАНОВКА РАСШИРЕНИЯ <prefExtension>');
  if logger_info then mmRubrics.Lines.Add('ВХОД');
  if logger_info then mmRubrics.Lines.Add(lin);
  if logger_info then mmRubrics.Lines.Add('--- РЕЗУЛЬТАТ ---');
  if logger_info then mmRubrics.Lines.Add(R);

  Result := r;
end;

procedure TForm1.localeRUS;
begin
  {НАЧАЛО ЛОКАЛИЗАЦИИ}
  {НАЗВАНИЕ ОКНА ПРОГРАММЫ}
  form1.Caption := 'Генератор статических HTML сайтов';
  {ЗАГОЛОВКИ ВКЛАДОК}
  tabPages.Caption := 'Страницы';
  tabSections.Caption := 'Разделы';
  tabGlobalBlocks.Caption := 'Глобальные блоки';
  tabSpecial.Caption := 'Специальное';
  tabUpdateByFTP.Caption := 'Обновление по FTP';
  tabWebServer.Caption := 'Веб-сервер';
  tabHelp.Caption := 'О программе';
  mmAbout.lines.LoadFromFile('russian_help.txt');
  { translations from corresponding ini}
  loadLocaleFromIni('ru_localization.ini');

end;

procedure TForm1.localeENG;
begin
  {START ENG LOCALE}
  Form1.Caption := 'Generator of static HTML websites';
  {TAB HEADERS}
  tabPages.Caption := 'Pages';
  tabSections.Caption := 'Sections';
  tabGlobalBlocks.Caption := 'Global blocks';
  tabSpecial.Caption := 'Special';
  tabUpdateByFTP.Caption := 'Update By FTP';
  tabWebServer.Caption := 'Web Server';
  tabHelp.Caption := 'About app';
  mmAbout.lines.LoadFromFile('english_help.txt');
  { translations from corresponding ini}
  loadLocaleFromIni('en_localization.ini');
end;

procedure TForm1.localeESP();
begin
  form1.loadLocaleFromIni('es_localization.ini');
end;

procedure TForm1.localeCn();
begin
  loadLocaleFromIni('cn_localization.ini');
end;

procedure TForm1.localeKp();
begin
  loadLocaleFromIni('kp_localization.ini');
end;





procedure TForm1.initTransactionSQL;

var
  isOK : Boolean;
begin



  db_filename := getCurrentDir() + DELIM + sqlite_filename;
  conn.DatabaseName := db_filename; // назначаем имя файла
  form1.Caption:=db_filename;
  try
  //Поскольку мы делаем эту базу данных впервые,
  // проверяем, существует ли уже файл
  isOK := FileExists(conn.DatabaseName);

    if isOK then
    begin



         conn.Open;

         trans.Active:=True;

         conn.ExecuteDirect('End transaction');
         conn.ExecuteDirect('pragma synchronous = 0');
         conn.ExecuteDirect('pragma foreign_keys = off');
         conn.ExecuteDirect('pragma journal_mode = off');

          trans.Active:=True;
         conn.ExecuteDirect('Begin transaction');


         // делать ничего не нужно, обработается при выходе, сообщаем
         SilentMessage('Файл найден!');
         checkConnect(conn, trans, 'initTransactionSQL');


    end

    else

    begin
      // Создаем базу данных и таблицы
      SilentMessage('Создаем базу с нуля');



        // запросы в рамках транзакции


       trans.Active:=True;

         conn.ExecuteDirect('End transaction');
         conn.ExecuteDirect('pragma synchronous = 0');
         conn.ExecuteDirect('pragma foreign_keys = off');
         conn.ExecuteDirect('pragma journal_mode = off');
          trans.Active:=True;
         conn.ExecuteDirect('Begin transaction');

       checkConnect(conn, trans,'initTransactionSQL');
         try
        form1.makeCreationTables(); // запросы на создание таблиц



        // пытаемся выполнить вставку данных

        insertDemoData(temp_sql, conn, trans);






        SilentMessage(msgBaseSuccess);
          except
            SilentMessage(msgErrorCreating);
          end;
        end;
      except
        SilentMessage(msgCantCheckDbFile);
      end;

end;















procedure TForm1.makeSqlActive;

begin
    sqlPresets.Active:=true;
    sqlBlocks.Active:=true;
    sqlSections.Active:=true;
    sqlContent.Active:=true;
    sqlCssStyles.Active:=true;
    sqlJsScripts.Active:=true;
    sqlTags.Active:=true;
    sqlTagsPages.Active:=true;
    sqlMenu.Active:=true;
    sqlMenuItem.Active:=true;
    sqlGetAllImages.Active:=true;
    sqlGetAllAttachments.Active:=true;

end;

procedure TForm1.makeSqlInactive;

begin

 // showMessage('Сохраняем базу');
  AutoSaveDb();
 // showMessage('База сохранена');

  sqlPresets.Active:=false;
  sqlContent.Active:=false;
  sqlCssStyles.Active:=false;
  sqlSections.Active:=false;
  sqlBlocks.Active:=false;
  sqlJsScripts.Active:=false;
  sqlTags.Active:=false;
  sqlTagsPages.Active:=false;
  sqlMenu.Active:=false;
  sqlMenuItem.Active:=false;
  sqlGetAllImages.Active:=false;
  sqlGetAllAttachments.Active:=false;

  conn.Close;
end;

procedure TForm1.viewPagesSQL;
begin
open_sql(    'select * from content', sqlContent);
ds_Content.AutoEdit:=True;
SilentMessage('выполнена загрузка страниц!');
end;

procedure TForm1.viewSectionsSQL;
  begin
  open_sql(  'select * from section', sqlSections);
  SilentMessage('выполнена загрузка разделов!');
  end;

procedure TForm1.viewBlocksSQL;
begin

  open_sql(  'select * from block', sqlBlocks);

  SilentMessage('выполнена загрузка блоков!');
end;

procedure TForm1.viewPresetsSQL;
begin
  open_sql ( 'select * from preset' , sqlPresets);
  SilentMessage('выполнена загрузка настроек!');
end;

procedure TForm1.viewCssSQL;
begin

  open_sql( 'select * from css', sqlCssStyles);

  //ds_Css.AutoEdit:=true;
  SilentMessage('выполнена загрузка таблиц стилей');
end;

procedure TForm1.viewJsSQL;
begin
    open_sql( 'select * from js', sqlJsScripts);

end;

procedure TForm1.viewTablesSQL;
begin
 checkConnect(conn, trans,'viewTablesSQL');
  form1.makeSqlActive(); // активируем запросы
  form1.viewPagesSQL();
  form1.viewBlocksSQL();
  form1.viewPresetsSQL();
  form1.viewSectionsSQL();
  form1.viewCssSQL();
  form1.viewJsSQL();
  form1.viewTagsSQL();
  form1.viewMenuSQL();
  form1.viewMenuItemSQL();
  form1.viewImagesSQL();
  form1.viewAttachmentsSQL();
end;

procedure TForm1.viewTagsSQL;
begin
  open_sql(    'select * from tags', sqlTags);
  ds_Tags.AutoEdit:=True;
  SilentMessage('выполнена загрузка страниц!');
end;

procedure TForm1.viewTagsPagesSQL;
begin
  //open_sql(    'select * from tags_pages', sqlTagsPages);
  ds_Tags_Pages.AutoEdit:=True;
  SilentMessage('выполнена загрузка страниц!');
end;

procedure TForm1.viewMenuSQL;
begin
  open_sql( 'select * from menu', sqlMenu);
  ds_Menu.AutoEdit:=true;
end;

procedure TForm1.viewMenuItemSQL;
begin
  open_sql( 'select * from menu_item', sqlMenuItem);
  ds_MenuItem.AutoEdit:=true;
end;

procedure TForm1.viewImagesSQL;
begin
   try
       open_sql( 'select * from images', sqlGetAllImages);
       ds_Images.AutoEdit:=true;
   except
       on E: Exception do
             ShowMessage( 'Error: '+ E.ClassName + #13#10 + E.Message );
   end;

end;

procedure TForm1.viewAttachmentsSQL;
begin
     try
       open_sql( 'select * from attachments', sqlGetAllAttachments);
       ds_Attachments.AutoEdit:=true;
   except
       on E: Exception do
             ShowMessage( 'Error: '+ E.ClassName + #13#10 + E.Message );
   end;
end;



(*
переназначает источник данных с tdbf на sqlite  - ТАБЛИЦА КОНТЕНТ
*)
procedure TForm1.changeDataSourcesContent;
begin
  fID.DataSource:=form1.ds_Content;  // поле идент. страницы
  fCaption.DataSource:=form1.ds_Content; //поле заголовок
  // fContent is editor
  fContent.DataSource:=form1.ds_Content; // поле контент

  //dbContentLook.DataSource:=form1.ds_Content; // список страниц


  ds_Content.AutoEdit:=True;
  dbNav_Content.DataSource:=form1.ds_Content; // листалка
end;


(*
переназначает источник данных с tdbf на sqlite  - ТАБЛИЦА СЕКЦИИ
*)
procedure TForm1.changeDataSourcesSections;
begin
  dbeSectionId.DataSource:=form1.ds_Sections;  // поле идент. раздела
  dbeSectionCaption.DataSource:=form1.ds_Sections; // поле название раздела
  dbmSectionNote.DataSource:=form1.ds_Sections; // поле шаблон раздела


  //dbSectionsLook.DataSource:=form1.ds_Sections; // список секций

  dbNav_Sections.DataSource:=form1.ds_Sections; // листалка
end;

(*
переназначает источник данных с tdbf на sqlite  - ТАБЛИЦА БЛОКИ
*)
procedure TForm1.changeDataSourcesBlocks;
begin
  dbeBlockId.DataSource:=form1.ds_Blocks;  // поле идент. раздела
  dbeBlockNote.DataSource:=form1.ds_Blocks; // поле название раздела
  dbeBlockHtml.DataSource:=form1.ds_Blocks; // поле шаблон раздела
  //dbBlocksLook.DataSource:=form1.ds_Blocks; // список блоков

  dbNav_Blocks.DataSource:=form1.ds_Blocks; // листалка
end;

(*
переназначает источник данных с tdbf на sqlite  - ТАБЛИЦА ПРЕСЕТЫ(НАСТРОЙКИ)
*)
procedure TForm1.changeDataSourcesPresets;
begin
  dbePreset.DataSource:=form1.ds_Presets;  // идент. настроек
  dbeSiteName.DataSource:=form1.ds_Presets; // имя сайта
  dbeSiteDirectory.DataSource:=form1.ds_Presets; // каталог
  dbmHeadTemplate.DataSource:=form1.ds_Presets; // шаблон заголовка
  dbmBodyPagesTemplate.DataSource:=form1.ds_Presets; // шаблон страниц
  dbmBodySectionsTemplate.DataSource:=form1.ds_Presets;// шаблон секции
  dbmTemplateOfItem.DataSource:=form1.ds_Presets; // шаблон списка


  //dbPresetsLook.DataSource:=form1.ds_Presets;
  dbNav_Presets.DataSource:=form1.ds_Presets; // листалка
end;

procedure TForm1.changeDataSourcesCss;
begin
 // dbeCssId.DataSource:=form1.ds_Css;
 // dbmCssStyle.DataSource:=form1.ds_Css;
 // dbNav_Css.DataSource:=form1.ds_Css;
end;

procedure TForm1.changeDataSourcesTags;
begin
  dbeTagId.DataSource:=ds_Tags;
  dbeTagCaption.DataSource:=ds_Tags;
  dbNav_Tags.DataSource:=ds_Tags;

end;

procedure TForm1.changeDataSourcesTagsPages;
begin
  dbeTagsPages_id_tag_page.DataSource:=ds_Tags_Pages;
  dbeTagsPages_id_tag.DataSource:=ds_Tags_Pages;
  dbeTagsPages_id_page.DataSource:=ds_Tags_Pages;
  dbNav_TagsPages.DataSource:=ds_Tags_Pages;
end;

procedure TForm1.changeDataSourcesImages;
begin

  try
    form1.dbeImageId.DataSource:=ds_Images;
    form1.dbeImageCaption.DataSource:=ds_Images;
    form1.dbNav_Images.DataSource:=ds_Images;
  except
    on E: Exception do
             ShowMessage( 'Error: '+ E.ClassName + #13#10 + E.Message );
  end;

end;

procedure TForm1.changeDataSourcesAttachments;
begin
     try
      form1.dbeAttachmentId.DataSource:=ds_Attachments;
      form1.dbeAttachmentCaption.DataSource:=ds_Attachments;
      form1.dbNav_Attachments.DataSource:=ds_Attachments;
     except
           on E: Exception do
              ShowMessage( 'Error: '+ E.ClassName + #13#10 + E.Message );
     end;

end;


procedure TForm1.makeCreationTables;
begin





         try

           checkConnect(conn, trans, 'makeCreationTables');

            createPagesSQL(conn, trans);
            createSectionsSQL(conn, trans);
            createBlocksSQL(conn, trans);
            createPresetsSQL(conn, trans);
            createCssSQL(conn, trans);
            createJsSQL(conn, trans);
            createTagsSQL(conn, trans);
            createTagsPagesSQL(conn, trans);
            createMenusSQL(conn, trans);
            createItemsForMenuSQL(conn, trans);
            createImagesSQL(conn, trans);
            createAttachmentsSQL(conn, trans);

        except
          on E: Exception do
             ShowMessage( 'Error: '+ E.ClassName + #13#10 + E.Message );
         end;


end;

procedure TForm1.changeDataSources;
begin
  try
      with Form1 do begin
           changeDataSourcesContent();
           changeDataSourcesSections();
           changeDataSourcesBlocks();
           changeDataSourcesPresets();
           changeDataSourcesCss();
           changeDataSourcesJs();
           changeDataSourcesTags();
           changeDataSourcesTagsPages();
           changeDataSourcesImages();
           changeDataSourcesAttachments();

      end;
  except
   on E: Exception do
    ShowMessage( 'Error: '+ E.ClassName + #13#10 + E.Message );
  end;
end;











procedure TForm1.SilentMessage(msg: String);
begin
  if (not SilentMode) then ShowMessage(msg);
end;

procedure TForm1.AutoSaveDb; // автосохранение, исп. в FormClose


begin

   try

       if sqlPresets.Active then sqlPresets.ApplyUpdates();

       if sqlContent.Active then sqlContent.ApplyUpdates();

       if sqlBlocks.Active then sqlBlocks.ApplyUpdates();

       if sqlSections.Active then sqlSections.ApplyUpdates();

       if sqlCssStyles.Active then sqlCssStyles.ApplyUpdates();


       if sqlGetAllImages.Active then sqlGetAllImages.ApplyUpdates;

       if sqlGetAllAttachments.Active then sqlGetAllAttachments.ApplyUpdates();

       trans.Commit();
   except
   on E: Exception do
             ShowMessage( 'Error: '+ E.ClassName + #13#10 + E.Message );
   end;


end;

(* ========================== новая сборка страниц ====================== *)

procedure TForm1.doJoinPages;
var
        page : page_params;   filenam  : String;
        fbuffer : TStringList;
        headT, bodyT : String;
        page_param_num : byte;
        cnt, k : byte;

        tagsHere : TagsMap;
        sql_for_tags : TSQLQuery;
        tags_html : String;
        processDir : TProcess;
begin



   (* Загружаем шаблоны из файлов, если сделан такой выбор *)
  fBuffer := TStringList.Create();

 if chkGetBlocksFromFile.Checked then
       begin
      fbuffer.LoadFromFile(GetCurrentDir + DELIM+'parts'+DELIM+'head.tpl');
      headT:=fbuffer.Text;
      fbuffer.LoadFromFile(GetCurrentDir + DELIM+'parts'+DELIM+'body.tpl');
      bodyT:=fbuffer.Text;
    end;

 fbuffer.Free;


   cnt:=form1.Titles.Lines.Count;
   pBar.Max:=cnt;
   pBar.Step:=1;
   pBar.Min:=1;
   pBar.Position:=1;
   k:=0;

   (* Сборка страниц *)
   sqlJoin.Open;
   sqlJoin.First;

   while not sqlJoin.EOF do
         begin

            lbProgress.Caption:='Сборка страницы '+IntToStr(k+1)+' / '+IntToStr(cnt);

            page.id := sqlJoin.FieldByName('id').AsString;
            page.title := sqlJoin.FieldByName('caption').AsString;
            page.body := sqlJoin.FieldByName('content').AsString;
            page.section_id := sqlJoin.FieldByName('section_id').AsString;
            page.section_title := sqlJoin.FieldByName('section').AsString;
            page.sitename := sqlJoin.FieldByName('sitename').AsString;
            page.dirpath := sqlJoin.FieldByName('dirpath').AsString;
            page.dt:=sqlJoin.FieldByName('dt').AsDateTime;
            page.tree:=sqlJoin.FieldByName('tree').AsString;

            //получить теги страницы

            sql_for_tags:=TSQLQuery.Create(Self);

            sql_for_tags.SQLConnection:=conn;

            sql_for_tags.Transaction:=trans;

            tagsHere:=TagsMap.Create;

            sql_for_tags.Active:=false;

            loadTagsForPages(page.id, tagsHere, sql_for_tags, trans);

            tags_html:=tagsInPageHtml(tagsHere, form1.PrefferedExtension.text);

            tagsHere.Free;

            sql_for_tags.Free;

            page.tags:=tags_html;



            for page_param_num:=1 to 7 do
              begin
                page.user_field_names[ page_param_num ]:=
                                       sqlJoin.FieldByName('ufn'+IntToStr(page_param_num)).AsString;
                page.user_field_values[ page_param_num ]:=
                                       sqlJoin.FieldByName('uf'+IntToStr(page_param_num)).AsString;

              end;


                         if chkGetBlocksFromFile.Checked then
                             page.headtpl := headT
                         else
                             page.headtpl := sqlJoin.FieldByName('headtpl').AsString;
                         if chkGetBlocksFromFile.Checked then
                             page.bodytpl := bodyT
                         else
                           page.bodytpl := sqlJoin.FieldByName('bodytpl').AsString;


            page.sectiontpl := sqlJoin.FieldByName('itemtpl').AsString;


            page.dir:=sqlJoin.FieldByName('dirpath').AsString;

            if chkUseTrees.checked then
              begin
                 processDir:=TProcess.Create(Self);
                 processDir.CommandLine:='/usr/bin/bash -c "mkdir -p '+page.dir+page.tree+'"';
                 processDir.Execute;
                 processDir.WaitOnExit();
                 processDir.Free;
                 filenam:=page.dir+page.tree+DELIM+page.id+'.'+prefferedExtension.Text;
              end

            else

            filenam := page.dirpath+DELIM+page.id+'.'+PrefferedExtension.Text;

           if page.dir <> '' then
                      makePageJoin( page, filenam);


         sqlJoin.Next;
         Application.ProcessMessages;

         inc(k);
         pBar.Position:=k;
         //Sleep(10000);
         end;
   sqlJoin.First;




end;

procedure TForm1.makePageJoin(page: page_params; filenam: String) ;
var
  id : String;
  t : String;
  Rnr : Render;

  Pipeline : TFuncStrArray;

begin
 Rnr:=Render.Create;



    if FileExists(filenam) then DeleteFile(filenam);

    Buffer.Clear;
    // TODO maybe separate template
    Buffer.Lines.Add('<!DOCTYPE html>');
    Buffer.Lines.Add('<html><head>{header}');
    Buffer.Lines.Add('</head><body>');
    Buffer.Lines.Add('{body}');
    Buffer.Lines.Add('</body></html>');
    Rnr.setTemplate(Buffer.Text);
    Rnr.setVar('header',
                        insparamstohead(
                         buildHead(page.title, page.headtpl),
                                    page));

     t:=page.bodytpl;
     Rnr.setVar('body',
                       insParamsToBody(
                             buildBody(page.title, page.body, t),
                           page)
                       );
     Buffer.Lines.Text:= Rnr.getHtml();


     // постобработка


     ComposeStrFunc( Pipeline, @useEmojies);
     ComposeStrFunc( Pipeline, @useAttachments);
     ComposeStrFunc( Pipeline, @useImages);
     ComposeStrFunc( Pipeline, @remotes_urls);
     ComposeStrFunc( Pipeline, @useMenus);
     ComposeStrFunc( Pipeline, @useModules);
     ComposeStrFunc( Pipeline, @useOwnTags);
     ComposeStrFunc( Pipeline, @insertSectionsAndLinks);
     ComposeStrFunc( Pipeline, @useBlocks);


     Buffer.Lines.Text := buildOwnFields(buffer.Lines.Text, page);

     Buffer.Lines.Text :=  ApplyStringFunctions(Buffer.Lines.Text, Pipeline);

     // add custom columns with prefix custom_
     Buffer.Lines.Text:=useCustomFields( Buffer.Lines.Text, page.id);


                              // id of pages
                              id := ExtractFileName(filenam);
                              id := Copy(id, 1, Pos('.', id)-1);
                              Buffer.Text:=StringReplace(Buffer.Text, '{id}',
                              id , [rfReplaceAll]);

                              Writer.addToJob(Buffer.Lines.Text, filenam);

   Rnr.Free;
end;

function TForm1.buildItem(itemtpl: string; itemUrl: string; itemTitle: string; itemDt : TDateTime; ur : user_records; tree : String; tags_html : String): string;
var

  fi : byte;
  Rnr : Render;
  R : String;
begin
  Rnr:=Render.Create;
  Rnr.setTemplate(itemTpl);

  if chkUseTrees.checked then
     itemUrl := tree+ DELIM+itemUrl;

 // showMessage(itemUrl);

  // fix relative links
  if itemUrl[1]<>'/' then itemUrl:='/'+itemUrl;

  Rnr.setVar('itemUrl', itemUrl);
  Rnr.setVar('itemTitle', itemTitle);
  Rnr.setVar('itemDt', DateTimeToStr(itemDt));
  Rnr.setVar('itemTags', tags_html);

  // применяем пользовательские поля, если есть
  for fi:=1 to 7 do begin
      Rnr.setVar('f'+IntToStr(fi), ur[fi].name);
      Rnr.setVar('v'+IntToStr(fi), ur[fi].value);
  end;


  R:=Rnr.getHtml();
  Rnr.Free;

  r := insSections(insLinks(r));
  r := prefExtension(r);

  Result := R;
end;




procedure TForm1.doSections;
var
  pagesTotal : Integer;

  PagesinRubrics : Integer;
  itemsPerPage : Integer;
  page : byte;




  rubrication_query : String;
  current_preset : String;

  selected_ors : String; // выбранное поле для сортировки
  selected_orf : String; // выбранный порядок сортировки
  useo  : boolean; // упорядочение по умолчанию, не добавлять папки


  orfs   : TStringList;
  o : Integer;
begin

 orfs := TStringList.Create;
 orfs.Clear;
 orfs.Add('dt');
 orfs.Add('caption');



// некоторые данные нужно считать 1 раз
// так как они будут нужны многократно
  scanLinks();  // ссылки
  scanSections(); // секции



  itemsPerPage := StrToInt(edItemsPerPage.Text);
  sqlCounter.Open; // Число страниц в каждом разделе
  sqlCounter.First;
  while not sqlCounter.EOF do
        begin
             Current_Preset := sqlCounter.FieldByName('preset_id').AsString;

             PagesTotal:=sqlCounter.FieldByName('cnt').AsInteger;
             if pagesTotal <= itemsPerPage then
                           pagesInRubrics:=1
             else
                 begin
                      pagesInRubrics := pagesTotal div itemsPerPage;
                      if (pagesTotal mod itemsPerPage)>0 then inc(pagesInRubrics);
                 end;



                application.processmessages();



                 pBar.Max:=pagesInRubrics;
                 pBar.Step:=1;
                 pBar.Min:=1;
                 pBar.Position:=1;


                for page := 1 to pagesInRubrics do
                    begin

                       lbProgress.Caption:='Генерация рубрики '+sqlCounter.FieldByName('section').AsString+'  :  '+IntToStr(page)+' / '+IntToStr(pagesInRubrics);
                       sqlRubrication.Close;



                       // --------------------------------
                       rubrication_query := rubrication_start;


                       selected_ors := pors[Current_Preset]; // порядок сортировки
                       selected_orf := porf[Current_Preset]; // поле сортировки





                       makeRubricationUsingSorts(page, itemsPerPage, pagesInRubrics, rubrication_query, selected_orf, selected_ors, false);

                       for o:=0 to orfs.Count-1 do
                         begin



                              selected_orf := orfs.Strings[o];
                              selected_ors := 'ASC';
                              sqlRubrication.Close;
                              makeRubricationUsingSorts(page, itemsPerPage, pagesInRubrics, rubrication_query, selected_orf, selected_ors, true);

                              selected_ors := 'DESC';
                              sqlRubrication.Close;
                              makeRubricationUsingSorts(page, itemsPerPage, pagesInRubrics, rubrication_query, selected_orf, selected_ors, true);

                         end;



                     // -----------------------
                    end;
         sqlCounter.Next;
         Application.ProcessMessages;
        end;










     end;











procedure TForm1.doSitemap;

procedure getInfoAboutSection(id : String; var section, tree  : String);
var sq : TSQLQuery;
begin
 sq:=TSqlQuery.Create(self);
 sq.Transaction:=trans;
 sq.SQLConnection:=conn;
 sq.SQL.Text:='select * from section where id="'+id+'" limit 1';
 sq.ExecSQL;
 sq.Active:=true;
 sq.first;
 section:=sq.FieldByName('section').AsString;
 tree:=sq.FieldByName('tree').AsString;

 sq.free;
 end;

function TraverseNode(Node : TTreeNode; level : Integer) : String;
var
  id : String;
  r : String;
  section : String;
  listItem, tree, filler : String;
  Rnr :  Render;
  childNode : TTreeNode;
begin

  if node = NIL then exit;
  id:=node.text;
  getInfoAboutSection(id, section, tree);
  filler:=StringOfChar('-', level);
  Rnr:=Render.Create;
  Rnr.setTemplate(
  filler + '<a href="{tree}/section_{id}.{ext}">{section}</a><br/>');
             Rnr.setVar('id', id);
             Rnr.setVar('section', section);
             Rnr.setVar('tree', tree);
             Rnr.setVar('ext', form1.PrefferedExtension.text);
             listItem:=Rnr.getHtml();
  Rnr.Free;
  R:=listItem;
  if Node.HasChildren then
      begin
        childNode:=Node.GetFirstChild;
        while childNode<>NIL do
         begin
              R:=R+TraverseNode(childNode, level+1);
              childNode:=childNode.GetNextSibling;
         end;
      end;
  Result:=R;
end;


var
  sitemap_param : page_params;
  k, cnt : byte;

  level : Integer;
  Rnr : Render;
  RootNode : TTreeNode;
begin
   form1.refreshSectionTree;

  Rnr:=Render.create;
  RootNode:=tvSections.Items[0];
  sitemap_param.body:=TraverseNode(RootNode, 0);

  sitemap_param.headtpl:=sqlPresets.FieldByName('headtpl').AsString;
  sitemap_param.title:='Карта сайта';

  sitemap_param.bodytpl:=sqlPresets.FieldByName('bodytpl').AsString;
  makePageJoin( sitemap_param,
  sqlPresets.FieldByName('dirpath').AsString+DELIM +'sitemap.'+form1.PrefferedExtension.Text);


  Rnr.Free;


end;

procedure TForm1.doTagsMap;
var
  sq : TSqlQuery;
  tm : TagsMap;
  tags_html: String;
  doc : String;
  doc_path : String;
  i : Integer;
  pm : PagesMap;
  item_tag_tpl : String;
  headtpl : String;
  tags_tpl : String;
  items    : String;
  head, body : String;

begin
  sq := TSqlQuery.Create(self);
  sq.transaction:=form1.trans;
  sq.SQLConnection:=form1.conn;

  tm:=TagsMap.Create;

  loadAllTagsForSitemap(tm, sq, trans);

  tags_html:=tagsInSitemap(tm);


  head:=ApplyVar( sqlPresets.FieldByName('headtpl').AsString, 'title', 'Теги');

  body:=tags_html;

  doc_path:=sqlPresets.FieldByName('dirpath').AsString+DELIM +'all_tags.'+form1.PrefferedExtension.Text;

  doc:='<html><head>'+head+'</head><body>'+body+'</body></hmtl>';

  doc:=useMenus(usePreset(useModules(
                         useOwnTags(
                                    insertSectionsAndLinks(
                                                           useBlocks(doc)
                                                    )
                                       ))));

  Writer.AddToJob( doc, doc_path);


  if Not DirectoryExists( sqlPresets.FieldByName('dirpath').AsString+DELIM+'/tags') then
         CreateDir(sqlPresets.FieldByName('dirpath').AsString+DELIM+'/tags');


  for i:=0 to tm.Count-1 do
    begin
         sq.Close;

         pm:=PagesMap.Create;
         loadPagesByTag(tm.Keys[i], pm, sq, trans);
        // ShowMessage( tm.Keys[i] );

         item_tag_tpl:=sqlPresets.FieldByName('item_tag_tpl').AsString;
        // showMessage(item_tag_tpl);

         items:=PagesWithTag(pm, item_tag_tpl, form1.PrefferedExtension.text, chkUseTrees.Checked);

        // ShowMessage(items);


         headtpl:=sqlPresets.FieldByName('headtpl').AsString;

         tags_tpl:=sqlPresets.FieldByName('tags_tpl').AsString;

         head:= applyVar(headtpl, 'title',  tm.Data[i].tag_caption);
         head:=useOwnTags(useBlocks(head));

         body:= applyVar(tags_tpl, 'tagCaption', tm.Data[i].tag_caption);
         body:= applyVar(body, 'items', items);
         body:=useOwnTags(useBlocks(body));



         doc:='<html><head>'+head+'</head><body>'+body+'</body></hmtl>';
         doc:=useMenus(usePreset(useModules(
                         useOwnTags(
                                    insertSectionsAndLinks(
                                                           useBlocks(doc)
                                                    )
                                       ))));

         doc_path:=sqlPresets.FieldByName('dirpath').AsString+DELIM +'/tags/'+tm.Keys[i]+'.'+form1.PrefferedExtension.Text;
         writer.AddToJob( doc, doc_path);

         pm.Free;
    end;

  tm.Free;


  
  sq.Free;
end;

function TForm1.insertSectionsAndLinks(str: string): string;
begin
  Result:= insSections(insLinks(str));
end;

procedure TForm1.scanBlocks;
var k : byte;   i : integer;
begin
    k:=0;
             Blocks.Clear;

   sqlBlocks.First();
   while not sqlBlocks.EOF do
         begin
           Blocks.AddPair( sqlBlocks.FieldByName('id').AsString, sqlBlocks.FieldByName('markup').AsString  );
           sqlBlocks.Next();
           inc(k);
           Application.ProcessMessages();
         end;
   sqlBlocks.First();
   SilentMessage('ГЛОБАЛЬНЫХ БЛОКОВ '+IntToStr(k));

   lvBlocks.Clear;
   for i:=0 to Blocks.Count-1 do
     begin
        lvBlocks.AddItem(  Blocks.Names[i] , nil);
     end;

end;

procedure TForm1.scanPresets;
  var k : byte;   i : integer;
begin
    k:=0;
    SitePresets.Clear;
    porf.Clear;
    pors.Clear;
   sqlPresets.First();
   while not sqlPresets.EOF do
         begin
           pors.add(
                    sqlPresets.FieldByName('id').AsString,
                    sqlPresets.FieldByName('ors').AsString
           );
           porf.add(
                    sqlPresets.FieldByName('id').AsString,
                    sqlPresets.FieldByName('orf').AsString
           );

           SitePresets.lines.add( sqlPresets.FieldByName('id').AsString);
           sqlPresets.Next();
           inc(k);
           Application.ProcessMessages;
         end;
   sqlPresets.First();

   lvPresets.Clear;
   for i:=0 to sitePresets.Lines.Count-1 do
     begin
        lvPresets.AddItem( sitePresets.lines[i], nil);
     end;
end;

procedure TForm1.scanTags;
var i : Integer;
begin
   Tags.Clear;
   sqlTags.First;
   while not sqlTags.EOF do begin
     Tags.Add(
              sqlTags.FieldByName('tag_id').AsString,
              sqlTags.FieldByName('tag_id').AsString
              );

   sqlTags.Next;
   end;
   sqlTags.First;

    // to interface


     for i:=0 to Tags.Count-1 do
      begin
        lvTags.AddItem(Tags.Keys[i], nil);
        application.ProcessMessages;
      end;

end;

procedure TForm1.scanImages;
var i : Integer;
begin

  try

   Images.Clear;
   sqlGetAllImages.First;
   while not sqlGetAllImages.EOF do begin
     Images.Add(
              sqlGetAllImages.FieldByName('image_id').AsString,
              sqlGetAllImages.FieldByName('image_caption').AsString
              );

   sqlGetAllImages.Next;
   end;
   sqlGetAllImages.First;

    // to interface


     for i:=0 to Images.Count-1 do
      begin
        lvImages.AddItem(Images.Keys[i], nil);
        application.ProcessMessages;
      end;

  except
        on E: Exception do
             ShowMessage( 'Error: '+ E.ClassName + #13#10 + E.Message );
  end;
end;

procedure TForm1.doScan;
begin
  Form1.Enabled:=False;

  if sqlPresets.Active then
  sqlPresets.ApplyUpdates();

  if sqlContent.Active then
  sqlContent.ApplyUpdates();


  if sqlSections.Active then
  sqlSections.ApplyUpdates();

  if sqlBlocks.Active then
  sqlBlocks.ApplyUpdates();

  if sqlCssStyles.Active then
  sqlCssStyles.ApplyUpdates();

  if sqlJsScripts.Active then
  sqlJsScripts.ApplyUpdates;

  if sqlTags.Active then
  sqlTags.ApplyUpdates;

  if sqlTagsPages.Active then
  sqlTagsPages.ApplyUpdates;

  if sqlMenu.Active then
  sqlMenu.ApplyUpdates;

    if sqlMenuItem.Active then
  sqlMenuItem.ApplyUpdates;

    if sqlGetAllImages.Active then
  sqlGetAllImages.ApplyUpdates;

    if sqlGetAllAttachments.Active then
  sqlGetAllAttachments.ApplyUpdates;


  sqlContent.Refresh;
  sqlSections.Refresh;
  sqlPresets.Refresh;
  sqlBlocks.Refresh;
  sqlCssStyles.Refresh;
  sqlJsScripts.Refresh;
  sqlTags.Refresh;
  sqlTagsPages.Refresh;
  sqlMenu.Refresh;
  sqlMenuItem.Refresh;
  sqlGetAllImages.Refresh;
  sqlGetAllAttachments.Refresh;



  scanLinks();
  scanSections();
  scanBlocks();
  scanPresets();
  scanCss();
  scanJs();
  scanTags();
  scanTagsPages();
  scanImages();
  scanAttachments();

  form1.refreshContentTree();
  form1.refreshSectionTree();

  updateCustomColumns();

  Form1.Enabled:=True;
end;



procedure TForm1.editor_win_show(var sql: TSQLQuery; field: String);

  var fE : TfrmEditor;
begin

  if sql.Active then sql.ApplyUpdates();


  fE:=TfrmEditor.Create(Self);
  fE.setMarkup( sql.FieldByName(field).AsString);
  fE.ShowModal();
  conn.Open;
  trans.Active:=true;

  sql.Edit;
  sql.FieldByName(field).AsString:=fE.getMarkup();

  fE.Close();
  fE.Free;

end;

procedure TForm1.doCssTables;
var
  cnt, k : byte;
  isModuleUsed : boolean;
  doc : String;
  doc_path : String;
begin
  isModuleUsed:=form1.chkUseModules.Checked;

  cnt:=CssTitles.Count;
  pBar.Max:=cnt;
  pBar.Step:=1;
  pBar.Min:=1;
  pBar.Position:=1;
  k:=0;

  sqlCssStyles.First;

  while not sqlCssStyles.Eof do
   begin
     lbProgress.Caption:='Сборка CSS '+IntToStr(k+1)+' / '+IntToStr(cnt);
     doc:=sqlCssStyles.FieldByName('css_style').AsString;
     doc_path:=sqlCssStyles.FieldByName('css_path').AsString;
     if isModuleUsed then
        begin
             doc:=useModules(doc);
             doc:=useOwnTags(doc);
             doc:=useMenus(doc);
        end;
     writer.AddToJob( doc , doc_path );

     sqlCssStyles.Next;
     Application.ProcessMessages;
     inc(k);
     pBar.Position:=k;
   end;
  sqlCssStyles.First;
end;

procedure TForm1.scanJs;
var k : integer;

begin
   jsTitles.clear;
   lvJsScripts.clear;

   if not sqlJsScripts.Eof then
         begin




  sqlJsScripts.First;
  while not sqlJsScripts.Eof do
   begin
     JsTitles.AddPair( sqlJsScripts.FieldByName('js_id').AsString, '');
     sqlJsScripts.Next;
     Application.ProcessMessages;
   end;
  sqlJsScripts.First;


  for k:=0 to JsTitles.Count-1 do
    begin
       lvJsScripts.AddItem( jsTitles.Names[k], nil );
       Application.ProcessMessages;
    end;
          end;
end;

procedure TForm1.doJs;
var cnt, i : Byte;
begin

  cnt:=JsTitles.Count;
  pBar.Max:=cnt;
  pBar.Step:=1;
  pBar.Min:=1;
  pBar.Position:=1;

  sqlJsScripts.First;
  i:=0;
  while not sqlJsScripts.Eof do
   begin
     lbProgress.Caption:='Генерация скриптов '+IntToStr(i+1)+' / '+IntToStr(cnt);
     Writer.AddToJob( sqlJsScripts.FieldByName('js_file').AsString,
            sqlJsScripts.FieldByName('js_path').AsString );
     sqlJsScripts.Next;
     Application.ProcessMessages;
     inc(i);
     pBar.Position:=i;

   end;
  sqlJsScripts.First;
end;

procedure TForm1.changeDataSourcesJs;
begin
 try
  dbeJsScriptId.DataSource:=ds_JsScripts;
  dbeScriptPath.DataSource:=ds_JsScripts;
  dbmJsScriptFile.DataSource:=ds_JsScripts;
 finally
 end

end;

{ Processing of images. Must retrieve images from blob field image_data
and writes it to destination folder }
procedure TForm1.doImages;
var cnt, i : Byte;
  image_dir : String;
begin

   image_dir := sqlJoin.FieldByName('dirpath').AsString + '/images/';

   if not DirectoryExists(image_dir) then
    CreateDir(image_dir);


  cnt:=Images.Count;
  pBar.Max:=cnt;
  pBar.Step:=1;
  pBar.Min:=1;
  pBar.Position:=1;




  sqlGetAllImages.First;
  i:=0;
  while not sqlGetAllImages.Eof do
   begin
     lbProgress.Caption:='Генерация картинок '+IntToStr(i+1)+' / '+IntToStr(cnt);


     if (False = sqlGetAllImages.FieldByName('image_data').IsNull) then
                                begin
     DBImage.Picture.SaveToFile( image_dir +
                                 sqlGetAllImages.FieldByName('image_id').AsString);
                                 end;
     sqlGetAllImages.Next;
     Application.ProcessMessages;
     inc(i);
     pBar.Position:=i;

   end;
  sqlGetAllImages.First;
end;

procedure TForm1.doAttachments;
var
  cnt, i : Byte;
  attachment_dir : String;
  filename : String;
  full_path : String;
  blobField : TBlobField;

begin

   attachment_dir := sqlJoin.FieldByName('dirpath').AsString + '/files/';

   if not DirectoryExists(attachment_dir) then
    CreateDir(attachment_dir);


  cnt:=Attachments.Count;
  pBar.Max:=cnt;
  pBar.Step:=1;
  pBar.Min:=1;
  pBar.Position:=1;




  sqlGetAllAttachments.First;
  i:=0;
  while not sqlGetAllAttachments.Eof do
   begin
                                  // write not nulled
     if (False = sqlGetAllAttachments.FieldByName('attachment_data').IsNull) then
                                  begin

     filename :=   sqlGetAllAttachments.FieldByName('attachment_id').AsString;

     full_path := attachment_dir + filename;


     lbProgress.Caption:='Генерация прикрепленных документов '+IntToStr(i+1)+' / '+IntToStr(cnt);

     blobField := sqlGetAllAttachments.FieldByName('attachment_data') as TBlobField;

        GetFromDatabase(blobField, full_path);
                                       end;

     sqlGetAllAttachments.Next;
     Application.ProcessMessages;
     inc(i);
     pBar.Position:=i;

   end;
  sqlGetAllAttachments.First;
end;

function TForm1.insParamsToHead(head: String; page : page_params): String;
var
  r : String;
  i : Integer;
begin
  r:=head;

  r:=applyvar(r, 'sectionTitle', page.section_title);

  for i:=0 to 7 do
    begin
         r:=applyvar(r, 'f'+IntToStr(i), page.user_field_names[i]);
         r:=applyvar(r, 'v'+IntToStr(i), page.user_field_values[i]);
    end;

  result:=r;
end;

function TForm1.insParamsToBody(body: String; page : page_params): String;
var
  r : String;
  i : Integer;
begin
  r:=body;

  r:=applyvar(r, 'dt', DateToStr(page.dt));
  r:=applyvar(r, 'tags', page.tags);


  // TODO Сюда дополнительные параметры страницы
  result:=r;
end;

function TForm1.getSortSelector(section : String; tree : String): String;
var
  s : String;
  orfs : sdict;
  i : Integer;
  base_url : String;
begin


  orfs := sdict.Create();
  orfs.Clear;
  orfs.Add('caption', 'По заголовку');
  orfs.Add('dt', 'По дате');


  s:='<a href="{base_url}/section_'+section+'.html">#</a>';

  for i:=0 to orfs.Count - 1 do
        s:=s+' &nbsp;|&nbsp; <a href="{base_url}/o/'+orfs.Keys[i]+'-DESC/section_'+section+'.html">&#x25BC;</a>&nbsp;' + orfs.Data[i] +
             '&nbsp;<a href="{base_url}/o/'+orfs.Keys[i]+'-ASC/section_'+section+'.html">&#x25B2;</a>&nbsp;|&nbsp;';
  base_url := '';
  if chkUseTrees.Checked then base_url:=tree;
  s:=ApplyVar(s, 'base_url', base_url);
  result := s;

end;

// TODO refactor this sorts
procedure TForm1.makeRubricationUsingSorts(
page : Integer; itemsPerPage : Integer; pagesInRubrics : Integer; rubrication_query: String;
selected_orf : String; selected_ors : String; useo : boolean);
var
  headHtml : String;
  itemHtml : String;
  sectionId  : String;
  itemK : byte;
  selector_order : String;
  sectionHtml : String;
  document : String;
  path : String;
  ur : user_records;
  fi : byte;
  cnt, k : byte;
  bpager : String;
  so : string;
  tree : string;
  path_with_tree : string;
  base_path : string;
  sort_path : string;

  ProcessDir : TProcess;
  tm : TagsMap;
  sq : TSqlQuery;
  tags_html : String;
  Rnr : Render;
  RnrHead : Render;
  RnrDoc  : Render;
begin



  rubrication_query:=applyvar(rubrication_query, 'ors', selected_ors);
                       rubrication_query:=applyvar(rubrication_query, 'orf', selected_orf);




                       sqlRubrication.SQL.Text:=rubrication_query;

                       prepared_transaction_start(sqlRubrication.SQL.Text, sqlRubrication, trans);

                       sectionId := sqlCounter.FieldByName('section').AsString;


                       sqlRubrication.ParamByName('section_id').AsString:=sectionId;
                       sqlRubrication.ParamByName('pageoffset').AsInteger:=(page-1)*itemsPerPage;
                       sqlRubrication.ParamByName('pagelimit').AsInteger := itemsPerPage;

                       prepared_transaction_end(sqlRubrication, trans);
                       sqlRubrication.Open;

                       itemHtml := '';
                       itemK:=0;
                       sqlRubrication.First;


                       while not sqlRubrication.EOF do
                             begin
                                 pBar.Max:=itemsPerPage;
                                 inc(itemK);
                                 pBar.Position:=itemK;
                                 lbProgress.Caption:='Сборка элемента '+IntToStr(itemK)+' / '+IntToStr(itemsPerPage) + ' '+ sqlRubrication.FieldByName('content_id').AsString;
                                  for fi:=1 to 7 do
                                      begin
                                         ur[fi].name:=sqlRubrication.FieldByName('ufn'+IntToStr(fi)).AsString;
                                         ur[fi].value:=sqlRubrication.FieldByName('uf'+IntToStr(fi)).AsString;
                                      end;

                                  tm:=TagsMap.Create;
                                  sq:=TSqlQuery.Create(Self);
                                  sq.SQLConnection:=conn;
                                  sq.Transaction:=trans;

                                  loadTagsForPages(sqlRubrication.FieldByName('content_id').AsString, tm, sq, trans);

                                  sq.free;

                                  tags_html:=tagsInPageHtml(tm, form1.PrefferedExtension.text);

                                  tm.free;

                                   itemHTML := itemHtml +
                                   useCustomFields(
                                   buildItem(
                                     sqlRubrication.FieldByName('itemtpl').AsString,
                                     sqlRubrication.FieldByName('content_id').AsString,
                                     sqlRubrication.FieldByName('caption').AsString,
                                     sqlRubrication.FieldByName('dt').AsDateTime,
                                     ur, sqlRubrication.FieldByName('tree').AsString,
                                     tags_html), sqlRubrication.FieldByName('content_id').asString);
                                   sqlRubrication.Next;
                                   Application.ProcessMessages;
                             end;


                            Rnr := Render.Create;
                            RnrHead:= Render.Create;
                            RnrDoc := Render.Create;

                            sectionHtml := buildSection( sqlRubrication.FieldByName('sectiontpl').AsString,
                                              sqlRubrication.FieldByName('id').asString,
                                              sqlRubrication.FieldByName('section').AsString,
                                              sqlRubrication.FieldByName('note').AsString,
                                              sqlRubrication.FieldByName('full_text').AsString,
                                              itemHtml );

                            Rnr.setTemplate(sectionHtml);


                            bpager:=buildPagination( sqlRubrication.FieldByName('id').AsString,
                                                    page,
                                                    pagesInRubrics,
                                                    selected_orf,
                                                    selected_ors,
                                                    useO,
                                                    chkUseTrees.Checked,
                                                    sqlRubrication.FieldByName('tree').AsString);

                            Rnr.setVar( 'pager', bpager );
                            selector_order := form1.getSortSelector(sectionId, sqlRubrication.FieldByName('tree').AsString);
                            Rnr.setVar('sort_order', selector_order);


                            Rnr.setVar( 'sectionTitle', sqlRubrication.FieldByName('section').AsString);
                            Rnr.setVar( 'sectionNote', sqlRubrication.FieldByName('note').AsString);
                            Rnr.setVar( 'sectionFullText', sqlRubrication.FieldByName('full_text').AsString);




                            RnrHead.setTemplate(
                                      buildHead( sqlRubrication.FieldByName('section').AsString,
                                                  sqlRubrication.FieldByName('headtpl').AsString));

                            RnrHead.setVar('sectionTitle',  sqlRubrication.FieldByName('section').AsString);





                            RnrDoc.setTemplate('<html><head>{header}</head><body>{body}</body>');

                            headHtml := rnrHead.getHtml();
                            sectionHtml:= rnr.getHtml();



                            RnrDoc.setVar('header', headHtml);
                            RnrDoc.setVar('body', sectionHtml);
                            document:=RnrDoc.getHtml();

                            Rnr.Free;
                            RnrHead.Free;
                            RnrDoc.Free;





                            // постобработка

                            document:=
                                  useModules(
                                    useOwnTags(
                                       insertSectionsAndLinks(
                                      useBlocks(
                                                document ))));

                            if (logger_info)   then
                            mmRubrics.Lines.Add(document);

                            so:='';
                            if useO then so:='o/'+selected_orf+'-'+selected_ors+'/';



                            if chkUseTrees.checked then
                              begin
                                   ProcessDir:=TProcess.Create(Self);
                                   ProcessDir.CommandLine:='/usr/bin/bash -c "mkdir -p '+ path_with_tree +'"';
                                   ProcessDir.WaitOnExit;
                                   ProcessDir.Free;
                              end;


                            base_path:=sqlRubrication.FieldByName('dirpath').AsString;

                            tree:=sqlRubrication.FieldByName('tree').AsString;
                            path_with_tree:=sqlRubrication.FieldByName('dirpath').AsString+tree;

                            if chkUseTrees.Checked then
                               base_path:=path_with_tree;

                            if not DirectoryExists(base_path+DELIM+'o') then
                               CreateDir( base_path+DELIM+'o' );

                            sort_path:= base_path+DELIM+so;

                            // for different_sorts need different folrders
                            If Not DirectoryExists(  sort_path ) then
                               CreateDir( sort_path );


                            if page > 1 then

                            path:=
                            base_path + DELIM + '{so}section_'+
                            sqlRubrication.FieldByName('id').AsString+'_'+IntToStr(page)+'.html'
                            else
                              begin
                            path:=base_path + DELIM +'{so}section_'+
                            sqlRubrication.FieldByName('id').AsString+'.html';
                              end;

                            path:=applyvar(path, 'so', so);



                            Writer.addToJob( document,
                            path
                                           );


                     pBar.Max:=pagesInRubrics;
                     pBar.Position:=page;
end;

procedure TForm1.AfterPostHelper(var lv : TListView; var sql : TSQLQuery; field : String);
var field_id : String;  i : Integer;  flag : boolean;
begin
  field_id:=sql.FieldByName(field).AsString;
  flag := true;
   for i:=0 to lv.Items.Count-1 do
       if lv.Items[i].Caption = field_id then
              begin
                   flag:=false;
                   break;
              end;
   if flag then
          lv.AddItem(field_id, nil);
end;

procedure TForm1.BeforeDeleteHelper(var lv: TListView; var sql: TSQLQuery;
  field: String);
var delete_id : String; i : Integer;
begin
  delete_id:=sql.FieldByName(field).AsString;
  lv.ItemIndex:=-1;
  for i:=0 to lv.Items.Count-1 do
      if lv.Items[i]<>nil  then
         if lv.Items[i].Caption = delete_id then
            begin
                 lv.Items.Delete(i);
            end;
end;

procedure TForm1.listViewClickHelper(var lv: TListView; var sql: TSQLQuery;
  field: String);
var v : String;
begin
  if lv.ItemIndex >= 0 then
    begin
  v := lv.Items.Item[ lv.ItemIndex ].Caption;
  sql.Locate(field, v, []);
    end;
end;

procedure TForm1.insertArticlesToNode(var Node: TTreeNode; section: String);
var
   sql : TSqlQuery;
   iNode : TTreeNode;
begin
  sql:=TSQLQuery.Create(Self);

  sql.Transaction:=trans;
  sql.SQLConnection:=conn;
  sql.SQL.Text := 'select * from content where section="'+section+'"';

  sql.ExecSQL;
  sql.Active:=True;
  sql.First;
  while not sql.eof do
   begin
     iNode:=tvContent.Items.AddChild(Node, sql.FieldByName('id').AsString);
     iNode.ImageIndex:=1;
     sql.next;
   end;

  sql.Free;
end;

procedure TForm1.updateCustomColumns;
var
   sq : TSQLQuery;
   field_name : String;
   field_type : String;
begin
  sq:=TSQLQuery.Create(Self);
  sq.SQLConnection:=conn;
  sq.SQLTransaction:=trans;
  open_sql('PRAGMA TABLE_INFO(content)', sq);
  sq.first;
  listFields.Clear;
  while not sq.eof do
   begin
     field_name:=sq.FieldByName('name').AsString;
     field_type:=sq.FieldByName('type').AsString;
     listFields.Items.add(field_name);
     sq.next;
   end;
  sq.Free;
end;

procedure TForm1.addCustomColumn(field_name, field_type: String);
var sq : TSQLQuery;
begin
  if field_name.Contains('custom_') then
     begin
  sq:=TSQLQuery.create(Self);
  sq.SQLConnection:=conn;
  sq.SQLTransaction:=trans;
  sq.SQL.Text:='ALTER TABLE content ADD COLUMN '+field_name+' '+field_type;
  sq.ExecSQL;
  sq.Free;
     end;
end;

procedure TForm1.deleteCustomColumn(field_name: String);
var sq : TSQLQuery;
begin
  if field_name.Contains('custom_') then begin
  sq:=TSQLQuery.create(self);
  sq.SQLConnection:=conn;
  sq.SQLTransaction:=trans;
  sq.SQL.Text:='ALTER TABLE content DROP COLUMN '+field_name;
  sq.ExecSQL;
  sq.Free;
  end;
end;

function TForm1.useCustomFields( template: String; page_id: String): String;
var
   sq : TSQLQuery;
   i : Integer;
   R : String;
   rnr : Render;
begin
  rnr := Render.Create;
  rnr.setTemplate(template);

  sq:=TSQLQuery.create(self);
  sq.SQLConnection:=conn;
  sq.SQLTransaction:=trans;
  sq.SQL.Text:='SELECT * FROM content WHERE id="'+page_id+'" LIMIT 1';
  sq.ExecSQL;
  sq.Active:=True;
  sq.First;
  for i:=0 to listFields.Count-1 do
      begin
        if ListFields.Items[i].Contains('custom_') then
           begin
           // todo not strings
             rnr.setVar( ListFields.Items[i], sq.FieldByName( ListFields.Items[i] ).AsString);
           end;
      end;
   R:=Rnr.getHtml();

  sq.Free;
  rnr.free;

  Result:=R;
end;

function TForm1.remotes_urls(app: String): String;

function CurlGet(URL: String): String;
var
  CurlProcess : TProcess;
  Response : TStringList;
  file_name : String;
  R : String;
begin
  R:='';
  CurlProcess:=TProcess.Create(Self);
  file_name:=form1.edPathToBuild.Text +'/temp_text.txt';
  CurlProcess.CommandLine:='/usr/bin/curl '+URL+ ' -o '+file_name;
  //showMessage(CurlProcess.CommandLine);
  CurlProcess.Execute;
  while CurlProcess.Running do ;
  CurlProcess.Free;
  Response:=TStringList.Create;
  if FileExists(file_name) then
      begin
           Response.LoadFromFile(file_name);
           R:=Response.Text;
           DeleteFile(file_name);
      end;
  Response.Free;
  Result:=R;
end;


var
   re : TRegExpr;
   http_template : String;
   url : String;
   urls_list : TStringList;
   i : Integer;
   Rnr : Render;
   Response : TStrings;
   var_name : String;
   var_value : String;
begin


  Rnr:=Render.Create;
  Rnr.setTemplate(app);

  urls_list := TStringList.Create;

  http_template:='([\w\d@:%._\+~#=?()&//]+)';


  re := TRegExpr.Create('{remote_url="'+http_template+'"}');


  if re.Exec(app) then begin
       url:=re.Match[1];
       urls_list.Add( url );
       while re.ExecNext do begin
         url := re.Match[1];
         urls_list.Add( url ) ;
         Application.ProcessMessages;
      end;
  end;

  for i:=0 to urls_list.Count-1 do
       begin
        url:=urls_list.Strings[i];
        Response := TStrings.Create;
        var_name := 'remote_url="'+url+'"';
        var_value := CurlGet(url);

        //showMessage(var_name);
        //showMessage(var_value);
        Rnr.setVar(var_name, var_value);
        Response.Free;
       end;
  urls_list.free;
  Result := Rnr.getHtml();
  Rnr.Free;

end;

procedure TForm1.SaveSpecialSettings(path : String);
var
   fout : file of TSpecial_Settings;


begin

  form1.loadfromui_special_setting();
  if path='' then
     if SaveDialog1.Execute then
         path  := SaveDialog1.FileName;
  if path <> '' then begin
  AssignFile(fout, path);
  Rewrite(fout);
  Write(fout, special_settings);
  closefile(fout);
  end;

end;

procedure TForm1.RestoreSpecialSettings(path : String);
var
   fin : file of TSpecial_Settings;

begin
  if path = '' then
   if OpenDialog1.Execute then
          path := SaveDialog1.FileName;
    if path <> '' then begin
          AssignFile(fin, path);
          Reset(fin);
          Read(fin, special_settings);
          closefile(fin);
          updateui_special_setting();
     end;
end;

procedure TForm1.loadfromui_special_setting;
begin
  special_settings.ArchiveName:=form1.edArchiveName.Text;
  special_settings.ext:=form1.PrefferedExtension.Text;
  special_settings.fileManager:=form1.edFileManager.Text;
  special_settings.Locale:=form1.cboLocale.ItemIndex;
  special_settings.LocalWysiwygExpress:=form1.edLocalWysigygServer.Text;
  special_settings.numOfRecords:=StrToInt(form1.edItemsPerPage.Text);
  special_settings.pathToBuild:=form1.edPathToBuild.Text;
  special_settings.UseGlobalsFromFiles:=form1.chkGetBlocksFromFile.Checked;
  special_settings.UseModule:=form1.chkUseModules.checked;
  special_settings.useTree:=form1.chkUseTrees.Checked;
  special_settings.zipCommandLine:=form1.ZipArchiverCommand.Text;
  special_settings.pathToGhPages:=form1.edGithubPagesPath.Text;

  special_settings.ftpIp:=form1.edFtpIP.text;
  special_settings.ftpUserName:=form1.edFtpUsername.text;
  special_settings.ftpPassword:=form1.edFtpPassword.text;
  special_settings.ftpPort:=form1.edFtpPort.text;

  special_settings.webLocalServerIp:=form1.edIpAddress.text;
  special_settings.webLocalServerPort:=form1.edPort.text;
end;

procedure TForm1.updateui_special_setting;
begin
  form1.edArchiveName.Text:= special_settings.ArchiveName;
  form1.PrefferedExtension.Text:=special_settings.ext;
  form1.edFileManager.Text:=special_settings.fileManager;
  form1.cboLocale.ItemIndex:=special_settings.Locale;
  form1.edLocalWysigygServer.Text:=special_settings.LocalWysiwygExpress;
  form1.edItemsPerPage.Text:=IntToStr(special_settings.numOfRecords);
  form1.edPathToBuild.Text:=special_settings.pathToBuild;
  form1.chkGetBlocksFromFile.Checked:=special_settings.UseGlobalsFromFiles;
  form1.chkUseModules.checked:= special_settings.UseModule;
  form1.chkUseTrees.Checked:=special_settings.useTree;
  form1.ZipArchiverCommand.Text:=special_settings.zipCommandLine;
  form1.edGithubPagesPath.Text:=special_settings.pathToGhPages;



  form1.edFtpIP.text:=special_settings.ftpIp;
  form1.edFtpUsername.text:=special_settings.ftpUserName;
  form1.edFtpPassword.text:=special_settings.ftpPassword;
  form1.edFtpPort.text:=special_settings.ftpPort;

  form1.edIpAddress.text:=special_settings.webLocalServerIp;
  form1.edPort.text:=special_settings.webLocalServerPort;
end;




procedure TForm1.setAttachment;
    var
      blobField : TBlobField;
      filename  : String;
begin



  blobField := sqlGetAllAttachments.FieldByName('attachment_data') as TBlobField;

  if Form1.opdSelectFileAsAttachment.execute then
   begin
     try
      filename :=    Form1.opdSelectFileAsAttachment.FileName;
      SaveToDatabaze(blobField, filename);

     except on E: Exception do ShowMessage(E.Message);
     end;
   end;


end;

procedure TForm1.getAttachment;
var
  filename : String;
  blobField : TBlobField;
begin
    
   blobField := sqlGetAllAttachments.FieldByName('attachment_data') as TBlobField;
   form1.svdGetFromDatabase.FileName := sqlGetAllAttachments.FieldByName('attachment_id').AsString;
   if svdGetFromDatabase.Execute then
    begin
           try
         filename :=  form1.svdGetFromDatabase.FileName;
         GetFromDatabase(blobField,  filename );

           except on E: Exception do ShowMessage(E.Message);
           end;

    end;

end;

procedure TForm1.displayAttachmentStatus;
begin
 if sqlGetAllAttachments.FieldByName('attachment_data').IsNull then
               form1.lbIsFileUploaded.Caption:='Не загружено'
               else
               form1.lbIsFileUploaded.Caption:='Загружено';
end;

procedure TForm1.actionBuildSite();
var start, stop: TDateTime;
ptr : Pointer;


begin



  start:=Now();

  form1.scanLinks(); // сканер ссылок нужен для автозамены
  form1.scanSections(); // сканер секций нужен для автозамены
  form1.scanBlocks(); // сканируем блоки



  Writer := TFilesQueue.Create();


  doJoinPages(); // страницы
  doSections();  // разделы
  doSitemap(); // карта сайта
  doCssTables(); // css таблицы
  doJs(); // скрипты
  doTagsMap(); // все теги на сайте

  doImages();
  doAttachments();

  Writer.processEach();



  stop:=Now();


  mmRubrics.Lines.Add('НА СБОРКУ ПОТРЕБОВАЛОСЬ СЕКУНД:');
  mmRubrics.Lines.Add(FloatToStr(MilliSecondsBetween(start, stop)/1000));

  mmRubrics.Lines.Add('Обработано файлов: '+IntToStr(writer.last+1));

end;

procedure TForm1.actionSetFont();
var
  FontDialog: TFontDialog;
  FontManager: TFontManager;
begin

  FontDialog := TFontDialog.Create(Self);
  FontManager := TFontManager.Create();

  try

   // use settings in dialog
   FontDialog.Font.Assign(FontManager.Font);

   // Show the font dialog
   if FontDialog.Execute then

       // use selected font
       FontManager.useFont(FontDialog.Font);

  finally
    FontDialog.Free;
  end;


      // Apply the selected fonts to UI

      setFontsToUI(FontManager.Font);




end;

procedure TForm1.setFontsToUI(SomeFont : TFont);
begin
 fContent.Font :=  SomeFont;
  dbmSectionFullText.Font :=  SomeFont;
  dbeBlockHtml.Font :=  SomeFont;
  dbmCssStyle.Font :=  SomeFont;
  dbmJsScriptFile.Font :=  SomeFont;
  dbmMenuTpl.Font := SomeFont;
  dbmMenuItemTpl.Font :=  SomeFont;
  dbmHeadTemplate.Font := SomeFont;
  dbmBodyPagesTemplate.Font :=  SomeFont;
  dbmBodySectionsTemplate.Font := SomeFont;
  dbmTemplateOfItem.Font :=  SomeFont;
  dbmTagsTemplate.Font := SomeFont;
  dbmItemTagTemplate.Font :=  SomeFont;
end;

procedure TForm1.initFontsState();
var
   FontManager : TFontManager;
begin
  FontManager := TFontManager.Create();
  setFontsToUI(FontManager.Font)

end;

{ #todo : Localization - loading from ini }
procedure TForm1.loadLocaleFromIni(FileName: String);
var
  Ini: TIniFile;
  Control: TControl;
  CaptionValue: string;
  index : Integer;
 begin
  Ini := TMemIniFile.Create(Filename);
  try
    // Loop through each control on the form
    for index:=0 to self.ComponentCount-1 do begin
      if Components[Index] is TMenuItem then begin

                    (Self.Components[index] as TMenuItem).Caption:= Ini.ReadString('UI',
                                                                    (Self.Components[index] as TMenuItem).Name,
                                                                    (Self.Components[index] as TMenuItem).Caption);
      end else
      if Components[Index] is TControl then
          if (Components[Index] is TButton) or (Components[Index] is TLabel) or
             (Components[Index] is TTabSheet) or (Components[Index] is TMenuItem)
                        then
            begin
                  Control := TControl(Components[Index]);
                  // Restore locale
                   CaptionValue := Ini.ReadString('UI', Control.Name, Control.Caption);
                   Control.Caption := CaptionValue; // Set the caption
            end;
    end; {for}
    Ini.UpdateFile;
  finally
    Ini.Free;
  end; {try}
end;







{ #todo : saving localization to ini }
procedure TForm1.saveLocaleToIni(FileName: String);
var
  Ini: TMemIniFile;
  Control: TControl;
  index : Integer;
begin
  Ini := TMemIniFile.Create(Filename);
  try
    // Loop through each control on the form
    for index:=0 to self.ComponentCount-1 do begin
      if Components[Index] is TMenuItem then begin
                    Ini.WriteString('UI', Self.Components[index].Name, (Self.Components[index] as TMenuItem).Caption);
      end else
      if Components[Index] is TControl then
          if (Components[Index] is TButton) or (Components[Index] is TLabel) or
             (Components[Index] is TTabSheet) then
            begin
                  Control := TControl(Components[Index]);
                  // Save the caption to the INI file using the control name as the key
                  Ini.WriteString('UI', Self.Components[index].Name, Control.Caption);
            end;
    end; {for}
    Ini.UpdateFile;
  finally
    Ini.Free;
  end; {try}
end;

function TForm1.useEmojies(s: String): String;
var
  emojies : TEmojiShortCodesArray;
begin
  emojies := getEmojiShortCodes();
  Result := withEmojies(s, emojies);
end;





















end.
