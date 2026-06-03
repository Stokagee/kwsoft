*** Settings ***
Documentation

Resource    ../../resources/workflows/login_workflows.resource

Test Setup    Initialize Browser Session
Test Teardown    Close Browser Session