#print('Hello World')
# this is a comment
"""
this is a multi line string
this is a multi line comment
"""
#print(42)
#print(1,2,3)
"""
name = input("Enter your name: ")
#print(name)
age = input("Enter your age: ")
profession = input("Enter your profession: ")
print("You've entered: " + name + " " + age + " " + profession)
"""
#if name == "Hello World":
#    print("You entered " + name)
"""
x = "Hello World"
print(x)
x = 42
print(x)

x,y,z = "Car","Bike","Vehicle"
print(x + y + z)

#python preferred style snakecase
my_language = "Python"
myProgrammingLanguage = "Java"

my_boolean = True
my_int = 10
my_float = 12.3
my_complex = 3j
print(my_complex * my_complex) # kept as complex
print(my_int + my_float) #float
print(my_int + my_complex) #complex
print(int(my_float)) # will not round, chops off the end # cannot convert complex to int
print(float(my_int))
print(complex(my_int))
print(int("42"))


print("The number is " + str(42))
print(len("Hello World"))

message = "hello {}, you are {} years old"
new_string = message.format("python","31")
print(new_string)
print(message)

num = 12
print(f"The number is {num}, double is {num*2}")


print(None)
print(type("Hello World"))
var = True
#var = 32
print(type(var))
print(isinstance(var,str))

x =12
print(x)
del(x)
print(x)
"""

input = input("Enter your name: ")
int(input2) = input("Enter your age: ")

name = input.title()
#print(name)
first_name = name.split()[0]
last_name = name.split()[1]
print(first_name)
print(last_name)
#int(input2)
#print("Your email is: "+ name[0]+"."+name[1])