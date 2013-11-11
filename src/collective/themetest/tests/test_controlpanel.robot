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

    Go To  ${PLONE_URL}/@@types-controlpanel
    Capture screenshot  types-controlpanel.png

    Go To  ${PLONE_URL}/@@skins-controlpanel
    Capture screenshot  skins-controlpanel.png

    Go To  ${PLONE_URL}/@@editing-controlpanel
    Capture screenshot  editing-controlpanel.png

    Go To  ${PLONE_URL}/@@filter-controlpanel
    Capture screenshot  filter-controlpanel.png

    Go To  ${PLONE_URL}/@@imaging-controlpanel
    Capture screenshot  imaging-controlpanel.png

    Go To  ${PLONE_URL}/@@calendar-controlpanel
    Capture screenshot  calendar-controlpanel.png

    Go To  ${PLONE_URL}/@@navigation-controlpanel
    Capture screenshot  navigation-controlpanel.png

    Go To  ${PLONE_URL}/@@rules-controlpanel
    Capture screenshot  rules-controlpanel.png

    Go To  ${PLONE_URL}/@@security-controlpanel
    Capture screenshot  security-controlpanel.png

    Go To  ${PLONE_URL}/@@language-controlpanel
    Capture screenshot  language-controlpanel.png

    Go To  ${PLONE_URL}/@@search-controlpanel
    Capture screenshot  search-controlpanel.png

    Go To  ${PLONE_URL}/@@markup-controlpanel
    Capture screenshot  markup-controlpanel.png

    Go To  ${PLONE_URL}/portal_tinymce/@@tinymce-controlpanel
    Capture screenshot  tinymce-controlpanel.png

    Go To  ${PLONE_URL}/@@maintenance-controlpanel
    Capture screenshot  maintenance-controlpanel.png

    Go To  ${PLONE_URL}/@@site-controlpanel
    Capture screenshot  site-controlpanel.png

    Go To  ${PLONE_URL}/@@mail-controlpanel
    Capture screenshot  mail-controlpanel.png

    Go To  ${PLONE_URL}/@@syndication-settings
    Capture screenshot  syndication-controlpanel.png

    Go To  ${PLONE_URL}/@@discussion-settings
    Capture screenshot  discussion-controlpanel.png

    Go To  ${PLONE_URL}/prefs_install_products_form
    Capture screenshot  add-ons-controlpanel.png

    Go To  ${PLONE_URL}/prefs_error_log_form
    Capture screenshot  error-logs-controlpanel.png

    Go To  ${PLONE_URL}/portal_registry
    Capture screenshot  registry-controlpanel.png

    Go To  ${PLONE_URL}/@@usergroup-controlpanel
    Capture screenshot  usergroup-controlpanel.png

    Go To  ${PLONE_URL}/usergroup-userprefs
    Capture screenshot  usergroup-userprefs.png

    Go To  ${PLONE_URL}/usergroup-groupprefs
    Capture screenshot  usergroup-groupprefs.png

    Go To  ${PLONE_URL}/member-registration
    Capture screenshot  member-registration.png


*** Keywords ***

I'm logged in as a '${ROLE}'
    Enable autologin as  ${ROLE}
    Go to  ${PLONE_URL}

Capture screenshot
    [Arguments]  ${filename}
    Capture Page Screenshot  filename=docs/source/_screenshots/${filename}
