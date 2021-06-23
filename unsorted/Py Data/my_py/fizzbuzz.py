x=[]
user_input = int(input("Enter an integer: "))
for i in range(0,user_input):
    if (i % 3 == 0 and i % 5 == 0):
        x.append("Fizzbuzz")
    elif i % 3 == 0:
        x.append("Fizz")
    elif i % 5 == 0:
        x.append("Buzz")
    else: 
        x.append(i)
    print(x)
    i += 1
sum = 0
fizz_count = 0
buzz_count = 0
fizzbuzz_count = 0
for each in x:
    if isinstance(each, int) == True:
        sum = sum + each
    elif each == "Fizz":
        fizz_count += 1
    elif each == "Buzz":
        buzz_count += 1
    else:
        fizzbuzz_count += 1
print(f"{sum},{fizz_count},{buzz_count},{fizzbuzz_count}")
