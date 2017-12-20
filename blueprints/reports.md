## Reports Collection [/api/reports]

### List Reports [GET]

+ Parameters
    + type (optional, number, `1`) ... Report type id
    + status (optional, number, `1`) ... Report status id
    + limit (optional, number, `20`) ... Returned entries limit
    + offset (optional, number, `0`) ... List offset

+ Response 200 (application/json)

        {
            "entries": [
                {
                    "id": 1,
                    "ref_no": null,
                    "report_type_id": 1,
                    "status_id": 1,
                    "user_id": 1,
                    "app_id": null,
                    "description": "Description",
                    "answer": null,
                    "license_plate_no": null,
                    "lat": "9.99",
                    "lng": "9.99",
                    "address": "Gedimino pr 9.",
                    "address_postcode": null,
                    "address_street": null,
                    "address_house_no": null,
                    "city_id": 1,
                    "registered_at": "2017-02-24T22:17:25.000Z",
                    "completed_at": null,
                    "created_at": "2017-12-20T20:34:39.000Z",
                    "updated_at": "2017-12-20T20:34:39.000Z"
                }
            ]
        }

### Create a New Report [POST]

+ Request (application/json)

        {
            "report": {
                "report_type_id": "1",
                "status_id": "1",
                "description": "Description",
                "address": "Address",
                "license_plate_no": "ABC123",
                "lat": "9.99",
                "lng": "9.99",
                "registered_at": "2017-12-01 12:00:00"
            }
        }

+ Response 201 (application/json)

        {
            "id": 1,
            "ref_no": null,
            "report_type_id": 1,
            "lat": "9.99",
            "lng": "9.99",
            "user_id": 2,
            "status_id": 1,
            "description": "Description",
            "answer": null,
            "license_plate_no": "ABC123",
            "registered_at": "2017-02-24T22:17:25.000Z",
            "completed_at": null
        }

## Report [/api/reports/{id}]

A single Report object

### Retrieve a Report [GET]

+ Response 200 (application/json)

        {
            "id": 1,
            "ref_no": null,
            "report_type_id": 1,
            "lat": "9.99",
            "lng": "9.99",
            "user_id": 2,
            "status_id": 1,
            "description": "Description",
            "answer": null,
            "license_plate_no": "ABC123",
            "registered_at": "2017-02-24T22:17:25.000Z",
            "completed_at": null
        }
