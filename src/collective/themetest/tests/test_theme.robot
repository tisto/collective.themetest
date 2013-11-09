*** Settings ***

Resource  plone/app/robotframework/selenium.robot

Library  Remote  ${PLONE_URL}/RobotRemote

Test Setup  Open test browser
Test Teardown  Close all browsers


*** Variables ***

${DUMMY_TEXT_LINE} =  Colorless green ideas sleep furiously
${DUMMY_TEXT_SHORT} =  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
${DUMMY_TEXT} =  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.

*** Test Cases ***

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
