import random
import datetime
import string

CUSTOMER_NUMBER = 20000
EMPLOYEE_NUMBER = 10000
RENTINGPOINT_NUMBER = 100
CAR_NUMBER = 12000

MIN_DATES_NUMBER = 60
MAX_DATES_NUMBER = 140

MIN_DATES_NUMBER_2 = 20
MAX_DATES_NUMBER_2 = 60

BEGGINING_DATE = 2015
ENDING_DATE = 2021

BEGGINING_DATE_2 = ENDING_DATE
ENDING_DATE_2 = 2023

PROBABILITY = 75

#! RENTING POINT
def RentingPointGenerateAddress():
    street = ['Pańska', 'Hodowlana', 'Długa', 'Różana', 'Czarna', 'Pilna', 'Lubelska', 'Gradientowa', 'Kolejowa', 'Warszawska', 'Śląska', 'Bawełniana', 'Morska', 'Dębowa', 'Poznańska']
    number1 = str(random.randint(0,300))
    number2 = str(random.randint(0,99))
    return random.choice(street) + " " + str(random.randint(0,300)) + "/" + str(random.randint(0,99))

def RentingPointGenerateCity():
    city = ['Gdynia','Gdańsk','Warszawa','Łódź','Poznań', 'Toruń', 'Bydgoszcz', 'Zakopane', 'Wrocław', 'Kielce', 'Olsztyn', 'Szczecin', 'Lublin', 'Lubin','Suwałki', 'Iława', 'Malbork', 'Opole', 'Kraków', 'Rzeszów']
    return random.choice(city)

def RentingPointGeneratePostalCode():
    number1 = str(random.randint(10, 99))
    number2 = str(random.randint(100, 999))
    return number1 + '-' + number2

def RentingPointGeneratePointID():
    return random.randint(1, 100)

def RentingPointDataGenerator():
    data = []
    id_data = []
    id = 0
    for _ in range(RENTINGPOINT_NUMBER):
        id += 1
        address_renting = RentingPointGenerateAddress()
        city_renting = RentingPointGenerateCity()
        postal_code = RentingPointGeneratePostalCode()
        record = f"{id},{city_renting},{address_renting},{postal_code}"
        data.append(record)
        record_id = f"{id}"
        id_data.append(record_id)

    return data, id_data


#! CUSTOMER RELATED
def CustomerGeneratePESEL():
    year = random.randint(1950, 2000)
    month = random.randint(1, 12)
    if month in [1, 3, 5, 7, 8, 10, 12]:
        day = random.randint(1, 31)
    elif month in [4, 6, 9, 11]:
        day = random.randint(1, 30)
    else:
        day = random.randint(1, 28)
    year_str = str(year)[2:]
    month_str = str(month).zfill(2)
    day_str = str(day).zfill(2)
    rand_num = random.randint(0, 9999)
    if rand_num < 10:
        rand_num_final = "000" + str(rand_num)
    elif rand_num < 100:
        rand_num_final = "00" + str(rand_num)
    elif rand_num < 1000:
        rand_num_final = "0" + str(rand_num)
    else:
        rand_num_final = str(rand_num)
    control_sum = random.randint(0, 9)
    if control_sum == 0:
        control_sum = 0
    else:
        control_sum = 10 - control_sum

    return year_str + month_str + day_str + rand_num_final + str(control_sum)

def CustomerGenerateName():
    first_names = ['Adam', 'Aleksander', 'Andrzej', 'Bartosz', 'Dariusz', 'Grzegorz', 'Jakub', 'Jan', 'Krzysztof', 'Marcin', 'Michał', 'Piotr', 'Rafał', 'Tomasz', 'Wojciech']
    return random.choice(first_names)

def CustomerGenerateSurname():
    surnames = ["Krawczyk","Rutkowski","Sobczak",'Sikora','Ostrowski','Błaszczyk','Urbańska','Lewandowski','Mazurek','Kucharski','Czarnecki','Baranowski','Czarnecki','Woźniak','Krawczyk','Dąbrowski','Borkowski','Błaszczyk','Przybylski','Sadowska','Szymański','Jakubowski','Wasilewska','Dąbrowski','Piotrowski','Górski','Piotrowki','Laskowska','Woźniak','Zakrzewska','Szymański','Sadowska','Zawadzki','Rutkowski','Urbańska','Wójcik','Sikorska','Walczak','Sikora','Sadowska','Kowalczyk','Górski','Czerwińki','Sobczak','Sokołowski','Borkowski','Kamiński','Baran','Kamiński','Adamska','Wiśniewski','Urbańska','Kowalski','Chmielewski','Sadowska','Cieślak','Sikora','Ostrowski','Rutkowski','Urbańska','Baran','Kubiak','Mróz','Woźniak','Mazur','Pietrzak','Czerwiński','Szymczak','Sawicki','Adamska','Wójcik','Baran','Górski','Wasilewska','Andrzejewski','Kowalczyk','Zalewski','Urbańska','Szczepański']
    return random.choice(surnames)

def CustomerGeneratePhoneNumber():
    return str(random.randint(100000000, 999999999))

def CustomerGenerateDateOfBirth(pesel):
    new_year = int(pesel[0])
    year = int(pesel[:2])
    month = int(pesel[2:4])
    day = int(pesel[4:6])
    if month > 80:
        year += 1800
        month -= 80
    elif month > 60:
        year += 2200
        month -= 60
    elif month > 40:
        year += 2100
        month -= 40
    elif month > 20:
        year += 2000
        month -= 20
    else:
        year += 1900
    if(new_year == 0):
        year = 2000
    return datetime.datetime(year, month, day)

def CustomerGenerateSex(pesel):
    sex = int(pesel[9])
    if sex % 2 == 0:
        return 'female'
    else:
        return 'male'

def CustomerGenerateDrivingLicence():
    city = str(random.choice(string.ascii_uppercase))
    number = str(random.randint(100000, 999999))
    return city + number

def CustomerGenerateEmail(name, surname, year):
    domain = ['o2', 'wp', 'gmail', 'tlen']
    return name + "." + surname + year + "@" + random.choice(domain) + "." + "com"

def CustomerGenerateAddress():
    street = ['Polna','Lesna','Sloneczna','Krotka','Szkolna', 'Ogrodowa','Lipowa','Lakowa','Brzozowa','Kwiatowa','Koscielna','Sosnowa','Zielona','Parkowa','Akacjowa','Kolejowa','Zaglowa','Armii Krajowej','Grunwaldzka','Opolska','Jachtowa','Fregatowa','Karciana','Mazowiecka']
    number1 = str(random.randint(0,300))
    number2 = str(random.randint(0,99))
    return random.choice(street) + " " + str(random.randint(0,300)) + "/" + str(random.randint(0,99))

def CustomerGenerateCity():
    city = ['Gdynia','Gdansk','Warszawa','Lodz','Poznan', 'Torun', 'Bydgoszcz', 'Zakopane', 'Wroclaw', 'Kielce', 'Olsztyn', 'Szczecin', 'Lublin', 'Lubin','Suwalki', 'Ilawa', 'Malbork', 'Opole', 'Krakow', 'Rzeszow']
    return random.choice(city)

def CustomerDataGenerator(num_records): 
    data = []
    pesel_data = []
    data2 = []
    for i in range(num_records):
        pesel = CustomerGeneratePESEL()
        name = CustomerGenerateName()
        surname = CustomerGenerateSurname()
        date_of_birth = CustomerGenerateDateOfBirth(pesel)
        sex = CustomerGenerateSex(pesel)
        phone_number = CustomerGeneratePhoneNumber()
        driving_licence = CustomerGenerateDrivingLicence()
        email = CustomerGenerateEmail(name, surname, str(int(pesel[:2])))
        address = CustomerGenerateAddress()
        city = CustomerGenerateCity()
        record = f"{pesel},{name},{surname},{date_of_birth.strftime('%Y-%m-%d')},{sex},{driving_licence},{phone_number},{email},{address},{city}"
        record_pesel = f"{pesel}"
        data.append(record)
        pesel_data.append(record_pesel)

        if i % 100 == 0:
            city = CustomerGenerateCity()
        
        record2 = f"{pesel},{name},{surname},{date_of_birth.strftime('%Y-%m-%d')},{sex},{driving_licence},{phone_number},{email},{address},{city}"
        data2.append(record2)
    
    return data, pesel_data, data2

#! CAR RELATED
def CarGenerateLicencePlate():
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

def CarGenerateBrand():
    brandsList = ['Mercedes', 'Audi', 'Skoda', 'BMW', 'Citroen', 'Dacia', 'Fiat', 'Opel']
    brand = random.choice(brandsList)

    return brand

def CarGenerateModel(carBrand):
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

def CarGenerateProductionYear():
    first_date = datetime.date(2000, 1, 1)
    second_date = datetime.date(2023, 3, 21)
    num_days_between = (second_date - first_date).days
    rand_days = random.randint(1, num_days_between)

    production_year = first_date + datetime.timedelta(days = rand_days)

    return production_year

def CarGenerateCarType():
    car_types_list = ['H', 'M', 'L']
    car_type = random.choice(car_types_list)

    return car_type

def CarDataGenerator(car_number):
    data = []
    data_licence_plate = []

    for _ in range(car_number):
        license_plate = CarGenerateLicencePlate()
        brand = CarGenerateBrand()
        model = CarGenerateModel(brand)
        production_year = CarGenerateProductionYear()
        car_type = CarGenerateCarType()

        record = f"{license_plate}|{brand}|{model}|{production_year}|{car_type}"
        data.append(record)

        record_licence_plate = f"{license_plate}"
        data_licence_plate.append(record_licence_plate)

    return data, data_licence_plate

#! EMPLOYEE RELATED
def EmployeeGenerateID():
    id1 = str(random.randint(100000, 999999))
    return id1

def EmployeeGenerateFullName():
    name_list = ['Andrzej', 'Mariusz', 'Wojciech', 'Jakub', 'Bartosz', 'Kondrad', 'Brajan', 'Agata', 'Andrew', 'Natalia', 'Alicja', 'Katarzyna', 'Alicja', 'Joanna', 'Zuzanna']
    surname_list = ['Kopczych', 'Wojanek', 'Tate', 'Wojtacki', 'Polski', "Tomaszczyk", 'Podlinski', 'Strojek', 'Mielewczyk', 'Kondracki']

    first_name = random.choice(name_list)
    surname = random.choice(surname_list)

    return first_name, surname

def EmployeeGeneratePhoneNumber():
    phone_number = str(random.randint(100000000, 999999999))

    return phone_number

def EmployeeDataGenerator():
    data = []
    employee_id_data = []
    employee_id = 100000
    for _ in range(EMPLOYEE_NUMBER):
        employee_id += 1
        name, surname = EmployeeGenerateFullName()
        phone_number = EmployeeGeneratePhoneNumber()
        renting_point_ID = RentingPointGeneratePointID()

        record = f"{employee_id}|{name}|{surname}|{phone_number}|{renting_point_ID}"
        data.append(record)
        emp_id = f"{employee_id}"
        employee_id_data.append(emp_id)
    return data, employee_id_data


#! CONNECTED
def DatesGenerateWithLicencePlatesLists(licence_plate_data):

    dates_car_occupancy_from = []
    dates_car_occupancy_to = []
    dates_car_reservation_from = []
    dates_car_reservation_to = []

    #! BIIIG LOOP
    for i in range(len(licence_plate_data)):
        #* random dates list
        dates = []
        beggining_date = datetime.date(BEGGINING_DATE, 1, 1)
        last_date = datetime.date(ENDING_DATE, 1, 1)
        number_of_dates = int(random.randint(MIN_DATES_NUMBER, MAX_DATES_NUMBER) * 2)

        for i in range(number_of_dates):
            first_date = beggining_date
            second_date = last_date
            num_days_between = (second_date - first_date).days
            rand_days = random.randint(1, num_days_between)

            random_date = first_date + datetime.timedelta(days = rand_days)
            #* Dates list update
            if i == number_of_dates - 1:
                dates.append(last_date)
                break
            dates.append(random_date)
        
                

        #* Sorted random dates list
        sorted_dates = sorted(dates)


        #* Date from occupancy
        occupancy_date_from_list_single_car = []
        #* Date from occupancy
        occupancy_date_to_list_single_car = []

        #* Loop for updating date from/date to
        for i in range(number_of_dates):
            if i % 2 == 0:
                occupancy_date_from_list_single_car.append(sorted_dates[i])
            else:
                occupancy_date_to_list_single_car.append(sorted_dates[i])
        
        #! APPENDING ALL OCCUPANCY DATES
        dates_car_occupancy_from.append(occupancy_date_from_list_single_car)
        dates_car_occupancy_to.append(occupancy_date_to_list_single_car)

        #for i in range(int(number_of_dates / 2)):
        #    print(str(i) + ' ' + str(occupancy_date_from_list_single_car[i]) + ' - ' + str(occupancy_date_to_list_single_car[i]))
        #print('$$$$$$$$$$$$$$$$$$$$$$$$$')

        #* Date from reservation
        reservation_date_from_list = occupancy_date_to_list_single_car[0:-1]
        #* Date to reservation
        reservation_date_to_list = occupancy_date_from_list_single_car[1:]

        #! Appending ALL RESERVATIONS DATES
        dates_car_reservation_from.append(reservation_date_from_list)
        dates_car_reservation_to.append(reservation_date_to_list)
        
        #for i in range(int(number_of_dates / 2 - 1)):
        #    print(str(reservation_date_from_list[i]) + ' - ' + str(reservation_date_to_list[i]))
        #print('---------------------------')
    """
    licence_plates_occupancy_data = []
    licence_plates_reservation_data = []
    for i in range(len(licence_plate_data)):
        for j in range(len(dates_car_occupancy_from[i])):
            licence_plates_occupancy_data.append(licence_plate_data[i])
    for i in range(len(licence_plate_data)):
        for j in range(len(dates_car_reservation_from[i])):
            licence_plates_reservation_data.append(licence_plate_data[i])"""


    return dates_car_occupancy_from, dates_car_occupancy_to, dates_car_reservation_from, dates_car_reservation_to
    
def DatesGenerateWithLicencePlatesLists2(licence_plate_data):

    dates_car_occupancy_from = []
    dates_car_occupancy_to = []
    dates_car_reservation_from = []
    dates_car_reservation_to = []

    #! BIIIG LOOP
    for i in range(len(licence_plate_data)):
        #* random dates list
        dates = []
        beggining_date = datetime.date(BEGGINING_DATE_2, 1, 1)
        last_date = datetime.date(ENDING_DATE_2, 1, 1)
        number_of_dates = int(random.randint(MIN_DATES_NUMBER_2, MAX_DATES_NUMBER_2) * 2)

        for i in range(number_of_dates):
            first_date = beggining_date
            second_date = last_date
            num_days_between = (second_date - first_date).days
            rand_days = random.randint(1, num_days_between)

            random_date = first_date + datetime.timedelta(days = rand_days)
            #* Dates list update
            if i == number_of_dates - 1:
                dates.append(last_date)
                break
            dates.append(random_date)
        
        #* Sorted random dates list
        sorted_dates = sorted(dates)


        #* Date from occupancy
        occupancy_date_from_list_single_car = []
        #* Date from occupancy
        occupancy_date_to_list_single_car = []

        #* Loop for updating date from/date to
        for i in range(number_of_dates):
            if i % 2 == 0:
                occupancy_date_from_list_single_car.append(sorted_dates[i])
            else:
                occupancy_date_to_list_single_car.append(sorted_dates[i])
        
        #! APPENDING ALL OCCUPANCY DATES
        dates_car_occupancy_from.append(occupancy_date_from_list_single_car)
        dates_car_occupancy_to.append(occupancy_date_to_list_single_car)

        #* Date from reservation
        reservation_date_from_list = occupancy_date_to_list_single_car[0:-1]
        #* Date to reservation
        reservation_date_to_list = occupancy_date_from_list_single_car[1:]

        #! Appending ALL RESERVATIONS DATES
        dates_car_reservation_from.append(reservation_date_from_list)
        dates_car_reservation_to.append(reservation_date_to_list)


    return dates_car_occupancy_from, dates_car_occupancy_to, dates_car_reservation_from, dates_car_reservation_to
    

def GetOccupNumber(licence_row_number, car_occup_dates_from):
    number = 0
    for i in range(licence_row_number):
        number += len(car_occup_dates_from[i])

    return number

#! Customer bulk
def CustomerCSV(data, data_pesel):
    with open('customer.csv', 'w') as f:
        f.truncate()
        for record in data:
            f.write(record + '\n')

    with open('pesel.bulk', 'w') as f:
        f.truncate()
        for record2 in data_pesel:
            f.write(record2 + '\n')

def CustomerCSV2(data):
    with open('customer2.csv', 'w') as f:
        f.truncate()
        for record in data:
            f.write(record + '\n')

#! Renting Point bulk
def RentingPointCSV(data, data_id):
    with open('renting.csv', 'w') as f:
        f.truncate()
        for record in data:
            f.write(record + '\n')

    with open('rentingpoint.bulk', 'w') as f:
        f.truncate()
        for record2 in data_id:
            f.write(record2 + '\n')

#! Employee bulk
def EmployeeBulk(data):
    with open('employee_data.bulk', 'w') as f:
        f.truncate()
        for record in data:
            f.write(record + '\n')
        f.close()

#! Occupancy bulk                                                               
def CarOccupancyBulk(licence_row_number, car_occup_dates_from, car_occup_dates_to, licence_plates_occup_data):

    data = []
    occupancy_id = 0
    for i in range(licence_row_number):

        car_point = RentingPointGeneratePointID()
        for j in range(len(car_occup_dates_from[i])):
            occupancy_id += 1
            car_occup_df = car_occup_dates_from[i][j]
            car_occup_dt = car_occup_dates_to[i][j]
            licence_plate = licence_plates_occup_data[i]
            point_id = car_point
                                                                    
            record = f"{occupancy_id}|{car_occup_df}|{car_occup_dt}|{licence_plate}|{point_id}"
            data.append(record)

    with open('caroccupancy_data.bulk', 'w') as f:
        f.truncate()
        for record in data:
            f.write(record + '\n')
        f.close()

def CarOccupancyBulk2(licence_row_number, car_occup_dates_from, car_occup_dates_to, licence_plates_occup_data):

    data = []
    occupancy_id = 0
    for i in range(licence_row_number):

        car_point = RentingPointGeneratePointID()
        for j in range(len(car_occup_dates_from[i])):
            occupancy_id += 1
            car_occup_df = car_occup_dates_from[i][j]
            car_occup_dt = car_occup_dates_to[i][j]
            licence_plate = licence_plates_occup_data[i]
            point_id = car_point
                                                                    
            record = f"{occupancy_id}|{car_occup_df}|{car_occup_dt}|{licence_plate}|{point_id}"
            data.append(record)

    with open('caroccupancy_data2.bulk', 'w') as f:
        f.truncate()
        for record in data:
            f.write(record + '\n')
        f.close()

def Generate_status(probability):
    random_num = random.randint(0,100)
    if random_num <= probability:
        status = 1
    else:
        status = 0
    return status

#! Reservation bulk
def ReservationBulk(occup_total_number, licence_row_number,car_res_dates_from, car_res_dates_to, pesel_list, emp_id_data):
    data = []

    occupancy_ID = []
    for i in range(occup_total_number):
        occupancy_ID.append(i + 1)

    reservation_id = 0
    occupancy_id = 0
    for i in range(licence_row_number):
        for j in range(len(car_res_dates_from[i])):
            #occupancy_id = 0
            reservation_id += 1
            car_res_df = car_res_dates_from[i][j]
            car_res_dt = car_res_dates_to[i][j]
            time_of_ocup = (car_res_dates_to[i][j] - car_res_dates_from[i][j]).days
            status = Generate_status(PROBABILITY)
            pesel = random.choice(pesel_list)
            emp_ID = random.choice(emp_id_data)
            occupancy_id += 1
            
            record = f"{reservation_id}|{car_res_df}|{car_res_dt}|{time_of_ocup}|{status}|{pesel}|{emp_ID}|{occupancy_id}"
            data.append(record)
            if j == len(car_res_dates_from[i]) - 1:
                occupancy_id += 1
                break

    with open('reservation_data.bulk', 'w') as f:
        f.truncate()
        for record in data:
            f.write(record + '\n')
        f.close()

def ReservationBulk2(occup_total_number, licence_row_number,car_res_dates_from, car_res_dates_to, pesel_list, emp_id_data):
    data = []

    occupancy_ID = []
    for i in range(occup_total_number):
        occupancy_ID.append(i + 1)

    reservation_id = 0
    occupancy_id = 0
    for i in range(licence_row_number):
        for j in range(len(car_res_dates_from[i])):
            #occupancy_id = 0
            reservation_id += 1
            car_res_df = car_res_dates_from[i][j]
            car_res_dt = car_res_dates_to[i][j]
            time_of_ocup = (car_res_dates_to[i][j] - car_res_dates_from[i][j]).days
            status = Generate_status(PROBABILITY)
            pesel = random.choice(pesel_list)
            emp_ID = random.choice(emp_id_data)
            occupancy_id += 1
            
            record = f"{reservation_id}|{car_res_df}|{car_res_dt}|{time_of_ocup}|{status}|{pesel}|{emp_ID}|{occupancy_id}"
            data.append(record)
            if j == len(car_res_dates_from[i]) - 1:
                occupancy_id += 1
                break

    with open('reservation_data2.bulk', 'w') as f:
        f.truncate()
        for record in data:
            f.write(record + '\n')
        f.close()

#! Car bulk
def CarBulk(car_record_data):
    with open('car_data.bulk', 'w') as f:
        f.truncate()
        for record in car_record_data:
            f.write(record + '\n')
        f.close()



def main():
    customer_data, pesel_data, customer_data_2 = CustomerDataGenerator(CUSTOMER_NUMBER)
     
    car_record_data, car_licence_plates = CarDataGenerator(CAR_NUMBER)

    employee_data, enmployee_ID_data = EmployeeDataGenerator()

    rentingpoint_data, renting_id_data = RentingPointDataGenerator()
    
    car_occup_dates_from, car_occup_dates_to, car_res_dates_from, car_res_dates_to = DatesGenerateWithLicencePlatesLists(car_licence_plates)
    
    occup_total = GetOccupNumber(len(car_licence_plates), car_occup_dates_from)
    
    CustomerCSV(customer_data, pesel_data)

    RentingPointCSV(rentingpoint_data, renting_id_data)
    EmployeeBulk(employee_data)
    CarBulk(car_record_data)
    CarOccupancyBulk(len(car_licence_plates), car_occup_dates_from, car_occup_dates_to, car_licence_plates)
    ReservationBulk(occup_total, len(car_licence_plates), car_res_dates_from, car_res_dates_to, pesel_data, enmployee_ID_data)

    car_occup_dates_from_2, car_occup_dates_to_2, car_res_dates_from_2, car_res_dates_to_2 = DatesGenerateWithLicencePlatesLists2(car_licence_plates)

    occup_total_2 = GetOccupNumber(len(car_licence_plates), car_occup_dates_from_2)

    CarOccupancyBulk2(len(car_licence_plates), car_occup_dates_from_2, car_occup_dates_to_2, car_licence_plates)
    ReservationBulk2(occup_total_2, len(car_licence_plates), car_res_dates_from_2, car_res_dates_to_2, pesel_data, enmployee_ID_data)
    
    CustomerCSV2(customer_data_2)
    
if __name__ == "__main__":
    main()
