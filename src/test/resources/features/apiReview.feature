@endToEndTwo
Feature: endtToEndTwo

  Scenario: end to end review two
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    * def generatedToken = response.token
    And header Authorization = "Bearer " + generatedToken
    * def generator = Java.type('api.review.data.DataGenerator')
    * def email = generator.getEMAIL()
    * def firstName = generator.getfirstNAME()
    * def lastName = generator.getlastNAME()
    * def dob = generator.getDOB()
    Given path "/api/accounts/add-primary-account"
    And request
      """
      {
      "email": "#(email)",
      "title": "Mr.",
      "firstName": "#(firstName)",
      "lastName": "#(lastName)",
      "gender": "MALE",
      "maritalStatus": "MARRIED",
      "employmentStatus": "student",
      "dateOfBirth": "#(dob)"
      }
      """
    And header Authorization = "Bearer " + generatedToken
    When method post
    And print response
    Then status 201
* def generator = Java.type('api.review.data.DataGenerator')
    * def addressType = generator.addressTYPE()
    * def addressCity = generator.getCITY()
    * def AddressZipCode = generator.getZipcode()
    And path "/api/accounts/add-account-address"
    And param primaryPersonId = response.id
    And header Authorization = "Bearer " + generatedToken
    And request
      """
      {
      "addressType": "addressType",
      "addressLine1": "123 lilian court",
      "city": "addressCity",
      "state": "va",
      "postalCode": "22204",
      "countryCode": "AddressZipCode",
      "current": true
      }
      """
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 201
    And print response
    * def generator = Java.type('api.review.data.DataGenerator')
    * def phoneNumber = generator.getphoneNUMBER()
    * def phoneExtention = generator.PhoneExtension()
    And path "/api/accounts/add-account-phone"
    And param primaryPersonId = response.id
    And header Authorization = "Bearer " + generatedToken
    And request
      """
      {
      
      "phoneNumber": "phoneNumber",
      "phoneExtension": "phoneExtention",
      "phoneTime": "Morning",
      "phoneType": "Home"
      }
      """
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 201
    And print response
    Given path "/api/accounts/add-account-car"
    And param primaryPersonId = response.id
    And request {"make": "RangeRover","model": "sprot","year": "2022","licensePlate": "notYourBuz"}
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 201
    And print response
    