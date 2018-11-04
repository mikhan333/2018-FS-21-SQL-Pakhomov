import csv
import random
import time


def strTimeProp(start, end, format, prop):
    stime = time.mktime(time.strptime(start, format))
    etime = time.mktime(time.strptime(end, format))

    ptime = stime + prop * (etime - stime)

    return time.strftime(format, time.localtime(ptime))


def randomDate(start, end, prop):
    return strTimeProp(start, end, '%Y-%m-%d %H:%M:%S', prop)


def csv_writer(data, path):
    with open(path, "w") as csv_file:
        writer = csv.writer(csv_file, delimiter=',')
        for line in data:
            writer.writerow(line)


reg_users = []


def users(number):
    # data = ["user_id,username,first_name,last_name,reg_dttm,email,password".split(","), ]
    data = []
    for i in range(1, number + 1):
        reg = randomDate("2018-1-1 0:0:0", "2018-11-1 0:0:0", random.random())
        data.append(
            "{0},user_{0},f_name_{0},l_name_{0},{1},email_{0}@mail.ru,pass{0}"
            .format(i, reg)
            .split(",")
            )
        reg_users.append(reg)
    return data


cars_sum = []


def cars(number1, number2):
    data = []
    r = 1
    for i in range(1, number1 + 1):
        u = random.randint(1, 10)
        if 1 <= u <= 7:
            u = 1
        elif 7 < u <= 9:
            u = 2
        else:
            u = 3
        for j in range(1, u + 1):
            data.append(
                "{0},{1},{2},number{0},{3}"
                .format(r, i,
                        random.randint(1, number2),
                        randomDate("2009-1-1 0:0:0", "2018-10-1 0:0:0", random.random())
                        )
                .split(",")
                )
            r += 1
    cars_sum.append(r)

    return data


def models(number):
    data = []
    for i in range(1, number + 1):
        data.append(
            "{0},model_name{0},{1}"
            .format(i, random.randint(1, 4))
            .split(",")
            )
    return data


def sessions(number):
    data = []
    r = 1
    for i in range(1, number + 1):
        u = random.randint(0, 30)
        if u <= 10:
            u = 0
        elif 10 < u <= 15:
            u = 1
        elif 15 < u <= 19:
            u = 2
        elif 19 < u <= 22:
            u = 3
        elif 22 < u <= 24:
            u = 4
        else:
            u -= 20
        for j in range(1, u):
            begin = randomDate(reg_users[i - 1], "2018-11-3 0:0:0", random.random())
            end = randomDate(begin,
                             time.strftime('%Y-%m-%d %H:%M:%S',
                                           time.localtime(
                                               time.mktime(time.strptime(begin, '%Y-%m-%d %H:%M:%S')) + 30000)
                                           ),
                             random.random())
            data.append(
                "{0},{1},{2},{3}"
                .format(r, i, begin, end)
                .split(",")
            )
            r += 1
    return data


def tracks(number):
    data = []
    for i in range(1, number + 1):
        data.append(
            "{0},model_name{0},location{0}"
            .format(i)
            .split(",")
            )
    return data


def sections(number1, number2):
    data = []
    for i in range(1, number1 + 1):
        data.append(
            "{0},{1},location_track{1}_{0},{2},{3},{4}"
            .format(i,
                    random.randint(1, number2),
                    random.randint(1, 4),
                    random.randint(100 * i, 100 * i + 50),
                    random.randint(100 * i + 50, 100 * i + 100)
                    )
            .split(",")
            )
    return data


def sections_price(number):
    data = []
    r = 1
    for i in range(1, number + 1):
        for j in range(1, 5):
            data.append(
                "{0},{1},{2},{3},{4},{5}"
                .format(r, i,
                        "06:0:0",
                        "22:0:0",
                        j,
                        random.randint(50 * j, 70 * j)
                        )
                .split(",")
                )
            r += 1
            data.append(
                "{0},{1},{2},{3},{4},{5}"
                .format(r, i,
                        "22:0:0",
                        "06:0:0",
                        j,
                        random.randint(70 * j, 90 * j)
                        )
                .split(",")
                )
            r += 1
    return data


def driveways(number1, number2):
    data = []
    r = 1
    for i in range(1, number1 + 1):
        u = random.randint(0, 10)
        if u <= 2:
            u = 0
        else:
            u -= 2
        for j in range(1, u + 1):
            begin = randomDate("2018-1-1 0:0:0", "2018-11-3 0:0:0", random.random())
            end = randomDate(begin,
                             time.strftime('%Y-%m-%d %H:%M:%S',
                                           time.localtime(
                                               time.mktime(time.strptime(begin, '%Y-%m-%d %H:%M:%S')) + 20000)
                                           ),
                             random.random())
            data.append(
                        "{0},{1},{2},{3},{4},{5}"
                        .format(r, i,
                                random.randint(1, number2),
                                begin, end, randomDate(end, "2018-11-5 0:0:0", random.random())
                                )
                        .split(",")
                        )
            r += 1
    return data


if __name__ == "__main__":
    user_numb = 100
    model_numb = 300
    csv_writer(users(user_numb), "users.csv")
    csv_writer(models(model_numb), "model.csv")
    csv_writer(cars(user_numb, model_numb), "cars.csv")
    csv_writer(sessions(user_numb), "sessions.csv")
    track_numb = 20
    csv_writer(tracks(track_numb), "tracks.csv")
    section_numb = 130
    csv_writer(sections(section_numb, track_numb), "sections.csv")
    csv_writer(sections_price(section_numb), "sections_price.csv")
    csv_writer(driveways(cars_sum[0], section_numb), "driveways.csv")

