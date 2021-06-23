fruits = ["apple","banana","mango","kiwi","peach"]
print(fruits)

mixed_list = ["Hello", 30, [1,2,3], None]
print(mixed_list)

print(fruits[0])
print(fruits[-1]) # from the end
print(fruits[0:3])
print(fruits[1:-1])

fruits.append("orange") # append alters the original
fruits.append("mango")
print(fruits)

mixed_list.clear()
print(mixed_list)
print(bool(mixed_list))

fruits_copy = fruits.copy()
print(fruits.copy)
fruits[2] = "mango"
print(fruits)
print(fruits.copy)