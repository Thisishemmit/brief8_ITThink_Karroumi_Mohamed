
create DATABASE if NOT EXISTS itthink;
use itthink;

CREATE TABLE IF NOT EXISTS Users (
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
)

CREATE TABLE IF NOT EXISTS  Freelancers(
    id_freelancer INT AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES Users(id_user)
)

CREATE TABLE IF NOT EXISTS  Categories(
    id_category INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
)

CREATE TABLE IF NOT EXISTS Subcategories(
    id_subcategory INT AUTO_INCREMENT PRIMARY KEY,
    id_category INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_category) REFERENCES Categories(id_category)
)

CREATE TABLE IF NOT EXISTS Projects(
    id_project INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    discription TEXT NOT NULL,
    id_user INT NOT NULL,
    id_subcategory INT,
    id_category INT,
    FOREIGN KEY (id_user) REFERENCES Users(id_user),
    FOREIGN KEY (id_subcategory) REFERENCES Subcategories(id_subcategory),
    FOREIGN KEY (id_category) REFERENCES Categories(id_category)
)


CREATE TABLE IF NOT EXISTS Offres(
    id_offre INT AUTO_INCREMENT PRIMARY KEY,
    id_project INT NOT NULL,
    id_freelancer INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    deadline DATE NOT NULL
)

CREATE TABLE IF NOT EXISTS Testimonials(
    id_testimonial INT AUTO_INCREMENT PRIMARY KEY,
    user_comment INT NOT NULL,
    id_user INT NOT NULL,
    id_freelancer INT NOT NULL,
    FOREIGN KEY  (id_user) REFERENCES Users(id_user),
    FOREIGN KEY (id_freelancer) REFERENCES Freelancers(id_freelancer)
)

CREATE TABLE IF NOT EXISTS Skill(
    id_skill INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
)

CREATE TABLE IF NOT EXISTS User_Skill(
    id_user INT NOT NULL,
    id_skill INT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES Users(id_user),
    FOREIGN KEY (id_skill) REFERENCES Skill(id_skill)
)

