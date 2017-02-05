# Shopping-basket-code-test

This is a weekend homework for CodeClan following this specification (with the exception that it was agreed that Ruby would be acceptable despite not being a static language):

	You have been asked to model a shopping basket.

	We must be able to:

	Add items to the shopping basket
	Remove items from the shopping basket
	Empty the shopping basket
	Additionally, we must be able to calculate the total value of the shopping basket accounting for:

	Buy-one-get-one-free discounts on items
	10% off on totals greater than £20 (after bogof)
	2% off on total (after all other discounts) for customers with loyalty cards.
	We must be able to see the code running via passing tests.

	What we will be looking for:
	Evidence of using a statically typed programming language and solid coding techniques with evidence of test driven 	development.
	
The project has the following classes, with separate files showing tests:

	Item				- name and value for each item to go into basket
	Customer		- name and whether they hold a loyalty card
	Basket			- can add/remove items, calculate total cost
	Discount		- calculates values to reduce total cost for a number of discounts
	Till				- takes basket and customer and applies discounts
	
	
	
