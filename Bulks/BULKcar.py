import random
import datetime



def generateLicensePlate():
    letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    l1 = str(random.choice(letters))
    l2 = str(random.choice(letters))
    l3 = str(random.choice(letters))
    n1 = str(random.randint(0, 9))
    n2 = str(random.randint(0, 9))
    n3 = str(random.randint(0, 9))
    n4 = str(random.randint(0, 9))
    platenumber = l1 + l2 + l3 + n1 + n2 + n3 + n4

    return platenumber

def generateBrand():
    brandsList = ['Mercedes', 'Audi', 'Skoda', 'BMW', 'Citroen', 'Dacia', 'Fiat', 'Opel']
    brand = random.choice(brandsList)

    return brand

def generateModel(carBrand):
    mercedesModels = ['A', 'E', 'EQA', 'B', 'C', 'EQC', 'GLE', 'GLS', 'Marco Polo', 'S']
    audiModels = ['A1', 'A3', 'A4', 'A6', 'A7', 'A5', 'Q3', 'Q5', 'Q7', 'R8']
    skodaModels = ['SuperB', 'Karoq', 'Fabia', 'Scala', 'Octavia', 'Kamiq', 'Kodiaq']
    bmwModels = ['1', '2', '3', '4', '5', '6', '7', '8', 'X1', 'X2', 'Z4', 'X3', 'X4']
    citroenModels = ['C3', 'C4', 'C4 X', 'C5 Aircross', 'C5 X']
    daciaModels = ['Duster', 'Jogger', 'Sandero', 'Spring', 'Cargo']
    fiatModels = ['500', '500C', '500X', 'Doblo', 'Fiorino', 'Panda', 'Panda Van', 'Tipo']
    opelModels = ['Astra', 'Combo', 'Corsa', 'Crossland X', 'Grandland X', 'Insignia', 'Mokka']

    if carBrand == 'Mercedes':
        model = random.choice(mercedesModels)
    elif carBrand == 'Audi':
        model = random.choice(audiModels)
    elif carBrand == 'Skoda':
        model = random.choice(skodaModels)
    elif carBrand == 'BMW':
        model = random.choice(bmwModels)
    elif carBrand == 'Citroen':
        model = random.choice(citroenModels)
    elif carBrand == 'Dacia':
        model = random.choice(daciaModels)
    elif carBrand == 'Fiat':
        model = random.choice(fiatModels)
    else:
        model = random.choice(opelModels)
    
    return model

def generateProductionYear():
    first_date = datetime.date(2000, 1, 1)
    second_date = datetime.date(2023, 3, 21)
    num_days_between = (second_date - first_date).days
    rand_days = random.randint(1, num_days_between)

    production_year = first_date + datetime.timedelta(days = rand_days)

    return production_year

def generateCarType():
    car_types_list = ['H', 'M', 'L']
    car_type = random.choice(car_types_list)

    return car_type


records_number = 20
data = []
data_licence_plate = []

for i in range(records_number):
    license_plate = generateLicensePlate()
    brand = generateBrand()
    model = generateModel(brand)
    production_year = generateProductionYear()
    car_type = generateCarType()

    record = f"{license_plate}|{brand}|{model}|{production_year}|{car_type}"
    data.append(record)

    record_licence_plate = f"{license_plate}"
    data_licence_plate.append(record_licence_plate)

#?!!?!data = list(dict.fromkeys(data))

with open('car_data.bulk', 'w') as f:
    f.truncate()
    for record in data:
        f.write(record + '\n')
    f.close()

with open('licence_plates.txt', 'w') as f:
    f.truncate()
    for record in data_licence_plate:
        f.write(record + '\n')
    f.close()