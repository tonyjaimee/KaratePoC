Feature: Hello world feature

Background: The Request Body Configuration
  # Set a configuration for the payload
* url baseUrl = "https://freetestapi.com/api/v1/"

Scenario: Hello world
  * print 'hello world'

Scenario: GET /airline/{airlineId}
  Given def airlineId = 1
  Given def jsonBody =
  """
  {"id":1,"name":"Lufthansa","code":"LH","country":"Germany","founded":"1953","fleet_size":"300+","headquarters":"Cologne, Germany","website":"https://www.lufthansa.com/","destinations":[{"name":"New York","code":"JFK"},{"name":"London","code":"LHR"},{"name":"Paris","code":"CDG"}]}
  """

  Given header Content-Type = 'application/json'
  And path 'airlines', airlineId
    # The above will generate GET /airline/1

  When method get
  Then status 200
  And match response == jsonBody


Scenario: GET /airlines?sort=name&order=dec

  Given header Content-Type = 'application/json'
  And path 'airlines'
  And param sort = 'name&order=dec'
    # This param variable named "sort" will be appended towards the end of UR after ? => GET /airlines?sort=name&order=dec
  
  When method get
  Then status 200