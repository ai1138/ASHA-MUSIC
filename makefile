
PYTHON = python3


.PHONY = help setup test run clean

# Defining an array variable
FILES = input output

.DEFAULT_GOAL = help

# The @ makes sure that the command itself isn't echoed in the terminal
help:
	@echo "---------------HELP-----------------"
	@echo "To test the project type make test"
	@echo "To run the project type make run"
	@echo "------------------------------------"



test:
	${PYTHON} -m pytest
dev_env: 
	pip install "requirements.txt"
	
run:
	${PYTHON} app.py


clean:
	rm -r *.project



HI ABED
