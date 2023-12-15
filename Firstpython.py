import datetime

current_year = datetime.datetime.now().year

print("Enter your birth year: ")
birth_year = int(input())

age = current_year - birth_year

print("Your age is: ", age)