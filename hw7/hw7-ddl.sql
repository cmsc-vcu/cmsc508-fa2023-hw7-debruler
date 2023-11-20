# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    skills_id int not null,
    skills_name varchar(255),
    skills_description varchar(255) not null,
    skills_tag varchar(255) not null,
    skills_url varchar(255),
    skills_time_commitment int,
    primary key (skills_id)
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills ( skills_id, skills_name, skills_description, skills_tag ) values
    (1,'eating','eating lots of food','Skill 1'),
    (2,'sitting','sitting on a piece of furniture or the floor','Skill 2'),
    (3,'cleaning','tidying up a given area','Skill 3'),
    (4,'game development','building games through planning, coding, and making art','Skill 4'),
    (5,'studying','learning or memorizing information','Skill 5'),
    (6,'presentations','the ability to present information in front of a group of people','Skill 6'),
    (7,'front end development','building how a website looks with some combination of HTML and CSS','Skill 7'),
    (8,'rock climbing','climbing rocks','Skill 8');

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int NOT NULL,
    people_first_name varchar(255),
    people_last_name varchar(256) NOT NULL,
    PRIMARY KEY (people_id),
    people_email varchar(255),
    people_linkedin_url varchar(255),
    people_headshot_url varchar(255),
    people_discord_handle varchar(255),
    people_brief_bio varchar(255),
    people_date_joined date NOT NULL
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people (people_id, people_first_name, people_last_name, people_date_joined) values 
    (1,'Will','Person 1','2023-11-01'),
    (2,'Hannibal','Person 2','2023-11-02'),
    (3,'Jack','Person 3','2023-11-03'),
    (4,'Alana','Person 4','2023-11-04'),
    (5,'Chiyoh','Person 5','2023-11-05'),
    (6,'Beverly','Person 6','2023-11-06'),
    (7,'Bedelia','Person 7','2023-11-07'),
    (8,'Freddie','Person 8','2023-11-08'),
    (9,'Chilton','Person 9','2023-11-09'),
    (10,'Margot','Person 10','2023-11-10');

select * from people;


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    peopleskills_id int NOT NULL,
    skills_id int NOT NULL,
    people_id int NOT NULL,
    peopleskills_date_acquired date NOT NULL,
    PRIMARY KEY (peopleskills_id),
    FOREIGN KEY (skills_id) REFERENCES skills(skills_id),
    FOREIGN KEY (people_id) REFERENCES people(people_id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
insert into peopleskills (peopleskills_id, skills_id, people_id, peopleskills_date_acquired) values
    (1,1,1,'2023-11-19'),
    (2,3,1,'2023-11-19'),
    (3,6,1,'2023-11-19');

# Person 2 has skills 3,4,5;
insert into peopleskills (peopleskills_id, skills_id, people_id, peopleskills_date_acquired) values
    (4,3,2,'2023-11-18'),
    (5,4,2,'2023-11-18'),
    (6,5,2,'2023-11-18');

# Person 3 has skills 1,5;
insert into peopleskills (peopleskills_id, skills_id, people_id, peopleskills_date_acquired) values
    (7,1,3,'2023-11-17'),
    (8,5,3,'2023-11-17');

# Person 4 has no skills;

# Person 5 has skills 3,6;
insert into peopleskills (peopleskills_id, skills_id, people_id, peopleskills_date_acquired) values
    (9,3,5,'2023-11-16'),
    (10,6,5,'2023-11-16');

# Person 6 has skills 2,3,4;
insert into peopleskills (peopleskills_id, skills_id, people_id, peopleskills_date_acquired) values
    (11,2,6,'2023-11-15'),
    (12,3,6,'2023-11-15'),
    (13,4,6,'2023-11-15');

# Person 7 has skills 3,5,6;
insert into peopleskills (peopleskills_id, skills_id, people_id, peopleskills_date_acquired) values
    (14,3,7,'2023-11-14'),
    (15,5,7,'2023-11-14'),
    (16,6,7,'2023-11-14');

# Person 8 has skills 1,3,5,6;
insert into peopleskills (peopleskills_id, skills_id, people_id, peopleskills_date_acquired) values
    (17,1,8,'2023-11-13'),
    (18,3,8,'2023-11-13'),
    (19,5,8,'2023-11-13'),
    (20,6,8,'2023-11-13');

# Person 9 has skills 2,5,6;
insert into peopleskills (peopleskills_id, skills_id, people_id, peopleskills_date_acquired) values
    (21,2,9,'2023-11-12'),
    (22,5,9,'2023-11-12'),
    (23,6,9,'2023-11-12');

# Person 10 has skills 1,4,5;
insert into peopleskills (peopleskills_id, skills_id, people_id, peopleskills_date_acquired) values
    (24,1,10,'2023-11-11'),
    (25,4,10,'2023-11-11'),
    (26,5,10,'2023-11-11');

# Note that no one has yet acquired skills 7 and 8.
 

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles
CREATE TABLE roles (
    role_id int,
    role_name varchar(255),
    role_sort_priority int,
    primary key (role_id)
);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)
insert into roles (role_id, role_name, role_sort_priority) values  
    (1,'Designer',10),
    (2,'Developer',20),
    (3,'Recruit',30),
    (4,'Team Lead',40),
    (5,'Boss',50),
    (6,'Mentor',60);


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    peopleroles_id int auto_increment,
    people_id int,
    role_id int,
    date_assigned date,
    primary key (peopleroles_id),
    foreign key (people_id) REFERENCES people (people_id),
    foreign key (role_id) REFERENCES roles (role_id)
);



# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles (people_id, role_id, date_assigned) values
    (1,2,'2023-11-01'),
    (2,5,'2023-11-02'),
    (2,6,'2023-11-02'),
    (3,2,'2023-11-03'),
    (3,4,'2023-11-03'),
    (4,3,'2023-11-04'),
    (5,3,'2023-11-05'),
    (6,2,'2023-11-06'),
    (6,1,'2023-11-06'),
    (7,1,'2023-11-07'),
    (8,1,'2023-11-08'),
    (8,4,'2023-11-08'),
    (9,2,'2023-11-09'),
    (10,2,'2023-11-10'),
    (10,1,'2023-11-10');
