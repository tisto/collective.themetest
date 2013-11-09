*** Settings ***

Resource  plone/app/robotframework/selenium.robot

Library  Remote  ${PLONE_URL}/RobotRemote

Test Setup  Open test browser
Test Teardown  Close all browsers


*** Variables ***

${DUMMY_TEXT_LINE} =  Colorless green ideas sleep furiously
${DUMMY_TEXT_SHORT} =  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
${DUMMY_TEXT} =  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.


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
# TODO: Anonymous View Screenshot
#    Click Link  id=user-name
#    Wait until keyword succeeds  10  1  Click Link  xpath=//li[@id='personaltools-logout']/a
#    Capture screenshot  document-anonymous-view.png

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
