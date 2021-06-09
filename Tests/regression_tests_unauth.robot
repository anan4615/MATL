*** Settings ***
Resource  ../Resources/slate.robot
Resource  ../Resources/slateauth.robot
Resource  ../Resources/welcomepayment.robot
Resource  ../Resources/common.robot
Resource  ../Resources/agreement.robot
Resource  ../Resources/paymentmethod.robot
Resource  ../Resources/Creditinfo.robot
Resource  ../Resources/Confirmpayment.robot
Resource  ../Resources/success.robot
Resource  ../Resources/datamanager.robot

Library     DataDriver  ../Data/trial.xlsx
Test Setup    common.Begin Web test


#Test Template   SinglecourseRes

Test Teardown  common.End Web test
#Test Teardown   Run Keyword If Test Failed  capture page screenshot



*** Variables ***

# robot -d results tests/demo.robot
${Un_FORM_URL} =  https://cbo.test.technolutions.net/register/Teacher-Leadership-New
${First Name} =   jay
${Last Name} =   isaac
${Email}=  jacob.issac@gmail.com
${Country}=    United States
${Street}=     9488 NE 2nd Ave
${City}=   Miami Shores
${State}=  Florida
${Zip}=    33138
${Sex}=    Female
${Month}=  May
${Day}=    11
${Year}=   1982
${Phone}=  4567891234
${courses}=  EDUA 5015 Envisioning Equitable Teaching and Learn


${courses_multi} =  C:\\development\\robot-scripts\\MATL\\Data\\course.csv


*** Test Cases ***



SinglecourseNR
    [Arguments]     ${First Name}   ${Last Name}    ${Email}    ${Country}  ${Street}   ${City}  ${State}   ${Zip}  ${Sex}  ${Month}  ${Day}   ${Year}  ${Phone}

    slate.Open Slate form   ${Un_FORM_URL}
    slate.title
    slate.Select Course     ${courses}
    slate.Masters program
    slate.Input personal info unauth    ${First Name}   ${Last Name}    ${Email}    ${Country}  ${Street}   ${City}  ${State}   ${Zip}  ${Sex}  ${Month}  ${Day}   ${Year}  ${Phone}
    slate.Verify non Residency
    slate.new unauth form with privacy
    slate.enrollment
    slate.finalpriceNRSing

SinglecourseRes
    [Arguments]     ${First Name}   ${Last Name}    ${Email}    ${Country}  ${Street}   ${City}  ${State}   ${Zip}  ${Sex}  ${Month}  ${Day}   ${Year}  ${Phone}

    slate.Open Slate form   ${Un_FORM_URL}
    slate.title
    slate.Select Course     ${courses}
    slate.Masters program
    slate.Input personal info unauth    ${First Name}   ${Last Name}    ${Email}    ${Country}  ${Street}   ${City}  ${State}   ${Zip}  ${Sex}  ${Month}  ${Day}   ${Year}  ${Phone}
    slate.verify residency
    slate.new unauth form with privacy
    slate.enrollment
    slate.finalpriceRSing

multicourseRes
    [Arguments]     ${First Name}   ${Last Name}    ${Email}    ${Country}  ${Street}   ${City}  ${State}   ${Zip}  ${Sex}  ${Month}  ${Day}   ${Year}  ${Phone}

    #${CourseList}= datamanager.Get CSV data    ${courses_multi}
    ${CourseList} =     get csv data    ${courses_multi}
    slate.Open Slate form   ${Un_FORM_URL}
    slate.title
    slate.Select many course    ${CourseList}
    slate.Masters program
    slate.Input personal info unauth    ${First Name}   ${Last Name}    ${Email}    ${Country}  ${Street}   ${City}  ${State}   ${Zip}  ${Sex}  ${Month}  ${Day}   ${Year}  ${Phone}
    slate.Verify Residency
    slate.new unauth form with privacy
    slate.enrollment
    slate.finalpriceRmulti

multicourseRes
    [Arguments]     ${First Name}   ${Last Name}    ${Email}    ${Country}  ${Street}   ${City}  ${State}   ${Zip}  ${Sex}  ${Month}  ${Day}   ${Year}  ${Phone}

    #${CourseList}= datamanager.Get CSV data    ${courses_multi}
    ${CourseList} =     get csv data    ${courses_multi}
    slate.Open Slate form   ${Un_FORM_URL}
    slate.title
    slate.Select many course    ${CourseList}
    slate.Masters program
    slate.Input personal info unauth    ${First Name}   ${Last Name}    ${Email}    ${Country}  ${Street}   ${City}  ${State}   ${Zip}  ${Sex}  ${Month}  ${Day}   ${Year}  ${Phone}
    slate.Verify non Residency
    slate.new unauth form with privacy
    slate.enrollment
    slate.finalpriceNRmulti








