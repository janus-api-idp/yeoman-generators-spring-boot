openapi: 3.0.3
info:
  title: <%= appName %> - OpenAPI 3.0
  description: |-
    Employee API Spec
  version: 1.0.0
servers:
  - url: api/v1
paths:
  /employee:
    post:
      tags:
        - employee
      summary: Add a new Entity
      description: Add a new employee
      operationId: addEmployee
      requestBody:
        description: Create a new employee
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/Employee'
        required: true
      responses:
        '200':
          description: Created
          content:
            application/text:
              schema:
                type: string
        '400':
          description: Invalid request
    get:
      tags:
        - employee
      summary: Get all employees
      description: Get all employees
      operationId: getEmployees
      responses:
        '200':
          description: successful operation
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/Employee'
        '400':
          description: Invalid request
components:
  schemas:
    Employee:
      type: object
      properties:
        id:
          type: integer
          format: int64
          example: 10
        name:
          type: string
          example: John
        age:
          type: integer
          format: int
          example: 25