## Schema
```json
{
  "openapi": "3.1.0",
  "info": {
    "title": "Code Evaluation API",
    "description": "Allows for the evaluation of Elixir code snippets.",
    "version": "v1.0.0"
  },
  "servers": [
    {
      "url": "https://codeeval-production.up.railway.app"
    }
  ],
  "paths": {
    "/api/run": {
      "post": {
        "description": "Evaluate Elixir code",
        "operationId": "EvaluateCode",
        "parameters": [],
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {
              "schema": {
                 "$ref": "#/components/schemas/RequestEvaluateCodeSchema"
              }
            }
          }
        },
        "deprecated": false,
        "security": [
          {
            "apiKey": []
          }
        ]
      }
    }
  },
  "components": {
"schemas": {
      "RequestEvaluateCodeSchema": {
        "properties": {
          "code": {
            "type": "string",
            "title": "model",
            "description": "Elixir code to evaluate"
          }
        },
        "type": "object",
        "required": [
          "code"
        ],
        "title": "RequestEvaluateCodeSchema"
      }
},
    "securitySchemes": {
      "apiKey": {
        "type": "apiKey"
      }
    }
  }
}
```
