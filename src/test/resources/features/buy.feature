Feature: Buy products
    As a customer
    I want to buy products

Background:
    Given the store is ready to service customers
    And a product "Bread" with price 20.50 and stock of 5 exists
    And a product "Jam" with price 80.00 and stock of 10 exists
    And a product "Butter" with price 30.00 and stock of 3 exists

Scenario: Buy one product
    When I buy "Bread" with quantity 2
    Then total should be 41.00

Scenario: Buy multiple products
    When I buy "Bread" with quantity 2
    And I buy "Jam" with quantity 1
    And I buy "Butter" with quantity 1
    Then total should be 151.0

Scenario: Buy product quantity > stock
    When I buy "Bread" with quantity 15
    Then throw Not enough stock

Scenario Outline: Buy one product
    When I buy <product> with quantity <quantity>
    Then total should be <total>
    Examples:
        | product  | quantity |  total  |
        | "Bread"  |     1    |   20.50 |
        | "Jam"    |     2    |  160.00 |
        | "Butter" |     3    |   90.00 |

Scenario Outline: Check stock product
    When I want to check <product> stock
    Then stock should be <total>
    Examples:
        | product  |  total |
        | "Bread"  |    5   |
        | "Jam"    |    10  |
        | "Butter" |    3  |
