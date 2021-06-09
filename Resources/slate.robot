*** Settings ***
Resource  ../Resources/Page Object/slateformpage.robot


*** Keywords ***
Open Slate form
    [Arguments]  ${data}
    slateformpage.Load  ${data}
    slateformpage.maximize window
#Authentication
#    [Arguments]  ${uid}     ${pwd}

title
    slateformpage.verify page loaded unauth

#titleauth
    #slateformpage.verify page loaded auth


Select course
    [Arguments]  ${courses}

    slateformpage.Course Selection  ${courses}

Select many course

  [Arguments]  ${CourseList}

    slateformpage.Course Selection multi  ${CourseList}

Masters program
     slateformpage.Masters degree selection

Input personal info unauth
    [Arguments]     ${First Name}   ${Last Name}    ${Email}    ${Country}  ${Street}   ${City}  ${State}   ${Zip}  ${Sex}  ${Month}  ${Day}   ${Year}  ${Phone}

    #slateformpage.click Notsure
    Users should be able to Input f/m/l name    ${First Name}    ${Last Name}    ${Email}

    slateformpage.Users should be able to input mailing address  ${Country}  ${Street}   ${City}  ${State}    ${Zip}
    slateformpage.Users should be able to input other info   ${Sex}  ${Month}  ${Day}   ${Year}  ${Phone}
    slateformpage.Citizenship Information

Verify non Residency
    slateformpage.non Resident

Verify Residency
    slateformpage.Resident

new unauth form with privacy
    slateformpage.Terms and Conditions


#unauth privacy
#    slateformpage.unauth privacy agreement

#Input personal info auth
#
#    slateformpage.Users should be able to Input f/m/l name
#    slateformpage.Users should be able to Input Mailing Address
#    slateformpage.Users should be able to Input other info


Enrollment


    slateformpage.Register for course

finalpriceNRSing
    slateformpage.Singlepricenres

finalpriceRSing
    slateformpage.Singlepriceresident

finalpriceNRmulti
    slateformpage.multipricenonres

finalpriceRmulti
    slateformpage.multipriceres

#logout inside
#    slateformpage.logout name