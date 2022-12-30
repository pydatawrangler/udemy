# states = ['California', 'Texas', 'Florida', 'New York']

# print(states)

# with open('test.txt', 'w') as file:
#     file.write("Data successfully scraped!")
    
new_list = [2, 4, 6, 'Califonia']

for element in new_list:
    try:
        print(element/2)
    except:
        print('The element is not a number!')
