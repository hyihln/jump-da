full_name = input("Enter employee first and last name: ").split(" ")
print(full_name)
first_name = full_name[0].lower().capitalize()
last_name = full_name[-1].lower().capitalize()
print(f"{first_name} {last_name}")

age_input = int(input("Enter employee age: "))
print(age_input)

email = f"{first_name}.{last_name}@company.com"
print(f""" first name {first name})
last name {last_name}
age {age_input}
""")