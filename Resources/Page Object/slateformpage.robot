*** Settings ***
Library  SeleniumLibrary
Library  String
Library  Dialogs
Library  Collections


*** Variables ***

# This needs to be updated



*** Keywords ***
##############Page Load##################################
Load
    [Arguments]  ${data}
    Go To   ${data}

Maximize Window
    Maximize Browser Window

Verify Page Loaded unauth
    # This needs to be updated
    Run keyword And Continue On Failure    Wait until page contains  Teacher Leadership Registration - New Students
    sleep  3s
    Click element   xpath=//strong[contains(text(),'Learn more about the CU Boulder Teacher Leadership')]
    sleep  3s
    Click element   xpath=//label[contains(text(),'I am an active educator with a fieldwork site that')]


####################New Student Course single Selection#####################################
Course Selection
   sleep   4s
    [Arguments]   ${courses}


    #page should contain element     xpath = //div[@class='form_label']/strong[contains(text(),'${courses}']

    Click element   xpath = //label[contains(text(),'${courses}')]


####################New Student Course multi Selection#####################################
Course Selection multi
   sleep   4s
    [Arguments]   ${CourseList}

        log to console  ${CourseList}
        ${size} =   get length  ${CourseList}

    #page should contain element     xpath = //div[@class='form_label']/strong[contains(text(),'${courses}']
      :FOR  ${a}  IN RANGE    0    ${size}

      \  ${strconvert} =  convert to string   @{CourseList}[${a}]
      \  ${convert} =   remove string   ${strconvert}    [
      \  ${convert2} =   remove string   ${convert}     ]

      \  Click element   xpath = //label[contains(text(), ${convert2})]


###############Masters degree####################################
Masters degree selection
    #page should contain element     xpath=  //label[contains(text(),"Apply for the master's degree in Teacher Leadershi")]
   click element   xpath= //label[contains(text(),"Apply for the master's degree in Teacher Leadershi")]
    input text  xpath= //input[@id='form_de7b0fe4-0a4b-ee2f-c31e-6ca93aa392c0']  Academy of Notre Dame
    input text  xpath= //textarea[@id='material_40513d3c-0890-9df5-a92a-1d649a10fc03_text']    test

###############Personal Info###############################
Users should be able to Input f/m/l name
    [Arguments]     ${First Name}    ${Last Name}    ${Email}

  # This needs to be updated
    Input text  xpath=//input[@id='form_569e5c20-a1e2-feaa-7cf9-65f782c75d77']  ${First Name}
    #Input text  xpath=//input[@id='form_04d5fe0d-4448-0809-7b13-6957bbce4f18']  ${Middle Name}
    Input text  xpath= //input[@id='form_99c4d6d5-446c-02a6-c825-faf207d7ec52']  ${Last Name}
    Input text  xpath=//input[@id='form_8a3f60ff-afe0-65ea-ecd3-cdbeb096ff9d']  ${Email}

Users should be able to Input Mailing Address
    [Arguments]     ${Country}  ${Street}   ${City}  ${State}     ${Zip}

 # This needs to be updated
    select from list by label  id= form_4b76bc11-2bad-33ec-612b-bce1003ad3f1_country  ${Country}
    Input text  id=form_4b76bc11-2bad-33ec-612b-bce1003ad3f1_street     ${Street}
    Input text  id=form_4b76bc11-2bad-33ec-612b-bce1003ad3f1_city   ${City}
    select from list by label  id=form_4b76bc11-2bad-33ec-612b-bce1003ad3f1_region      ${State}
    Input text  id=form_4b76bc11-2bad-33ec-612b-bce1003ad3f1_postal         ${Zip}


Users should be able to Input other info
    [Arguments]     ${Sex}  ${Month}  ${Day}   ${Year}  ${Phone}
     # This needs to be updated
    select from list by label  id=form_529426c3-7275-afe1-6851-52ef1739746e  ${Sex}
    select from list by label  id=form_62c85b81-7f4f-0a91-235c-1a5558e920c5_m  ${Month}
    select from list by label  id=form_62c85b81-7f4f-0a91-235c-1a5558e920c5_d  ${Day}
    select from list by label  id=form_62c85b81-7f4f-0a91-235c-1a5558e920c5_y   ${Year}
    Input text  id=form_48d4eefe-96de-ef69-3af6-87762611cfdc    ${Phone}

###############Citizenship Info###############################
Citizenship Information
    ${citizenship}=  get text     xpath=//select[@id='form_8821f5a5-b2d1-454e-db94-6a7f01f54ad2']
    #log to console  ${citizenship}
    #Should Be Equal As Strings    ${citizenship}    "United States"



#########################Colorado Residency###################################


non Resident
    click element   xpath=//input[@id='form_ebd87828-0d03-7579-6c89-5bb7b5cf6204_2']


Resident
    click element   xpath=//input[@id='form_ebd87828-0d03-7579-6c89-5bb7b5cf6204_1']
    click element   xpath=//input[@id='form_faf7d677-c205-c6d4-eb9b-af9f06cab4ef_1']
    click element   xpath=//input[@id='form_89d088d8-3d5b-59de-7c7e-6d05f026e345_1']
    click element   xpath=//input[@id='form_3f0637b2-43de-3e5b-f86e-275fd279775d_1']
    click element   xpath=//label[contains(text(),'I hereby certify that to the best of my knowledge,')]

###################Terms and Conditions###################################
Terms and Conditions

    click element   xpath=//a[contains(text(),"Consent to Conduct Business Electronically")]
    click element   xpath=//label[contains(text(),'I consent to conduct business electronically with')]
    click element   xpath=//a[contains(text(),"Tuition and Fee Agreement and Disclosure")]
    click element  xpath=//label[contains(text(),'I hereby acknowledge that I have read the universi')]
    click element   xpath=//label[contains(text(),'I agree to authorize the University of Colorado to')]


##############Register for Courses########################################
Register for course

    click element   xpath= //a[contains(text(),'tuition, billing, and payment for the Teacher Lead')]
    click element   xpath= //a[contains(text(),'Please review our refund, drop and withdrawal poli')]
    ${email2}=  get text    xpath =//input[@id='form_8a3f60ff-afe0-65ea-ecd3-cdbeb096ff9d']
    ${email1}=  get text    xpath =//input[@id='form_ebba7aa7-7860-b224-63fe-58da3f0c42a3']
    Should Be Equal As Strings    ${email2}    ${email1}
    page should not contain    The emails you have entered to not match.
    click element   xpath = //label[contains(text(),'Yes, my email address is correct. *')]


######################runtime keyword####################################

Singlepricenres
    ${residency_status} =  get text    xpath=//input[@id='form_928c0623-1123-775c-1828-feae0fe405c1']
    log to console  ${residency_status}
    ${finalprice} =  get text    xpath=//p[2]//span[2]
    Run keyword And Continue On Failure   should be equal   $1038.00    ${finalprice}
    log to console  ${finalprice}
    log to console  price matches

Singlepriceresident
    ${residency_status} =  get text    xpath=//input[@id='form_928c0623-1123-775c-1828-feae0fe405c1']
    log to console  ${residency_status}
    ${finalprice} =  get text    xpath=//p[2]//span[2]
    Run keyword And Continue On Failure   should be equal   $972.00    ${finalprice}
    log to console  ${finalprice}
    log to console  price matches

multipricenonres
    ${residency_status} =  get text    xpath=//input[@id='form_928c0623-1123-775c-1828-feae0fe405c1']
    log to console  ${residency_status}
    ${finalprice} =  get text    xpath=//p[@class='total-price']//span[@class='colo-res-col']
    Run keyword And Continue On Failure   should be equal   $3114.00    ${finalprice}
    log to console  ${finalprice}
    log to console  price matches

multipriceres
    ${residency_status} =  get text    xpath=//input[@id='form_928c0623-1123-775c-1828-feae0fe405c1']
    log to console  ${residency_status}
    ${finalprice} =  get text    xpath=//p[@class='total-price']//span[@class='colo-res-col']
    log to console  ${finalprice}
    Run keyword And Continue On Failure   should be equal   $2916.00    ${finalprice}
    log to console  price matches