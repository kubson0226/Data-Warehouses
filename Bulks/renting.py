import random
import numpy

def generate_address_renting():
    street = ['Pańska', 'Hodowlana', 'Długa', 'Różana', 'Czarna', 'Pilna', 'Lubelska', 'Gradientowa', 'Kolejowa', 'Warszawska', 'Śląska', 'Bawełniana', 'Morska', 'Dębowa', 'Poznańska']
    number1 = str(random.randint(0,300))
    number2 = str(random.randint(0,99))
    return random.choice(street) + " " + str(random.randint(0,300)) + "/" + str(random.randint(0,99))

def generate_city():
    city = ['Gdynia','Gdańsk','Warszawa','Łódź','Poznań', 'Toruń', 'Bydgoszcz', 'Zakopane', 'Wrocław', 'Kielce', 'Olsztyn', 'Szczecin', 'Lublin', 'Lubin','Suwałki', 'Iława', 'Malbork', 'Opole', 'Kraków', 'Rzeszów']
    return random.choice(city)

def generate_postal_code():
    number1 = str(random.randint(10, 99))
    number2 = str(random.randint(100, 999))
    return number1 + '-' + number2


data = []
data2 = []
for i in range(100):
    id = i
    address_renting = generate_address_renting()
    city_renting = generate_city()
    postal_code = generate_postal_code()
    record = f"{id}|{city_renting}|{address_renting}|{postal_code}"
    record2 = f"{id}"
    data.append(record)
    data2.append(record2)

with open('renting.csv', 'w') as f:
    for record in data:
        f.write(record + '\n')

with open('renting.bulk', 'w') as f:
    for record2 in data2:
        f.write(record2)
