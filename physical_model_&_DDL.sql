/*Physical model with CREATE-queries*/

CREATE TABLE teacher (
    teacher_id int NOT NULL,
    nname varchar(256) UNIQUE,
    job_title varchar(256) NOT NULL,
    job_experience_time int NOT NULL,
    experience varchar(256) NOT NULL,
    status varchar(256) NOT NULL,
    course varchar(256) NOT NULL,
    CONSTRAINT teacher_pk PRIMARY KEY (teacher_id, course)
);

CREATE TABLE course (
    nname varchar(256) UNIQUE,
    level varchar(256) NOT NULL,
    state_document bool NOT NULL,
    main_aim varchar(256) NOT NULL,
    common_time int NOT NULL,
    video_number int NOT NULL,
    test_number int NOT NULL,
    teacher varchar(256) NOT NULL,
    course_id int NOT NULL,
    CONSTRAINT course_pk PRIMARY KEY (course_id, teacher),
    CONSTRAINT teacher_fk FOREIGN KEY (teacher)
    REFERENCES teacher(nname)
);

CREATE TABLE student (
    ID int UNIQUE,
    student_id varchar(256) NOT NULL,
    date_of_birth date NOT NULL,
    age int NOT NULL,
    aim varchar(256) NOT NULL,
    start_time date NOT NULL,
    finish_time date NOT NULL,
    course varchar(256) NOT NULL,
    CONSTRAINT student_pk PRIMARY KEY (ID, course),
    CONSTRAINT sudent_fk FOREIGN KEY (course)
    REFERENCES course(nname)
);

CREATE TABLE transaction (
    transaction_id int PRIMARY KEY,
    student_id int NOT NULL,
    course varchar(256)NOT NULL,
    sum int NOT NULL,
    date date NOT NULL,
    status varchar(256) NOT NULL,
    CONSTRAINT transaction_fk FOREIGN KEY (course)
    REFERENCES course(nname),
    CONSTRAINT transaction_fk_1 FOREIGN KEY (student_id)
    REFERENCES student(ID)
);

CREATE TABLE partner_company (
    company_id int UNIQUE,
    nname varchar(256) NOT NULL,
    installment_payment bool NOT NULL,
    internship bool NOT NULL,
    employment bool NOT NULL,
    company_diploma bool NOT NULL,
    course varchar(256) NOT NULL,
    CONSTRAINT partner_company_pk PRIMARY KEY (company_id, course),
    CONSTRAINT partner_company_fk FOREIGN KEY (course)
    REFERENCES course(nname)
);

CREATE TABLE event (
    nname varchar(256) PRIMARY KEY,
    date date NOT NULL,
    company_id int NOT NULL,
    CONSTRAINT event_fk FOREIGN KEY (company_id)
    REFERENCES partner_company(company_id)
);

CREATE TABLE recall (
    ID int PRIMARY KEY,
    course varchar(256) NOT NULL,
    date date NOT NULL,
    mark int NOT NULL,
    CONSTRAINT recall_fk FOREIGN KEY (course)
    REFERENCES course(nname),
    CONSTRAINT recall_fk_1 FOREIGN KEY (ID)
    REFERENCES student(ID)
);

CREATE TABLE class (
    class_id int PRIMARY KEY,
    course varchar(256) NOT NULL,
    week_day varchar(256) NOT NULL,
    start_time date NOT NULL,
    finish_time date NOT NULL,
    CONSTRAINT class_fk FOREIGN KEY (course)
    REFERENCES course(nname)
);



/*INSERT-queries*/

INSERT INTO teacher VALUES (1111, 'Иван Петров', 'юрист', 10, 'Коммерческое право', 'преподаватель', 'Коммерческое право');
INSERT INTO teacher VALUES (2222, 'Елена Сидорова', 'бухгалтер', 6, 'Финансовый учет', 'преподаватель', 'Финансовый учет');
INSERT INTO teacher VALUES (3333, 'Александр Иванов', 'программист', 8, 'Программирование на Python', 'преподаватель', 'Программирование на Python');
INSERT INTO teacher VALUES (4444, 'Ольга Козлова', 'маркетолог', 7, 'Маркетинг в социальных сетях', 'куратор', 'Маркетинг в социальных сетях');
INSERT INTO teacher VALUES (5555, 'Ирина Николаева', 'аналитик данных', 5, 'Основы анализа данных', 'преподаватель', 'Основы анализа данных');
INSERT INTO teacher VALUES (6666, 'Дмитрий Смирнов', 'инвестор', 15, 'Стартапы и инвестиции', 'преподаватель', 'Стартапы и инвестиции');
INSERT INTO teacher VALUES (7777, 'Максим Глушков', 'разработчик блокчейн', 4, 'Криптовалюты и блокчейн', 'преподаватель', 'Криптовалюты и блокчейн');
INSERT INTO teacher VALUES (8888, 'Андрей Кузнецов', 'специалист по продажам', 9, 'Стратегии продаж', 'куратор', 'Стратегии продаж');
INSERT INTO teacher VALUES (9999, 'Владимир Попов', 'разработчик мобильных приложений', 12, 'Разработка мобильных приложений', 'преподаватель', 'Разработка мобильных приложений');
INSERT INTO teacher VALUES (1010, 'Сергей Иванов', 'администратор сети', 11, 'Архитектура компьютерных сетей', 'преподаватель', 'Архитектура компьютерных сетей');

INSERT INTO course VALUES ('Коммерческое право', 'средний', True, 'освоить правовые аспекты бизнеса и предпринимательства', 60, 30, 30, 'Иван Петров', 12345);
INSERT INTO course VALUES ('Финансовый учет', 'новичок', True, 'научиться вести бухгалтерский учет', 45, 20, 20, 'Елена Сидорова', 23456);
INSERT INTO course VALUES ('Программирование на Python', 'новичок', True, 'научиться основам языка программирования Python', 90, 60, 60, 'Александр Иванов', 34567);
INSERT INTO course VALUES ('Маркетинг в социальных сетях', 'средний', True, 'научиться продвижению бизнеса в социальных сетях', 30, 10, 10, 'Ольга Козлова', 45678);
INSERT INTO course VALUES ('Основы анализа данных', 'средний', True, 'научиться анализировать данные и делать выводы', 60, 40, 40, 'Ирина Николаева', 56789);
INSERT INTO course VALUES ('Стартапы и инвестиции', 'профессионал', True, 'научиться созданию и инвестированию в стартапы', 45, 25, 25, 'Дмитрий Смирнов', 67890);
INSERT INTO course VALUES ('Криптовалюты и блокчейн', 'средний', True, 'научиться работе с криптовалютами и технологией блокчейн', 60, 50, 50, 'Максим Глушков', 78901);
INSERT INTO course VALUES ('Стратегии продаж', 'средний', False, 'изучить стратегии продаж и научиться убеждать клиентов', 30, 15, 15, 'Андрей Кузнецов', 89012);
INSERT INTO course VALUES ('Разработка мобильных приложений', 'профессионал', True, 'научиться созданию мобильных приложений', 90, 60, 60, 'Владимир Попов', 90123);
INSERT INTO course VALUES ('Архитектура компьютерных сетей', 'профессионал', True, 'изучить основные принципы проектирования и настройки компьютерных сетей', 75, 40, 40, 'Сергей Иванов', 11223);

INSERT INTO student VALUES (98241, 'Николай Белоусов', '1985-04-12', 38, 'Получение знаний в области коммерческого права для уверенного ведения бизнеса и торговых операций.', '2017-02-17', '2017-07-30', 'Коммерческое право');
INSERT INTO student VALUES (64783, 'Анна Кузнецова', '1978-09-23', 44, 'Понимание финансовых аспектов бизнеса и научиться управлять финансами компании.', '2016-06-29', '2017-08-02', 'Финансовый учет');
INSERT INTO student VALUES (32546, 'Дмитрий Петрович', '1991-06-05', 32, 'Получение навыков программирования на Python для работы с данными и автоматизации рутинных задач.', '2020-12-04', '2021-03-12', 'Программирование на Python');
INSERT INTO student VALUES (78543, 'Елена Сергеевна', '1987-03-17', 36, 'Овладение методами продвижения продуктов и услуг через социальные сети для повышения их продаж и популярности.', '2018-09-21', '2019-09-18', 'Маркетинг в социальных сетях');
INSERT INTO student VALUES (23987, 'Михаил Жуковский', '2003-11-29', 19, 'Получение навыков работы с данными и их анализа для принятия эффективных бизнес-решений.', '2022-05-12', '2023-06-24', 'Основы анализа данных');
INSERT INTO student VALUES (56923, 'Оксана Иванова', '1975-08-20', 47, 'Понимание основ создания собственного бизнеса и умение привлекать инвестиции для его развития.', '2021-11-02', '2023-10-09', 'Стартапы и инвестиции');
INSERT INTO student VALUES (71456, 'Артем Крылов', '2000-02-08', 23, 'Изучение технологии блокчейн и ее применения в различных отраслях, а также получение навыков работы с криптовалютами.', '2017-03-28', '2023-05-19', 'Криптовалюты и блокчейн');
INSERT INTO student VALUES (86329, 'Валерия Лебедева', '1996-10-30', 26, 'Овладение методами и техниками продаж для увеличения объемов продаж и увеличения прибыли бизнеса.', '2019-08-16', '2023-11-22', 'Стратегии продаж');
INSERT INTO student VALUES (42813, 'Кирилл Соколов', '1982-07-16', 40, 'Получение навыков разработки мобильных приложений для различных платформ (iOS, Android).', '2023-01-23', '2023-05-04', 'Разработка мобильных приложений');
INSERT INTO student VALUES (29768, 'Наталья Федотова', '1994-12-27', 29, 'Изучение принципов проектирования, настройки и управления компьютерными сетями для обеспечения бесперебойной работы IT-инфраструктуры предприятия.', '2016-07-08', '2023-01-15', 'Архитектура компьютерных сетей');

INSERT INTO transaction VALUES (74312, 98241, 'Стартапы и инвестиции', 10670, '2020-08-07', 'completed');
INSERT INTO transaction VALUES (36281, 64783, 'Финансовый учет', 1885, '2021-04-09', 'not completed');
INSERT INTO transaction VALUES (92658, 32546, 'Стратегии продаж', 5850, '2022-02-13', 'completed');
INSERT INTO transaction VALUES (58036, 78543, 'Криптовалюты и блокчейн', 13892, '2023-01-25', 'not completed');
INSERT INTO transaction VALUES (48209, 23987, 'Разработка мобильных приложений', 27583, '2022-12-30', 'completed');
INSERT INTO transaction VALUES (39721, 56923, 'Программирование на Python', 17195, '2021-11-19', 'completed');
INSERT INTO transaction VALUES (27105, 71456, 'Основы анализа данных', 9815, '2021-07-22', 'completed');
INSERT INTO transaction VALUES (65843, 86329, 'Маркетинг в социальных сетях', 23926, '2023-05-03', 'not completed');
INSERT INTO transaction VALUES (89567, 42813, 'Коммерческое право', 22402, '2022-09-02', 'completed');
INSERT INTO transaction VALUES (81934, 29768, 'Архитектура компьютерных сетей', 5803, '2020-09-14', 'not completed');

INSERT INTO partner_company VALUES (75459, 'PixelPilot', True, False, False, False, 'Стартапы и инвестиции');
INSERT INTO partner_company VALUES (89421, 'CloudGenius', False, True, True, True, 'Разработка мобильных приложений');
INSERT INTO partner_company VALUES (16672, 'AgileMind', True, True, False, False, 'Основы анализа данных');
INSERT INTO partner_company VALUES (42987, 'DataWise', True, False, False, False, 'Стартапы и инвестиции');
INSERT INTO partner_company VALUES (70741, 'CodeCrush', False, False, True, True, 'Стратегии продаж');
INSERT INTO partner_company VALUES (27183, 'ManageEasily', False, True, True, True, 'Архитектура компьютерных сетей');
INSERT INTO partner_company VALUES (54689, 'InnovateNow', True, False, True, True, 'Криптовалюты и блокчейн');
INSERT INTO partner_company VALUES (93726, 'ThinkTech', False, True, True, True, 'Разработка мобильных приложений');
INSERT INTO partner_company VALUES (10895, 'NextLevelSolutions', False, False, False, True, 'Коммерческое право');
INSERT INTO partner_company VALUES (64320, 'LaunchPad', True, True, True, False, 'Финансовый учет');

INSERT INTO event VALUES ('Новые технологии и методы управления', '2022-03-15', 75459);
INSERT INTO event VALUES ('Интерактивный опыт: обучение и лидерство в цифровой эпохе', '2022-05-20', 89421);
INSERT INTO event VALUES ('IT-инновации и бизнес: перспективы и вызовы', '2022-09-22', 16672);
INSERT INTO event VALUES ('Автоматизация и оптимизация бизнес-процессов: лучшие практики', '2022-11-11', 42987);
INSERT INTO event VALUES ('Управление проектами в IT-секторе: стратегии и инструменты', '2023-01-15', 70741);
INSERT INTO event VALUES ('Сетевое маркетинговое общество: создание и развитие команды', '2023-02-20', 27183);
INSERT INTO event VALUES ('Эффективное управление данными: анализ, хранение и защита', '2023-04-07', 54689);
INSERT INTO event VALUES ('Будущее инноваций: мировые тренды и платформы', '2022-06-30', 93726);
INSERT INTO event VALUES ('IT-безопасность и киберзащита: вызовы и решения', '2023-06-12', 10895);
INSERT INTO event VALUES ('Коммуникация и взаимодействие в виртуальной среде: стратегии и методы', '2022-08-10', 64320);

INSERT INTO recall VALUES (98241, 'Программирование на Python', '2018-09-23', 8);
INSERT INTO recall VALUES (64783, 'Архитектура компьютерных сетей', '2020-02-14', 7);
INSERT INTO recall VALUES (32546, 'Коммерческое право', '2016-11-08', 9);
INSERT INTO recall VALUES (78543, 'Стартапы и инвестиции', '2015-12-25', 6);
INSERT INTO recall VALUES (23987, 'Разработка мобильных приложений', '2021-03-19', 8);
INSERT INTO recall VALUES (56923, 'Финансовый учет', '2016-05-17', 7);
INSERT INTO recall VALUES (71456, 'Маркетинг в социальных сетях', '2019-12-31', 6);
INSERT INTO recall VALUES (86329, 'Основы анализа данных', '2017-06-11', 9);
INSERT INTO recall VALUES (42813, 'Стратегии продаж', '2022-07-02', 6);
INSERT INTO recall VALUES (29768, 'Криптовалюты и блокчейн', '2016-07-29', 5);

INSERT INTO class VALUES (18654, 'Стартапы и инвестиции', 'Monday', '2022-05-21', '2022-08-13');
INSERT INTO class VALUES (28216, 'Программирование на Python', 'Wednesday', '2022-03-12', '2022-05-28');
INSERT INTO class VALUES (39887, 'Стратегии продаж', 'Friday', '2022-09-28', '2022-11-18');
INSERT INTO class VALUES (44112, 'Криптовалюты и блокчейн', 'Thursday', '2022-11-08', '2023-01-27');
INSERT INTO class VALUES (53157, 'Маркетинг в социальных сетях', 'Sunday', '2022-12-25', '2023-03-19');
INSERT INTO class VALUES (62749, 'Архитектура компьютерных сетей', 'Tuesday', '2023-02-01', '2023-04-22');
INSERT INTO class VALUES (74922, 'Финансовый учет', 'Saturday', '2023-07-28', '2023-10-14');
INSERT INTO class VALUES (83245, 'Основы анализа данных', 'Thursday', '2023-05-18', '2023-07-15');
INSERT INTO class VALUES (96513, 'Коммерческое право', 'Monday', '2023-09-02', '2023-11-27');
INSERT INTO class VALUES (98763, 'Разработка мобильных приложений', 'Tuesday', '2023-12-20', '2024-03-09');

SELECT
teacher_id,
teacher.nname,
course,
level
FROM 
teacher JOIN course ON teacher.nname = course.teacher
WHERE level = 'средний' OR level = 'профессионал';

SELECT
teacher,
nname,
common_time,
level
FROM course
WHERE course.teacher = 'Иван Петров'
    OR course.teacher = 'Елена Сидорова'
    OR course.teacher = 'Александр Иванов';

SELECT
(SELECT
student_id
FROM
student
WHERE
ID = transaction.student_id),
sum,
course
FROM transaction
WHERE sum > 10000;

SELECT
event.date,
event.nname,
partner_company.nname
FROM partner_company JOIN event
ON partner_company.company_id = event.company_id
WHERE partner_company.nname = 'PixelPilot' OR
    partner_company.nname = 'CloudGenius' OR
    partner_company.nname = 'AgileMind' OR
    partner_company.nname = 'DataWise' OR
    partner_company.nname = 'CodeCrush';

SELECT
course.nname,
recall.mark,
recall.date
FROM recall JOIN course
ON course.nname = recall.course
WHERE course.nname = 'Разработка мобильных приложений' OR
    course.nname = 'Программирование на Python' OR
    course.nname = 'Архитектура компьютерных сетей' OR
    course.nname = 'Криптовалюты и блокчейн';

SELECT
class.class_id,
course.nname,
class.week_day,
course.level
FROM class JOIN course
ON course.nname = class.course
WHERE course.level != 'новичок' AND
    class.week_day != 'Sunday' AND
    class.week_day != 'Saturday';

UPDATE teacher
SET job_title = 'преподаватель'
WHERE teacher_id % 2 = 0 AND
    teacher_id > 3000 AND
    job_title = 'куратор';

UPDATE teacher
SET job_title = 'куратор'
WHERE teacher_id % 2 = 0 AND
    teacher_id > 3000 AND
    job_title = 'преподаватель';

UPDATE course
SET common_time = common_time + 3
WHERE common_time < 2;

DELETE FROM event
WHERE company_id = ANY (SELECT company_id
                                    FROM partner_company
                                        WHERE company_diploma = False);

DELETE FROM recall
WHERE date < '2019-01-01';