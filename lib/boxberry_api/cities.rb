# encoding: utf-8
module BoxberryApi

  class Cities

    # Соответсвие нашего кода города с
    # - код Боксберри
    # - зона (тарифный пояс)
    # - сортировочный пункт
    CODES = {

      # Абакан
      '19-0-1-0' => {

        code:     '191',
        zone:     2,
        sc:       '010',

        city:     5,
        address:  "Абакан, ул. Ленинского Комсомола, д. 35. Второй офис слева. №76",
        delivery: 19, # 11
        phone:    "+7 (3902) 24-45-54, 35-72-19",
        work:     "пн.–пт. с 8:00 до 20:00, сб. с 10:00 до 16:00"

      },

      # Альметьевск
      '16-8-1-0' => {

        code:     '222',
        zone:     1,
        sc:       '010',

        city:     92,
        address:  "г. Альметьевск, ул. Нефтяников, д. 15",
        delivery: 13, # 5
        phone:    "+7 (8553) 30-63-39, 36 92 35",
        work:     "пн.-пт. с 8.00 по 18.00"

      },

      # Архангельск
      '29-0-1-0' => {

        code:     '204',
        zone:     1,
        sc:       '010',

        city:     6,
        address:  "г. Архангельск, ул. Левачёва д. 12",
        delivery: 15, # 7
        phone:    "+7 (8182) 233-090",
        work:     "пн.-пт. с 10:00 до 17:00"

      },

      # Асбест
      '66-0-2-0' => {

        code:     '1004',
        zone:     1,
        sc:       '1002',

        city:     136,
        address:  "г. Асбест, ул. Войкова, д. 64",
        delivery: 5, # 6
        phone:    "+7 (34365) 7-47-94",
        work:     ""

      },

      # Астрахань
      '30-0-1-0' => {

        code:     '201',
        zone:     1,
        sc:       '010',

        city:     7,
        address:  "г. Астрахань, ул. Николая Островского, д.148 у, офис 119, 1 этаж",
        delivery: 15, # 7
        phone:    "+7 (8512) 64-06-02, 64-06-01, 61-18-63",
        work:     "пн.-пт. с 08:00 до 17:00"

      },

      # Барнаул
      '22-0-1-0' => {

        code:     '82',
        zone:     2,
        sc:       '010',

        city:     96,
        address:  "г. Барнаул, ул. Короленко, д. 48",
        delivery: 17, # 9
        phone:    "+7 (3852) 57-33-94, 28-25-94, +7-929-397-33-94",
        work:     "пн.–пт. с 8:00 до 20:00, сб. с 10:00 до 16:00"

      },

      # Белгород
      '31-0-1-0' => {

        code:     '72',
        zone:     1,
        sc:       '010',

        city:     8,
        address:  "г. Белгород, пер. Харьковский, д. 36 Г",
        delivery: 14, # 6
        phone:    "+7 (4722) 24-90-01, 24-90-02, 24-90-03",
        work:     "пн-пт с 8:00 до 18:00, сб. с 10:00 до 13:00"

      },

      # Березники, пермский край (город)
      '59-0-2-0' => {

        code:     '31',
        zone:     1,
        sc:       '010',

        city:     9,
        address:  "г. Березники, пр-т Советский, д. 3",
        delivery: 17, # 9
        phone:    "+7 (342) 426-72-01",
        work:     "пн.-пт. с 08:00 до 18:00"

      },

      # Благовещенск, амурская область
      '28-0-1-0' => {

        code:     '182',
        zone:     4,
        sc:       '010',

        city:     10,
        address:  "г. Благовещенск, ул. Амурская, д. 180 офис 2",
        delivery: 25, # 17
        phone:    "+7 (4162) 53-11-54, 52-53-30",
        work:     "пн-пт с 8:30 до 17:30"

      },

      # Братск, иркутская область
      '38-0-5-0' => {

        code:     '143',
        zone:     3,
        sc:       '010',

        city:     11,
        address:  "г. Братск, Индустриальный проезд, дом № 5А/6, офис 204",
        delivery: 23, # 15
        phone:    "+7 (3953) 45-09-45",
        work:     "пн.-пт. с 09:00 до 18:00, обед с 13:00 до 14:00"

      },

      # Брянск
      '32-0-1-0' => {

        code:     '212',
        zone:     1,
        sc:       '010',

        city:     110,
        address:  "г. Брянск, ул. Фрунзе, д. 64",
        delivery: 11, # 3
        phone:    "+7 (4832) 41-63-56, 41-63–05",
        work:     "пн.-пт. с 09:00 до 18:00"

      },

      # Великий Новгород
      '53-0-1-0' => {

        code:     '113',
        zone:     1,
        sc:       '010',

        city:     12,
        address:  "г. Великий Новгород, ул. Кооперативная д. 7",
        delivery: 10, # 3
        phone:    "+7 (8162) 77-52-23",
        work:     "пн.–пт. 9:00-19:00, сб. 10:00-14:00"

      },

      # Владивосток
      '25-0-1-0' => {

        code:     '90',
        zone:     4,
        sc:       '010',

        city:     134,
        address:  "г. Владивосток, ул. Пологая, д. 50",
        delivery: 32, # 24
        phone:    "+7 (423) 243-41-93, 243-41-92",
        work:     "пн-пт. с 09:00 до 20:00"

      },

      # Владимир
      '33-0-1-0' => {

        code:     '151',
        zone:     1,
        sc:       '010',

        city:     13,
        address:  "г. Владимир, пр. Ленина, д. 68",
        delivery: 12, # 4
        phone:    "+7 (4922) 38-30-98, 54-47-08",
        work:     "пн.-пт. с 07:30 до 18:00"

      },

      # Волгоград
      '34-0-1-0' => {

        code:     '240',
        zone:     1,
        sc:       '010',

        city:     14,
        address:  "г. Волгоград, ул. Островского, д. 5",
        delivery: 13, # 5
        phone:    "+7 (8442) 33-17-31, 33-17-34, 33-30-94",
        work:     "пн.–пт. с 8:30 до 20:00, сб. с 10:00 до 16:00"

      },

      # Волгодонск
      '61-0-4-0' => {

        code:     '52',
        zone:     1,
        sc:       '010',

        city:     131,
        address:  "г. Волгодонск, ул. Энтузиастов, дом 3, офис 313",
        delivery: 17, # 9
        phone:    "+7 (8639) 24-09-79",
        work:     "пн.-пт. с 09:00 до 18:00"

      },

      # Воркута
      '11-0-2-0' => {

        code:     '162',
        zone:     1,
        sc:       '010',

        city:     135,
        address:  "г. Воркута, ул. Ленина, д. 14, кв. 1",
        delivery: 15, # 7
        phone:    "+7 (82151) 83-54-77, +7 912-170-38-47",
        work:     "пн-пт. с 9:00 до 18:00"

      },

      # Воронеж
      '36-0-1-0' => {

        code:     '70',
        zone:     1,
        sc:       '010',

        city:     15,
        address:  "г. Воронеж, ул. 45 Стрелковой Дивизии, д. 106",
        delivery: 12, # 4
        phone:    "+7 (4732) 46-13-02, 46-13-51",
        work:     "пн-пт с 8:00 до 20:00, сб с 9:00 до 13:00"

      },

      # Глазов
      '18-0-4-0' => {

        code:     '35',
        zone:     1,
        sc:       '010',

        city:     141,
        address:  "г. Глазов, ул. Первомайская, д. 41а, каб. 6",
        delivery: 16, # 8
        phone:    "+7 (34141) 3-41-40",
        work:     "пн.-пт. с 9:00 до 18:00"

      },

      # Екатеринбург
      '66-0-1-0' => {

        code:     '1002.012',
        zone:     1,
        sc:       '1002',

        city:     16,
        address:  "г. Екатеринбург, ул. 8 марта, д. 13, цоколь",
        delivery: 3, # 5
        phone:    "+7 (343) 298-06-45",
        work:     "пн.-пт. с 10:00 до 20:00, сб.-вс. с 10:00 до 18:00"

      },

      # Иваново
      '37-0-1-0' => {

        code:     '111',
        zone:     1,
        sc:       '010',

        city:     17,
        address:  "г. Иваново ул. Красных зорь, д. 16 офис 11 (1 подъезд, 1 этаж)",
        delivery: 11, # 3
        phone:    "+7 (4932) 35-59-36, 32-52-54, 35-59-37",
        work:     "пн.-пт. с 7:30 до 19:00, сб. с 10:00 до 15:00"

      },

      # Ижевск, удмуртская республика
      '18-0-1-0' => {

        code:     '32',
        zone:     1,
        sc:       '010',

        city:     18,
        address:  "г. Ижевск, ул. Карла Маркса, д. 1А",
        delivery: 14, # 6
        phone:    "+7 (3412) 77-07-87",
        work:     "пн.-пт. с 10:00 до 19:00"

      },

      # Иркутск
      '38-0-3-0' => {

        code:     '14',
        zone:     3,
        sc:       '010',

        city:     19,
        address:  "г. Иркутск, ул. Некрасова, д. 15, корпус 2, офис 4",
        delivery: 20, # 12
        phone:    "+7 (3952) 200-517",
        work:     "пн.-пт. с 08:00 до 19:00, сб. с 12:00 до 16:00"

      },

      # Йошкар-Ола
      '12-0-1-0' => {

        code:     '152',
        zone:     1,
        sc:       '010',

        city:     20,
        address:  "г. Йошкар-Ола, ул. 70-летия Вооруженных Сил СССР, д. 20, 1 этаж",
        delivery: 15, # 7
        phone:    "+7 (8362) 56-56-47, 56-56-82",
        work:     "пн.-пт. с 07:30 до 18:00"

      },

      # Казань
      '16-0-1-0' => {

        code:     '220',
        zone:     1,
        sc:       '010',

        city:     90,
        address:  "г. Казань, ул. М.Салимжанова 10/73",
        delivery: 12, # 4
        phone:    "+7 (843) 278-02-54, 277-95-57, 278-05-85",
        work:     "пн.–пт. с 8:00 до 20:00 сб. с 10:00 до 15:00"

      },

      # Калуга
      '40-0-1-0' => {

        code:     '19',
        zone:     1,
        sc:       '010',

        city:     21,
        address:  "г. Калуга, пер. Старообрядческий, д. 9",
        delivery: 11, # 3
        phone:    "+7 (4842) 273-100, 273-111, 273-222, 7-930-840-04-88",
        work:     "пн.–пт. с 9:00 до 19:00, сб. с 10:00 до 14:00"

      },

      # Каменск-Уральский
      '66-0-22-0' => {

        code:     '101',
        zone:     1,
        sc:       '1002',

        city:     22,
        address:  "г. Каменск-Уральский, ул. Синарская, д. 3",
        delivery: 4, # 6
        phone:    "+7 (3439) 325-025, 325-010, 323-070",
        work:     "пн.-пт. с 9:00 до 19:00, сб. с 10:00 до 14:00"

      },

      # Кемерово
      '42-0-9-0' => {

        code:     '80',
        zone:     2,
        sc:       '010',

        city:     23,
        address:  "г. Кемерово, пр. Ленина, д. 51б",
        delivery: 18, # 10
        phone:    "+7 (3842) 63-03-70",
        work:     "пн.–пт. с 8:00 до 20:00, сб. с 9:00 до 15:00"

      },

      # Киров, кировская область
      '43-0-1-0' => {

        code:     '207',
        zone:     1,
        sc:       '010',

        city:     24,
        address:  "г. Киров, ул. Ленина, д. 152",
        delivery: 14, # 6
        phone:    "+7 (8332) 35-27-80, 35-27-87",
        work:     "пн.–пт. с 9:00 до 19:00, сб. с 10:00 до 14:00"

      },

      # Комсомольск-на-Амуре
      '27-0-5-0' => {

        code:     '181',
        zone:     4,
        sc:       '010',

        city:     91,
        address:  "г. Комсомольск-на-Амуре, пр. Интернациональный 29/3",
        delivery: 29, # 21
        phone:    "+7 (4217) 53-61-33, 53-30-40",
        work:     "пн.-пт. с 09:00 до 18:00"

      },

      # Кострома
      '44-1-1-0' => {

        code:     '109',
        zone:     1,
        sc:       '010',

        city:     133,
        address:  "г. Кострома, пр. Ленина, дом 18, офис 4",
        delivery: 14, # 6
        phone:    "+7 (4942) 47-02-35",
        work:     "пн-пт с 9.00 до 18.00"

      },

      # Краснодар
      '23-0-1-0' => {

        code:     '40',
        zone:     1,
        sc:       '010',

        city:     25,
        address:  "г. Краснодар, ул. 40 лет Победы д. 37/1",
        delivery: 14, # 6
        phone:    "+7 (861) 275-99-00, 275-93-99, 274-08-88",
        work:     "пн.-пт. с 09:00 до 19:00, сб. с 10:00 до 14:00"

      },

      # Красноярск
      '24-0-1-0' => {

        code:     '190',
        zone:     2,
        sc:       '010',

        city:     26,
        address:  "г. Красноярск, ул. 78-Добровольческой бригады, д.7, пом. №69",
        delivery: 19, # 11
        phone:    "+7 (391) 281-281-8, 218-18-10, 218-18-20, 218-18-30",
        work:     "пн.–пт. с 8:00 до 20:00, сб. с 10:00 до 14:00"

      },

      # Курган
      '45-0-1-0' => {

        code:     '4',
        zone:     1,
        sc:       '1002',

        city:     27,
        address:  "г. Курган, ул. Карельцева, д. 13",
        delivery: 15, # 7
        phone:    "+7 (3522) 41-24-12, 41-13-85",
        work:     "пн.-пт. с 07:00 до 19:00, сб. с 10:00 до 15:00"

      },

      # Курск
      '46-0-1-0' => {

        code:     '73',
        zone:     1,
        sc:       '010',

        city:     28,
        address:  "г. Курск, ул. Сумская д. 36, офис 17, 2 этаж",
        delivery: 12, # 4
        phone:    "+7 (4712) 74-00-36",
        work:     "пн-пт с 9:00 до 19:00, сб с 10:00 до 13:00"

      },

      # Лесной, свердловская область
      '66-0-13-0' => {

        code:     '105',
        zone:     1,
        sc:       '1002',

        city:     103,
        address:  "Свердловская обл., г. Лесной, ул. Ленина, д. 49а, офис 109",
        delivery: 18, # 10
        phone:    "+7 (34342) 6-17-64",
        work:     "пн-пт. с 09:00 до 18:00"

      },

      # Липецк
      '48-0-1-0' => {

        code:     '71',
        zone:     1,
        sc:       '010',

        city:     29,
        address:  "г. Липецк, ул. Циолковского, д. 32/3, офис 1",
        delivery: 12, # 4
        phone:    "+7 (4742) 34-13-42, 34-20-48, 34-02-71",
        work:     "пн.-пт. с 08:00 до 19:00, сб. с 10:00 до 15:00"

      },

      # Магнитогорск
      '74-0-9-0' => {

        code:     '21',
        zone:     1,
        sc:       '1002',

        city:     30,
        address:  "г. Магнитогорск, ул. Енисейская, дом 133/1",
        delivery: 7, # 8
        phone:    "+7 (3519) 21-10-88, 21-08-21, 21-04-57, 21-55-13",
        work:     "пн.-чт. с 09:00 до 19:00, пт. с 09:00 до 17:00, сб. с 10:00 до 15:00"

      },

      # Миасс
      '74-0-10-0' => {

        code:     '22',
        zone:     1,
        sc:       '1002',

        city:     31,
        address:  "г. Миасс, ул. Вернадского, д. 5, офис 4",
        delivery: 7, # 8
        phone:    "+7 (3513) 53-48-46, 53-10-11, 53-33-66",
        work:     "пн.–пт. с 9:00 до 19:00, сб. с 9:00 до 15:00"

      },

      # Москва
      '77-0-0-0' => {

        code:     '010',
        zone:     0,
        sc:       '1002',

        city:     68,
        address:  "г. Москва, ул. Новодмитровская д. 5А, стр 4",
        delivery: 8, # 2
        phone:    "+7 (495) 961-23-62 доб. 3209, 3003",
        work:     "пн.-сб. с 10:00 до 19:00"

      },

      # Мурманск
      '51-0-1-0' => {

        code:     '202',
        zone:     1,
        sc:       '010',

        city:     69,
        address:  "г. Мурманск, ул. Пушкинская, д. 5, оф. 25",
        delivery: 15, # 7
        phone:    "+7 (815-2) 45-03-37, 45-07-17, 45-03-77",
        work:     "пн.–пт. с 9:00 до 19:00, сб. с 10:00 до 14:00"

      },

      # Набережные Челны
      '16-0-2-0' => {

        code:     '221',
        zone:     1,
        sc:       '010',

        city:     105,
        address:  "г. Набережные Челны, пр. Чулман, д. 37, 4, 114",
        delivery: 14, # 6
        phone:    "+7 (8552) 53-10-63, 53-10-65",
        work:     "пн.-пт. с 08:00 до 17:00"

      },

      # Нижневартовск
      '86-0-11-0' => {

        code:     '9',
        zone:     2,
        sc:       '1002',

        city:     32,
        address:  "г. Нижневартовск, ул. Северная, д. 54а, стр. 1",
        delivery: 7, # 12
        phone:    "+7 (3466) 49-13-15, 49-14-50",
        work:     "пн.-сб. с 09:00 до 18:00"

      },

      # Нижний Новгород
      '52-0-1-0' => {

        code:     '150',
        zone:     1,
        sc:       '010',

        city:     33,
        address:  "г. Нижний Новгород, ул. Невзоровых, д. 89, офис 15",
        delivery: 13, # 5
        phone:    "+7 (8312) 78-52-47, 78-52-48",
        work:     "пн. с 09:00 до 17:00, вт.-пт. с 10:00 до 19:00, сб. с 10:00 до 14:00"

      },

      # Нижний Тагил
      '66-0-23-0' => {

        code:     '3',
        zone:     1,
        sc:       '1002',

        city:     34,
        address:  "г. Нижний Тагил, ул. Циолковского, д. 17",
        delivery: 4, # 6
        phone:    "+7 (3435) 41-77-09, 25-49-89, факс (3435) 25-49-89",
        work:     "пн.-пт. с 08:00 до 19:00, сб. с 10:00 до 15:00"

      },

      # Нефтекамск
      '2-0-3-0' => {

        code:     '234',
        zone:     1,
        sc:       '010',

        city:     138,
        address:  "г. Нефтекамск, ул. Высоковольтная 1б",
        delivery: 15, # 7
        phone:    "+7 (34783) 3-23-55",
        work:     "пн-пт с 09:00 до 18:00, обед с 13:00 до 14:00"

      },

      # Новокузнецк
      '42-0-12-0' => {

        code:     '81',
        zone:     2,
        sc:       '010',

        city:     66,
        address:  "г. Новокузнецк, ул. Тольятти, 70а",
        delivery: 18, # 10
        phone:    "+7 (3843) 760-746, +7-913-322-92-32",
        work:     "пн.–пт. с 8:00 до 20:00, сб. с 9:00 до 15:00"

      },

      # Новороссийск
      '23-0-6-0' => {

        code:     '41',
        zone:     1,
        sc:       '010',

        city:     35,
        address:  "г. Новороссийск, ул. Чайковского, д. 10",
        delivery: 15, # 7
        phone:    "+7 (900) 269-35-76, +7 (8617) 30-09-16",
        work:     "пн.-пт. с 08:00 до 19:00, сб. с 10:00 до 15:00"

      },

      # Новосибирск
      '54-0-1-0' => {

        code:     '170',
        zone:     2,
        sc:       '010',

        city:     37,
        address:  "г. Новосибирск, ул. Кирова, д. 108/1",
        delivery: 16, # 8
        phone:    "+7 (383) 266-06-44, 266-06-90, 266-06-04",
        work:     "пн-пт с 8:00 до 19:30, сб с 10:00 до 14:00"

      },

      # Новоуральск
      '66-0-15-0' => {

        code:     '108',
        zone:     1,
        sc:       '1002',

        city:     106,
        address:  "г. Новоуральск, ул. Горького, д. 6",
        delivery: 5, # 6
        phone:    "+7 (34370) 4-46-72",
        work:     "пн.-пт. с 9:00 до 18:00"

      },

      # Озерск, челябинская область
      '74-0-11-0' => {

        code:     '25',
        zone:     1,
        sc:       '1002',

        city:     110,
        address:  "г. Озерск, ул. Октябрьская, д. 7а, офис 203",
        delivery: 3, # 7
        phone:    "+7 (35130) 725-68",
        work:     "пн.-пт. с 9:00 по 19:00"

      },

      # Омск
      '55-0-1-0' => {

        code:     '60',
        zone:     2,
        sc:       '010',

        city:     38,
        address:  "г. Омск, ул. Кучерявенко д. 5",
        delivery: 15, # 7
        phone:    "+7 (3812) 28-67-39, 919-616",
        work:     "пн.-пт. с 9:00 до 18:00"

      },

      # Орел
      '57-0-1-0' => {

        code:     '211',
        zone:     1,
        sc:       '010',

        city:     39,
        address:  "г. Орел, ул. 1-я Посадская, д. 33",
        delivery: 12, # 4
        phone:    "+7 (4862) 73-54-06, 49-03-11",
        work:     "пн.-пт. с 9:00 до 19:00, сб. с 10:00 до 14:00"

      },

      # Оренбург
      '56-0-1-0' => {

        code:     '231',
        zone:     1,
        sc:       '010',

        city:     40,
        address:  "г.Оренбург, ул. Терешковой, д. 140",
        delivery: 15, # 7
        phone:    "+7 (3532) 53-40-70",
        work:     "пн.–пт. с 9:00 до 20:00, сб. с 10:00 до 14:00"

      },

      # Пенза
      '58-0-1-0' => {

        code:     '213',
        zone:     1,
        sc:       '010',

        city:     112,
        address:  "г. Пенза, ул. Суворова д. 71",
        delivery: 13, # 5
        phone:    "+7 (8412) 52-45-30; 52-45-04",
        work:     "пн.–пт. с 9:00 по 19:00"

      },

      # Салават
      '2-0-5-0' => {

        code:     '232',
        zone:     1,
        sc:       '010',

        city:     115,
        address:  "г. Салават, ул. Первомайская, д. 41/3",
        delivery: 15, # 7
        phone:    "+7 (3476) 32-85-04",
        work:     "пн.-пт. с 07:00 по 18:00"

      },

      # Первоуральск
      '66-0-16-0' => {

        code:     '1005',
        zone:     1,
        sc:       '1002',

        city:     142,
        address:  "г. Первоуральск, ул. Ватутина, д. 33",
        delivery: 5, # 6
        phone:    "+7 (3439) 64-95-00",
        work:     nil

      },

      # Пермь
      '59-0-1-0' => {

        code:     '30',
        zone:     1,
        sc:       '1002',

        city:     41,
        address:  "г. Пермь, ул. Дружбы, д. 34, офис 301",
        delivery: 14, # 6
        phone:    "+7 (342) 220-01-63, 220-01-91",
        work:     "пн-пт с 09:00 до 20:00"

      },

      # Петрозаводск
      '10-0-1-0' => {

        code:     '203',
        zone:     1,
        sc:       '010',

        city:     42,
        address:  "г. Петрозаводск, ул. М.Мерецкова, д. 16, оф. 12/13",
        delivery: 16, # 8
        phone:    "+7 (8142) 59-30-02, 59-30-53",
        work:     "пн.–пт. с 9:00 до 19:00, сб. с 10:00 до 14:00"

      },

      # Псков
      '60-0-1-0' => {

        code:     '1011',
        zone:     1,
        sc:       '010',

        city:     139,
        address:  "г. Псков, ул. Западная, д. 18",
        delivery: 15, # 7
        phone:    "+7 (951) 751-21-21",
        work:     "пн-пт. с 10:00 до 19:00, сб. с 10:00 до 14:00"

      },

      # Пятигорск
      '26-0-7-0' => {

        code:     '120',
        zone:     1,
        sc:       '010',

        city:     43,
        address:  "г. Пятигорск, ул. Адмиральского, д. 6а",
        delivery: 15, # 7
        phone:    "+7 (8793) 39-67-47, 39-67-58, 39-67-66",
        work:     "пн.-пт. с 10:00 до 19:00, сб. с 10:00 до 15:00"

      },

      # Реутов, московская область
      '50-0-16-0' => {

        code:     '1008',
        zone:     1,
        sc:       '010',

        city:     143,
        address:  "г. Реутов, ул. Ашхабадская, д. 19б",
        delivery: 11, # 3
        phone:    "+7 (495) 979-86-27; 972-75-60; 961-23-62/ доб. 3212",
        work:     "пн.-пт. с 09:00 до 18:00"

      },

      # Ростов-на-Дону
      '61-0-1-0' => {

        code:     '50',
        zone:     1,
        sc:       '010',

        city:     44,
        address:  "г. Ростов-на-Дону, ул. Суворова, д. 10",
        delivery: 13, # 5
        phone:    "+7 (863) 240-92-15, 269-84-00, 269-44-33",
        work:     "пн-пт с 8:00 до 20:00, сб с 10:00 до 15:00"

      },

      # Рязань
      '62-0-1-0' => {

        code:     '18',
        zone:     1,
        sc:       '010',

        city:     45,
        address:  "г. Рязань, ул. Радищева, д. 59",
        delivery: 11, # 3
        phone:    "+7 (4912) 95-78-62, 95-38-02, 95-38-01",
        work:     "пн.-пт. с 08:00 до 20:00 сб. с 09:00 до 15:00"

      },

      # Самара
      '63-0-1-0' => {

        code:     '200',
        zone:     1,
        sc:       '010',

        city:     46,
        address:  "г. Самара, ул. Ленинская, д. 141, 1 этаж",
        delivery: 13, # 5
        phone:    "+7 (846) 276-03-23, 276-03-24, 276-23-77, 276-23-78, 373-16-42, 265-33-76",
        work:     "пн.-чт с 10:00 до 20:00, пт. с 10:00 до 19:00, сб. с 10:00 до 15:00"

      },

      # Санкт-Петербург
      '78-0-0-0' => {

        code:     '250',
        zone:     1,
        sc:       '010',

        city:     116,
        address:  "г. Санкт-Петербург, пр-т Юрия Гагарина, д. 2, литер А",
        delivery: 11, # 3
        phone:    "+7 (812) 378-66-44",
        work:     "пн-пт. с 9:00 по 18:00"

      },

      # Саратов
      '64-0-1-0' => {

        code:     '210',
        zone:     1,
        sc:       '010',

        city:     47,
        address:  "г. Саратов, ул. Университетская, д. 65/73",
        delivery: 12, # 4
        phone:    "+7 (8452) 52-12-10, 52-12-17, доб. 114",
        work:     "пн.–пт. с 8:00 до 20:00, сб. с 9:00 до 15:00"

      },

      # Саранск
      '13-0-1-0' => {

        code:     '215',
        zone:     1,
        sc:       '010',

        city:     117,
        address:  "г. Саранск, ул. Б.Хмельницкого, д. 14, оф. 104",
        delivery: 18, # 10
        phone:    "+7 (8342) 22-23-09",
        work:     nil

      },

      # Серов
      '66-0-34-0' => {

        code:     '6',
        zone:     1,
        sc:       '1002',

        city:     48,
        address:  "г. Серов, ул.Парковая, д. 11, офис 13",
        delivery: 8, # 8
        phone:    "+7 (34385) 6-09-05, 6-15-88",
        work:     "пн.-чт. с 9:00 до 19:00, пт. с 9:00 до 18:00, сб. с 10:00 до 13:00"

      },

      # Смоленск
      '67-0-3-0' => {

        code:     '205',
        zone:     1,
        sc:       '010',

        city:     49,
        address:  "г.Смоленск, ул. Нормандия-Неман, д. 33",
        delivery: 12, # 4
        phone:    "+7 (4812) 62-41-05, 66-09-71, 64-09-53, 65-76-99",
        work:     "пн.-пт.с 09:00 до 19:00, сб. с 10:00 до 14:00"

      },

      # Снежинск, челябинская область
      '74-0-13-0' => {

        code:     '24',
        zone:     1,
        sc:       '1002',

        city:     118,
        address:  "г. Снежинск, ул. Васильева, д. 28, офис 2",
        delivery: 3, # 7
        phone:    "+7 (35146) 2-15-64",
        work:     "пн.-пт. с 10:00 по 19:00, сб. с 10:00 по 15:00"

      },

      # Советский, Ханты-Мансийский АО
      '86-8-1-0' => {

        code:     '106',
        zone:     2,
        sc:       '1002',

        city:     119,
        address:  "г. Советский, ул. Калинина, д. 35а",
        delivery: 8, # 10
        phone:    "+7 (34675) 3-32-60",
        work:     "пн.-пт. с 9:00 по 18:00"

      },

      # Ставрополь
      '26-0-1-0' => {

        code:     '121',
        zone:     1,
        sc:       '010',

        city:     50,
        address:  "г. Ставрополь, ул. Шпаковская, 76а/2",
        delivery: 15, # 7
        phone:    "+7 (8652) 55-44-15, 55-44-16",
        work:     "пн.–пт. с 9:00 до 19:00, сб. с 10:00 до 15:00"

      },

      # Сургут
      '86-0-10-0' => {

        code:     '8',
        zone:     2,
        sc:       '1002',

        city:     51,
        address:  "г.Сургут, пр-т Ленина, д. 18/1, 1 этаж",
        delivery: 7, # 9
        phone:    "+7 (3462) 50-38-40, 50-38-41",
        work:     "пн.-пт. с 09:00 до 17:00, сб. с 10:00 до 18:00"

      },

      # Сыктывкар
      '11-0-1-0' => {

        code:     '12',
        zone:     1,
        sc:       '010',

        city:     52,
        address:  "г. Сыктывкар, Покровский бульвар, д. 5. 1 этаж",
        delivery: 16, # 8
        phone:    "+7 (8212) 25-00-44",
        work:     "пн.–пт. с 9:00 до 19:00, сб. с 10:00 до 14:00"

      },

      # Таганрог
      '61-0-11-0' => {

        code:     '51',
        zone:     1,
        sc:       '010',

        city:     53,
        address:  "г. Таганрог, ул. Социалистическая д. 138",
        delivery: 15, # 7
        phone:    "+7 (8634) 62-40-47, 62-45-47",
        work:     "пн.–пт. с 9:00 до 18:30, сб. с 10:00 до 14:00"

      },

      # Тамбов
      '68-0-4-0' => {

        code:     '74',
        zone:     1,
        sc:       '010',

        city:     54,
        address:  "г. Тамбов, Моршанское шоссе, д. 6б",
        delivery: 13, # 5
        phone:    "+7 (4752) 48-22-69, 47-59-28, 47-59-33",
        work:     "пн.–пт. с 8:00 до 19:00, сб. с 10:00 до 15:00"

      },

      # Тверь
      '69-0-1-0' => {

        code:     '112',
        zone:     1,
        sc:       '010',

        city:     55,
        address:  "г. Тверь, ул. Лидии Базановой, д. 20, офис 20",
        delivery: 10, # 3
        phone:    "+7 (4822) 76-78-30, 76-58-91, 76-78-11",
        work:     "пн.–пт. с 8:00 до 19:00, сб. с 10:00 до 14:00"

      },

      # Тольятти
      '63-0-7-0' => {

        code:     '214',
        zone:     1,
        sc:       '010',

        city:     56,
        address:  "г. Тольятти, ул. Индустриальная, стр. 2 (ОЦ «Эфель»), 1 этаж, офис 117",
        delivery: 13, # 5
        phone:    "+7 (8482) 28-86-92",
        work:     "вт.–пт. с 10:00 до 20:00, сб. с 10:00 до 15:00"

      },

      # Томск
      '70-0-1-0' => {

        code:     '5',
        zone:     2,
        sc:       '010',

        city:     57,
        address:  "г. Томск, ул. Советская, д. 33",
        delivery: 19, # 11
        phone:    "+7 (3822) 53-19-36, 53-35-87",
        work:     "пн.–пт. с 8:00 до 20:00, сб. с 10:00 до 15:00"

      },

      # Тула
      '71-0-1-0' => {

        code:     '116',
        zone:     1,
        sc:       '010',

        city:     122,
        address:  "г. Тула, ул. Демидовская, д. 179, 179а, лит Б4, 1 этаж",
        delivery: 11, # 3
        phone:    "+7 (4872) 70-04-16, 70-04-17",
        work:     "пн.-пт. с 08:00 до 20:00 сб. с 09:00 до 15:00"

      },

      # Тюмень
      '72-0-1-0' => {

        code:     '160',
        zone:     1,
        sc:       '1002',

        city:     67,
        address:  "г. Тюмень, ул.Комсомольская, д. 58, 1 этаж",
        delivery: 6, # 8
        phone:    "+7 (3452) 631-461, 631-334",
        work:     "пн.-пт. с 09:00 до 20:00, сб. с 10:00 до 15:00"

      },

      # Улан-Удэ
      '3-0-1-0' => {

        code:     '141',
        zone:     3,
        sc:       '010',

        city:     59,
        address:  "г. Улан-Удэ, ул. Павлова, д. 23, 1 этаж",
        delivery: 19, # 11
        phone:    "+7 (3012) 23-22-88, 23-36-05",
        work:     "пн.-пт.с 09:00 до 19:00, сб: с 10:00 до 14:00"

      },

      # Ульяновск
      '73-0-1-0' => {

        code:     '209',
        zone:     1,
        sc:       '010',

        city:     124,
        address:  "г. Ульяновск, ул. Робеспьера, д. 114, офис 4",
        delivery: 15, # 7
        phone:    "+7 (8422) 44-94-24, 44-94-34",
        work:     "пн.–чт. с 8:00 до 19:00, пт. с 8:00 по 18:00, сб. с 10:00 по 15:00"

      },

      # Уфа
      '2-1-1-0' => {

        code:     '230',
        zone:     1,
        sc:       '1002',

        city:     60,
        address:  "г. Уфа, ул. Владивостокская, 7/1",
        delivery: 14, # 6
        phone:    "+7 (347) 241-61-33, 241-88-10",
        work:     "пн.–пт. с 9:00 до 20:00, сб. с 9:00 до 14:00"

      },

      # Ухта
      '11-0-8-0' => {

        code:     '115',
        zone:     1,
        sc:       '010',

        city:     126,
        address:  "г. Ухта, ул. Тиманская д. 11 офис 9",
        delivery: 14, # 6
        phone:    "+7 (8216) 73-84-33, 73-84-48",
        work:     "пн.-пт. с 09:00 до 17:00"

      },

      # Хабаровск
      '27-0-1-0' => {

        code:     '180',
        zone:     4,
        sc:       '010',

        city:     61,
        address:  "г. Хабаровск, ул. Серышева, д. 88",
        delivery: 26, # 18
        phone:    "+7 (4212) 75-34-66",
        work:     "пн.–пт. с 7:00 до 20:00, сб. с 10:00 до 15:00"

      },

      # Ханты-Мансийск
      '86-0-1-0' => {

        code:     '104',
        zone:     2,
        sc:       '1002',

        city:     127,
        address:  "г. Ханты-Мансийск, ул. Шевченко, 57, офис 8",
        delivery: 7, # 7
        phone:    "+7 (3467) 32-77-94",
        work:     "пн-пт с 9:00 до 19:00, сб. с 10:00 до 14:00"

      },

      # Химки
      '50-0-30-0' => {

        code:     '1006',
        zone:     1,
        sc:       '010',

        city:     144,
        address:  "г. Химки, ул. Панфилова, д. 1",
        delivery: 11, # 3
        phone:    "+7 (495) 961-23-62 доб. 3209 и 3003",
        work:     "пн-пт с 10:00 до 19:00, сб с 10:00 до 15:00"

      },

      # Чебоксары
      '21-0-1-0' => {

        code:     '153',
        zone:     1,
        sc:       '010',

        city:     62,
        address:  "г. Чебоксары, пр-т Мира, 9, оф. 236",
        delivery: 15, # 7
        phone:    "+7 (8352) 28-91-50, 28-91-58",
        work:     "пн.-пт. с 08:30 до 18:00"

      },

      # Череповец
      '32-0-2-0' => {

        code:     '15',
        zone:     1,
        sc:       '010',

        city:     128,
        address:  "г. Череповец, ул. Дзержинского, д. 20, оф. 14",
        delivery: 12, # 4
        phone:    "+7 (8202) 51-91-51, 51-71-92, 51-86-27",
        work:     "пн.-пт. с 9:00 до 17:00"

      },

      # Чита
      '75-0-1-0' => {

        code:     '142',
        zone:     3,
        sc:       '010',

        city:     65,
        address:  "г. Чита, ул. Забайкальского рабочего, д. 45 офис 5",
        delivery: 20, # 12
        phone:    "+7 (3022) 230-966; 555-910; 8-914-808-59-10",
        work:     "пн.-пт. с 09:00 до 19:00, сб. с 10:00 до 15:00"

      },

      # Шадринск, курганская область
      '45-0-2-0' => {

        code:     '26',
        zone:     1,
        sc:       '1002',

        city:     140,
        address:  "г. Шадринск, ул. Комсомольская д. 16, корпус 2, офис 47",
        delivery: 18, # 10
        phone:    "8 (35253) 6-87-26",
        work:     "пн.-пт. с 9:00 до 18:00, обед с 12:00 до 13:00"

      },

      # Ярославль
      '76-0-1-0' => {

        code:     '11',
        zone:     1,
        sc:       '010',

        city:     64,
        address:  "г. Ярославль , пр-т Ленина, д. 23, офис 17",
        delivery: 11, # 3
        phone:    "+7 (4852) 92-66-42",
        work:     "пн.-пт. с 09:00 до 19:00, сб. с 10:00 до 14:00"

      },

      # Южно-Сахалинск
      '65-0-1-0' => {

        code:     '183',
        zone:     4,
        sc:       '010',

        city:     129,
        address:  "г. Южно-Сахалинск, ул. Чехова, д. 66, офис 31",
        delivery: 48, # 40
        phone:    "+7 (4212) 75-34-66, 75-34-72, 75-34-73, 75-34-74",
        work:     "пн.-пт. с 09:00 до 19:00"

      },

      # Элиста
      '8-0-1-0' => {

        code:     '241',
        zone:     1,
        sc:       '010',

        city:     130,
        address:  "г. Элиста ул. Республиканская д. 8",
        delivery: 18, # 10
        phone:    "+7 (84722) 4-14-08",
        work:     "пн.-пт. с 9.00 по 18.00"

      }

    }.freeze

  end # Cities

end # BoxberryApi
