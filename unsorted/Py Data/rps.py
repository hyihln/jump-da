rps1 = input("first player enter r, p, or s: ")
rps2 = input("second player enter r, p, or s: ")

if rps1 == "r":
    if rps2 == "r":
        print("tie")
    elif rps2 == "p":
        print("first loses")
    elif rps2 == "s":
        print("first wins")
    else:
        print("second invalid input")
elif rps1 == "p":
    if rps2 == "r":
        print("first wins")
    elif rps2 == "p":
        print("tie")
    elif rps2 == "s":
        print("first loses")
    else:
        print("second invalid input")
elif rps1 == "s":
    if rps2 == "r":
        print("first loses")
    elif rps2 == "p":
        print("first wins")
    elif rps2 == "s":
        print("tie")
    else:
        print("second invalid input")
else:
    print("first invalid input")