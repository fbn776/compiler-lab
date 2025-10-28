files = ["a1", "a2", "a3"]
output = ""

for file in files:
    with open(file, "r") as f:
        output += f.read()

print(output)
