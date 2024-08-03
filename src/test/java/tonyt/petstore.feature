Feature: Test Petstore API

  Background: Request header configuration
    # Set a configuration for the payload
    * url baseUrl
    * header Authorization = 'Bearer ' + apiToken
    * header Content-Type = contentType
    * header ssl = true
    @PutPetDataValidation
  Scenario Outline: [PUT /pet] Data Validation 
   
    Given path 'pet'
    And request data = read(<input_file>)
  
    When method put
    Then status <response_status>
    And match response == read(<output_file>)

    Examples:
      | input_file  | response_status | output_file |
      | 'classpath:tonyt/putpet_1_input.json' | 200 | 'classpath:tonyt/putpet_1_output.json'|
      | 'classpath:tonyt/putpet_2_input.json' | 200 | 'classpath:tonyt/putpet_2_output.json'|
      | 'classpath:tonyt/putpet_wrongid_input.json' | 404 | 'classpath:tonyt/putpet_wrongid_output.txt'| 
      
      
      @PutPetSchemaValidation
    Scenario Outline: [PUT /pet] Schema validation
   
      Given path 'pet'
      And request data = read(<input_file>)
    
      When method put
      Then status <response_status>
      And match response contains {code: <response_status>}
  
      Examples:
        | input_file  | response_status |
        | 'classpath:tonyt/putpet_nopayload_input.json' | 400 |
        | 'classpath:tonyt/putpet_wrongschema_input.json' | 500 |
        | 'classpath:tonyt/putpet_missingid_input.json' | 500 |
        
  