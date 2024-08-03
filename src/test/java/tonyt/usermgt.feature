Feature: User management API

Background: Request header configuration
  # Set a configuration for the payload
  * url baseUrl = 'https://gorest.co.in/public/v2/'
  * header Authorization = 'Bearer ' + apiToken
  * header Content-Type = contentType
  * header ssl = true
  @PutUsersDataValidation
Scenario Outline: [PUT /users/<userid>] Data Validation 
 
  Given path 'users/' + user_id
  And request data = read(<input_file>)

  When method put
  Then status <response_status>
  And match response == read(<output_file>)

  Examples:
   | user_id | input_file  | response_status | output_file |
   | 6940552 | 'classpath:tonyt/putusers_1_input.json' | 200 | 'classpath:tonyt/putusers_1_output.json'| 
   | 6940551 | 'classpath:tonyt/putusers_1_input.json' | 404 | 'classpath:tonyt/putusers_notfound_output.json'| 
