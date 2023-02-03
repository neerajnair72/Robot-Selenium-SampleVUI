*** Settings ***
Library  Selenium2Library
Library  LambdaTestStatus.py

*** Variables ***


${BROWSER}          ${ROBOT_BROWSER}
&{options}          platformName=${platform}    version=${version}    visual=${visual}    network=${network}    name=RobotFramework LambdaTest    browserName=${browserName}    smartUI.project=Veer    build=VisualUI
&{CAPABILITIES}     LT:Options=&{options}
${REMOTE_URL}       http://USERNAME:ACCESS_KEY@hub.lambdatest.com/wd/hub
${TIMEOUT}          3000

*** Keywords ***

Open test browser
    [Timeout]   ${TIMEOUT}
    Open browser  https://lambdatest.github.io/sample-todo-app/  browser=${BROWSER}
    ...  remote_url=${REMOTE_URL}
    ...  desired_capabilities=${CAPABILITIES}

Close test browser
    Run keyword if  '${REMOTE_URL}' != ''
    ...  Report Lambdatest Status
    ...  ${TEST_NAME} 
    ...  ${TEST_STATUS} 
    Close all browsers
