Feature: Test Airports API

Background: The Request Body Configuration
  # Set a configuration for the payload
* url baseUrl = "https://freetestapi.com/api/v1/"

@GetAirportById
Scenario: GET /airports/{airportId}
  Given def airportId = 1
  Given def jsonBody =
  """
  {
    "id": 1,
    "name": "Singapore Changi Airport",
    "code": "SIN",
    "location": {
        "latitude": 1.3644,
        "longitude": 103.9915
    },
    "city": "Singapore",
    "country": "Singapore",
    "timezone": "Asia/Singapore",
    "terminals": [
        {
            "name": "Terminal 1",
            "gates": [
                {
                    "gate_number": "Gate A1",
                    "airlines": [
                        "Singapore Airlines",
                        "SilkAir"
                    ]
                },
                {
                    "gate_number": "Gate A2",
                    "airlines": [
                        "AirAsia",
                        "Scoot"
                    ]
                }
            ]
        },
        {
            "name": "Terminal 2",
            "gates": [
                {
                    "gate_number": "Gate B1",
                    "airlines": [
                        "Emirates",
                        "Qantas"
                    ]
                },
                {
                    "gate_number": "Gate B2",
                    "airlines": [
                        "Cathay Pacific",
                        "Malaysia Airlines"
                    ]
                }
            ]
        },
        {
            "name": "Terminal 3",
            "gates": [
                {
                    "gate_number": "Gate C1",
                    "airlines": [
                        "Jetstar",
                        "Tigerair"
                    ]
                },
                {
                    "gate_number": "Gate C2",
                    "airlines": [
                        "KLM",
                        "Delta Air Lines"
                    ]
                }
            ]
        }
    ],
    "airlines": [
        "Singapore Airlines",
        "SilkAir",
        "AirAsia",
        "Scoot",
        "Emirates",
        "Qantas",
        "Cathay Pacific",
        "Malaysia Airlines",
        "Jetstar",
        "Tigerair",
        "KLM",
        "Delta Air Lines"
    ],
    "services": [
        "Parking",
        "Restaurants",
        "Shops",
        "ATM",
        "Car Rental"
    ],
    "contact_info": {
        "phone": "+65 6595 6868",
        "email": "feedback@changiairport.com",
        "website": "https://www.changiairport.com"
    }
}
  """

  Given header Content-Type = 'application/json'
  And path 'airports', airportId
    # The above will generate GET /airports/1

  When method get
  Then status 200
  And match response == jsonBody

@GetAllAirports
Scenario: GET /airports?sort=name&order=dec

  Given header Content-Type = 'application/json'
  And path 'airports'
  And param sort = 'name&order=dec'
    # This param variable named "sort" will be appended towards the end of UR after ? => GET /airlines?sort=name&order=dec
  
  When method get
  Then status 200