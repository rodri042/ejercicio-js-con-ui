PhilipsExporter = require("./philipsExporter")

describe "PhilipsExporter", ->
  it "can create the fixed length string correctly", ->
    philipsExporter = new PhilipsExporter()

    fixedLengthFile = philipsExporter.getFile [
      {
        "tags": [],
        "integrations": [
            {
                "integrationId": 944235208,
                "app": "Meli"
            }
        ],
        "channel": "Meli",
        "contact": {
            "name": "TETE3169694",
            "contactPerson": "Test Test",
            "mail": "test_user_80677946@testuser.com",
            "phoneNumber": "01-1111-1111",
            "taxId": "36724222",
            "location": {
                "address": "Ramón Falcón 6111 - asdasd",
                "state": "Buenos Aires",
                "city": "Avellaneda",
                "zipCode": "1408"
            },
            "notes": null,
            "type": "Customer",
            "priceList": null,
            "profile": {
                "app": "Meli",
                "integrationId": 178492432
            },
            "id": 1661
        },
        "lines": [
            {
                "price": 1000,
                "product": {
                    "description": "El Modem WiFi",
                    "sku": "MODEMWIFI22",
                    "id": 4127
                },
                "variation": {
                    "primaryColor": null,
                    "secondaryColor": null,
                    "size": null,
                    "id": 5716,
                    "barcode": null
                },
                "quantity": 1
            }
        ],
        "warehouse": "Default",
        "payments": [],
        "shipments": [],
        "amount": 1000,
        "shippingCost": 300.5,
        "paymentStatus": "Pending",
        "deliveryStatus": "ReadyToShip",
        "paymentFulfillmentStatus": "Pending",
        "deliveryFulfillmentStatus": "Pending",
        "deliveryMethod": "Ship",
        "paymentTerm": "Advance",
        "customId": null,
        "date": "2015-04-15T19:38:58",
        "notes": null,
        "id": 1227
      }
    ,
      {
          "tags": [],
          "integrations": [
              {
                  "integrationId": 944233259,
                  "app": "Meli"
              }
          ],
          "channel": "Meli",
          "contact": {
              "name": "TETE5553955",
              "contactPerson": "Test Test",
              "mail": "test_user_51551656@testuser.com",
              "phoneNumber": "01-1111-1111",
              "taxId": "36245689",
              "location": null,
              "notes": null,
              "type": "Customer",
              "priceList": null,
              "profile": {
                  "app": "Meli",
                  "integrationId": 178490672
              },
              "id": 1660
          },
          "lines": [
              {
                  "price": 1000,
                  "product": {
                      "description": "El Modem Más Piola",
                      "sku": "MODEMWIFI22",
                      "id": 4127
                  },
                  "variation": {
                      "primaryColor": null,
                      "secondaryColor": null,
                      "size": null,
                      "id": 5716,
                      "barcode": null
                  },
                  "quantity": 1
              }
          ],
          "warehouse": "Default",
          "payments": [],
          "shipments": [],
          "amount": 1000,
          "shippingCost": 0,
          "paymentStatus": "Pending",
          "deliveryStatus": "ToBeConfirmed",
          "paymentFulfillmentStatus": "Pending",
          "deliveryFulfillmentStatus": "Pending",
          "deliveryMethod": "ToBeConfirmed",
          "paymentTerm": "Advance",
          "customId": null,
          "date": "2015-04-15T19:32:12",
          "notes": null,
          "id": 1226
      }
    ]

    fixedLengthFile.should.eql "1227        MODEMWIFI22                   000001000.000000001.00000000300.5036724222   Test Test                  TETE3169694         Ramón Falcón 6111 - asdasd              01-1111-1111        Buenos Aires                  1408      Avellaneda          " + "\r\n" +
      "1226        MODEMWIFI22                   000001000.000000001.00000000000.0036245689   Test Test                  TETE5553955                                                 01-1111-1111                                                                    "
