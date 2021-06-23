
name_input = input("Enter your name: ")
age_input = input("Enter your age: ")
years_input = input("Enter your years using language: ")

my_dict = {"name":name_input, "age":age_input, "years":years_input}

first_lang = tuple(input("Enter first three lang: "))
print(first_lang)

my_tuple = (name_input, age_input, years_input)

favorite_lang = input("Enter your three favorite languages: ").split()
print(favorite_lang)

first_lang = set(first_lang)
favorite_lang = set(favorite_lang)

print(first_lang.intersection(favorite_lang))