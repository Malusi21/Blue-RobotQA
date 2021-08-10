# Blue-RobotQA
 Blue robot QA project, Robot framework

Project contains 2 automation tests, 1 API and 1 Browser test using the google chrome browser
Command line required to execute tests can be found in the AutomationTests.robot file

Testing Framework/s used for this project:
- Robot framework
- Python
- Javascript
- RestAPI automation

Test can be run from the command line by passing in the following variables:
- Browser, Gender option, Hobby option, State ad City as displayed in the registration page dropdown, a force tag is also specified.
- The force tags ensures that both tests run allowing the first test to get and set the address to be used in the  browser test
- A few helper functions have been created to help in trying to interact with a few troublesome fields
  - Subjects field - tried a few alternatives including trying a javascript function to update the field data
    - Note Subjects field is passed in as empty currently to complete test due to this issue
  - State and City dropdowns - selecting the passed state and city values, i have created a helper function for this but was not able to complete the debugging us it
    - Note a default state and city value is used as a work around for this
  - Date of birth field - had issues updating field to new value, field only allowed 2 characters fom the placeholder to be removed, clear functions also failed me.
    - Note the current date on the year 2003 is currently used for the test as a work around

 - Note variables used to validate against the registration preview were default values defined in the test.