fruits = ("apple","mango","banana","kiwi","mango")
print(fruits)
print(fruits[0])
print(fruits[1:-2])

# fruits[3] = "durian"

more_fruits = fruits + ("durian",)
print(more_fruits)
print(fruits)

print(fruits.count("mango"))
print(fruits.index("mango"))

empty_tuple = ()
print(empty_tuple)
print(type(empty_tuple))