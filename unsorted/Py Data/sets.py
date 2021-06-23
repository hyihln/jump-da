fruit_set = {"apple", "mango", "kiwi", "banana", "mango"}
print(fruit_set)

fruit_set.add("avocado")
print(fruit_set)

fruit_set.discard("apple")
print(fruit_set)

fruit_set.update(("apple", "banana", "kiwi"))
print(fruit_set)

random_fruit = fruit_set.pop()
print(random_fruit)

season_fruits = {"avacado","cherry", "peach", "grapefruit", "kiwi", "lemon"}
fav_fruits = {"strawberry", "pear", "avacado", "lemon"}

print(season_fruits.intersection(fav_fruits))
print(season_fruits.difference(fav_fruits))

