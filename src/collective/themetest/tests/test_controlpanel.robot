*** Settings ***

Resource  plone/app/robotframework/selenium.robot

Library  Remote  ${PLONE_URL}/RobotRemote

Variables  plone/app/testing/interfaces.py

Test Setup  Open test browser
Test Teardown  Close all browsers


*** Test Cases ***

Capture Control Panel Overview Screenshots
    I'm logged in as a 'Manager'
    Go To  ${PLONE_URL}/@@overview-controlpanel
    Capture screenshot  controlpanel-overview.png

Capture Types Control Panel Screenshot
    I'm logged in as a 'Manager'
    Go To  ${PLONE_URL}/@@types-controlpanel
    Capture screenshot  types-controlpanel.png

Capture Skins Control Panel Screenshot
    I'm logged in as a 'Manager'
    Go To  ${PLONE_URL}/@@skins-controlpanel
    Capture screenshot  skins-controlpanel.png

Capture Editing Control Panel Screenshot
    I'm logged in as a 'Manager'
    Go To  ${PLONE_URL}/@@editing-controlpanel
    Capture screenshot  editing-controlpanel.png

Capture Filter Control Panel Screenshot
    I'm logged in as a 'Manager'
    Go To  ${PLONE_URL}/@@filter-controlpanel
    Capture screenshot  filter-controlpanel.png

Capture Imaging Control Panel Screenshot
    I'm logged in as a 'Manager'
    Go To  ${PLONE_URL}/@@imaging-controlpanel
    Capture screenshot  imaging-controlpanel.png

Capture Calendar Control Panel Screenshot
    I'm logged in as a 'Manager'
    Go To  ${PLONE_URL}/@@calendar-controlpanel
    Capture screenshot  calendar-controlpanel.png

Capture Navigation Control Panel Screenshot
    I'm logged in as a 'Manager'
    Go To  ${PLONE_URL}/@@navigation-controlpanel
    Capture screenshot  navigation-controlpanel.png

Capture Rules Control Panel Screenshot
    I'm logged in as a 'Manager'
    Go To  ${PLONE_URL}/@@rules-controlpanel
    Capture screenshot  rules-controlpanel.png

Capture Security Control Panel Screenshot
    I'm logged in as a 'Manager'
    Go To  ${PLONE_URL}/@@security-controlpanel
    Capture screenshot  security-controlpanel.png

Capture Language Control Panel Screenshot
    I'm logged in as a 'Manager'
    Go To  ${PLONE_URL}/@@language-controlpanel
    Capture screenshot  language-controlpanel.png

Capture Search Control Panel Screenshot
    I'm logged in as a 'Manager'
    Go To  ${PLONE_URL}/@@search-controlpanel
    Capture screenshot  search-controlpanel.png

Capture Markup Control Panel Screenshot
    I'm logged in as a 'Manager'
    Go To  ${PLONE_URL}/@@markup-controlpanel
    Capture screenshot  markup-controlpanel.png

Capture TinyMCE Control Panel Screenshot
    I'm logged in as a 'Manager'
    Go To  ${PLONE_URL}/portal_tinymce/@@tinymce-controlpanel
    Capture screenshot  tinymce-controlpanel.png

Capture Maintenance Control Panel Screenshot
    I'm logged in as a 'Manager'
    Go To  ${PLONE_URL}/@@maintenance-controlpanel
    Capture screenshot  maintenance-controlpanel.png

Capture Site Control Panel Screenshot
    I'm logged in as a 'Manager'
    Go To  ${PLONE_URL}/@@site-controlpanel
    Capture screenshot  site-controlpanel.png

Capture Mail Control Panel Screenshot
    I'm logged in as a 'Manager'
    Go To  ${PLONE_URL}/@@mail-controlpanel
    Capture screenshot  mail-controlpanel.png

Capture Syndication Control Panel Screenshot
    I'm logged in as a 'Manager'
    Go To  ${PLONE_URL}/@@syndication-settings
    Capture screenshot  syndication-controlpanel.png

Capture Discussion Control Panel Screenshot
    I'm logged in as a 'Manager'
    Go To  ${PLONE_URL}/@@discussion-settings
    Capture screenshot  discussion-controlpanel.png

Capture Add-ons Control Panel Screenshot
    I'm logged in as a 'Manager'
    Go To  ${PLONE_URL}/prefs_install_products_form
    Capture screenshot  add-ons-controlpanel.png

Capture Error Log Control Panel Screenshot
    I'm logged in as a 'Manager'
    Go To  ${PLONE_URL}/prefs_error_log_form
    Capture screenshot  error-logs-controlpanel.png

Capture Registry Control Panel Screenshot
    I'm logged in as a 'Manager'
    Go To  ${PLONE_URL}/portal_registry
    Capture screenshot  registry-controlpanel.png


*** Keywords ***

I'm logged in as a '${ROLE}'
    Enable autologin as  ${ROLE}
    Go to  ${PLONE_URL}

Capture screenshot
    [Arguments]  ${filename}
    Capture Page Screenshot  filename=docs/source/_screenshots/${filename}
