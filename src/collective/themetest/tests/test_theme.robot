*** Settings ***

Resource  plone/app/robotframework/selenium.robot

Library  Remote  ${PLONE_URL}/RobotRemote

Variables  plone/app/testing/interfaces.py

Test Setup  Open test browser
Test Teardown  Close all browsers


*** Variables ***

${DUMMY_TEXT_LINE} =  Colorless green ideas sleep furiously
${DUMMY_TEXT_SHORT} =  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
${DUMMY_TEXT} =  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.


*** Test Cases ***

Capture Login Form Screenshot
    Go to  ${PLONE_URL}/login
    Capture screenshot  login.png

Capture Login Failed Screenshot
    Go to  ${PLONE_URL}/login
    Input text  __ac_name  invalid username
    Input text  __ac_password  invalid password
    Click Button  Log in
    Page should contain button  Log in
    Capture screenshot  login-failed.png

Capture Login Successful Screenshot
    Go to  ${PLONE_URL}/login
    Input text  __ac_name  ${SITE_OWNER_NAME}
    Input text  __ac_password  ${SITE_OWNER_PASSWORD}
    Click Button  Log in
    Page should not contain button  Log in
    Capture screenshot  login-successful.png

Capture Front Page Screenshot
    I'm logged in as a 'Site Administrator'
    Go to  ${PLONE_URL}
    Capture screenshot  front-page.png

Capture Document Screenshots
    I'm logged in as a 'Site Administrator'
    Go to  ${PLONE_URL}/createObject?type_name=Document
    Wait until page contains element  css=#archetypes-fieldname-title
    Input text  name=title  ${DUMMY_TEXT_LINE}
    Input text  name=description  ${DUMMY_TEXT_SHORT}
    Input RichText  ${DUMMY_TEXT}
    Capture screenshot  document-edit.png
    Click Button  Save
    Capture screenshot  document-view.png
# TODO: Anonymous View Screenshot
#    Click Link  id=user-name
#    Wait until keyword succeeds  10  1  Click Link  xpath=//li[@id='personaltools-logout']/a
#    Capture screenshot  document-anonymous-view.png

Capture Folder Screenshots
    I'm logged in as a 'Site Administrator'
    Go to  ${PLONE_URL}/createObject?type_name=Folder
    Wait until page contains element  css=#archetypes-fieldname-title
    Input text  name=title  ${DUMMY_TEXT_LINE}
    Input text  name=description  ${DUMMY_TEXT_SHORT}
    Capture screenshot  folder-edit.png
    Click Button  Save
    Go To  ${PLONE_URL}/colorless-green-ideas-sleep-furiously/createObject?type_name=Document
    Input text  name=title  Document 1
    Click Button  Save
    Go To  ${PLONE_URL}/colorless-green-ideas-sleep-furiously/createObject?type_name=Document
    Input text  name=title  Document 2
    Click Button  Save
    Go To  ${PLONE_URL}/colorless-green-ideas-sleep-furiously/createObject?type_name=Document
    Input text  name=title  Document 3
    Click Button  Save
    Go To  ${PLONE_URL}/colorless-green-ideas-sleep-furiously/
    Capture screenshot  folder-view.png
    Go To  ${PLONE_URL}/colorless-green-ideas-sleep-furiously/folder_contents
    Capture screenshot  folder-contents-view.png
    Go To  ${PLONE_URL}/colorless-green-ideas-sleep-furiously/folder_summary_view
    Capture screenshot  folder-summary-view.png
    Go To  ${PLONE_URL}/colorless-green-ideas-sleep-furiously/folder_full_view
    Capture screenshot  folder-full-view.png
    Go To  ${PLONE_URL}/colorless-green-ideas-sleep-furiously/folder_tabular_view
    Capture screenshot  folder-tabular-view.png
    Go To  ${PLONE_URL}/colorless-green-ideas-sleep-furiously/atct_album_view
    Capture screenshot  folder-album-view.png
    Go To  ${PLONE_URL}/colorless-green-ideas-sleep-furiously/folder_listing
    Capture screenshot  folder-listing-view.png

Capture Search Screenshots
    I'm logged in as a 'Site Administrator'
    Go To  ${PLONE_URL}/@@search?SearchableText=Plone
    Capture screenshot  search.png

Capture Sitemap Screenshots
    I'm logged in as a 'Site Administrator'
    Go To  ${PLONE_URL}/sitemap
    Capture screenshot  sitemap.png

Capture Accessibility Screenshots
    I'm logged in as a 'Site Administrator'
    Go To  ${PLONE_URL}/accessibility-info
    Capture screenshot  accessibility.png

Capture Contact Form Screenshots
    I'm logged in as a 'Site Administrator'
    Go To  ${PLONE_URL}/contact-info
    Capture screenshot  contact.png


*** Keywords ***

I'm logged in as a '${ROLE}'
    Enable autologin as  ${ROLE}
    Go to  ${PLONE_URL}

Capture screenshot
    [Arguments]  ${filename}
    Capture Page Screenshot  filename=docs/source/_screenshots/${filename}

Input RichText
  [Arguments]  ${input}
  Select frame  id=text_ifr
  Input text  id=content  ${input}
  Unselect Frame
