## Schema
```json
{
  "openapi": "3.1.0",
  "info": {
    "title": "Code Evaluation API",
    "description": "Allows for the evaluation of go code snippets.",
    "version": "v1.0.0"
  },
  "servers": [
    {
      "url": "https://goeval-production.up.railway.app"
    }
  ],
  "paths": {
    "/check/gosyntax": {
      "post": {
        "description": "Evaluate Go code",
        "operationId": "EvaluateCode",
        "x-openai-isConsequential": false,
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
            "description": "Go code to evaluate"
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
