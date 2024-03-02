# TestAssignment_TodoMVC
test assignment to automate the TodoMVC features

Before you get started, ensure you have the following installed on your machine:

## Prerequisites

- Python installed on your machine (version 3.x recommended).
- Chrome browser installed.(preferably  114.0.5735.90)
- chromedriver executable file(.exe) into your local path

## Installation

1. **Install Robot Framework:**

   Open a terminal and run the following command to install Robot Framework using pip:

   ```bash
   pip install robotframework

2. Install project dependencies:

   ```bash
   pip install -r requirements.txt

3. Install selenium dependencies:

    ```bash
   pip install robotframework-seleniumlibrary
    #note : preferably selenium 4.9.1

## Running the Tests
Run the test suite using the following command:
     
      robot tests/

example :
  To run TC1_Positive.robot : robot TestCases/TC1_Positive.robot


### About the Framework structure

This framework is created using Robot framework and selenium libraries

## Project structure 

  Below are the folders in project :
  1. ObjectRepository : This contains the page objects/locators of the screen elements
  2. TestCases : This folder contains all the test cases, created two different robot classes for positive and negetive test cases.
     i. TC1_Positive.robot : this contains all the positive test cases to validate https://todomvc.com/examples/react/dist
     ii.TC2_Negetive.robot : this contains all the negetive test cases to validate https://todomvc.com/examples/react/dist corner cases
  4. venv
  5. report.html : After test run log.html and report.html will be created under main project folder. report.html will show all the test cases run and result for those, you can also view the tags added to the test cases here.
  6. log.html: Under report.html, there will be link to log.html where you can see all the step wise implementation and status .
  7. Screenshots : Screenshots will be added to the main folder in case there is any failure

##Note
  taking screenshot and video can also be captured through the script but here in this implementation that is not added.

## what is being tested 

- Positive scenarios:
  1.add new item to do list
  2.validating all the tabs
  3. Validating the completing a to do item scenarios
  4.Clear completion functionality validation
  5.Edit functionality of the to do item

- Negetive scenarios:
  1. Boundry value analysis done including space and minimum value to maximum value input
  2. Special character as input
  3. only space as input

This approach is taken as for any input field validation boundry value analysis is very important and most of the corner cases can be found there.

