CREATE TABLE Hotel (
  hotelNo INT NOT NULL,
  hotelName VARCHAR(30) NOT NULL UNIQUE,
  city VARCHAR(15) NOT NULL,
  PRIMARY KEY(hotelNo)
  );

CREATE TABLE Guest (
  guestNo INT NOT NULL,
  guestName VARCHAR(20) NOT NULL,
  guestAddress VARCHAR(20),
  PRIMARY KEY(guestNo)
);

CREATE DOMAIN roomType AS CHAR(6)
CHECK (VALUE IN('SINGLE', 'DOUBLE', 'FAMILY'));

CREATE TABLE Room (
  roomNo INT NOT NULL,
  CHECK (roomNo>=1 AND roomNo<=120),
  hotelNo INT NOT NULL,
  type roomType NOT NULL,
  price NUMERIC NOT NULL,
  CHECK (price>=10 AND price<=100),
  PRIMARY KEY (roomNo, hotelNo),
  FOREIGN KEY(hotelNo) REFERENCES Hotel(hotelNo)
);

CREATE TABLE Booking (
  roomNo INT NOT NULL,
  CHECK (roomNo>=1 AND roomNo<=120),
  hotelNo INT NOT NULL,
  guestNo INT NOT NULL,
  dateFrom DATE NOT NULL,
  dateTo DATE NOT NULL,
  CHECK (dateFrom>CAST(CURRENT_TIMESTAMP AS DATE) AND dateTo>CAST(CURRENT_TIMESTAMP AS DATE)),
  PRIMARY KEY (hotelNo, guestNo, dateFrom),
  FOREIGN KEY(roomNo, hotelNo) REFERENCES Room,
  FOREIGN KEY(guestNo) REFERENCES Guest(guestNo)
);

INSERT INTO Hotel VALUES(1, 'Eco Hotel Terrabella', 'Santa Elena');
INSERT INTO Hotel VALUES(2, 'Hotel Arreboles Del Caribe', 'Arboletes');
INSERT INTO Hotel VALUES(3, 'Hotel Brisas del Calima', 'Calima');
INSERT INTO Hotel VALUES(4, 'Jordan Hotel Boutique', 'Guatapé');
INSERT INTO Hotel VALUES(5, 'Sixtina Plaza Hotel', 'Itagüi');
INSERT INTO Hotel VALUES(6, 'Villa del Mojan', 'Calera');
INSERT INTO Hotel VALUES(7, 'Cielo en Tena', 'Tena');
INSERT INTO Hotel VALUES(8, 'Hotel Ayenda Marckia', 'Armenia');
INSERT INTO Hotel VALUES(9, 'Hotel Casa Azul', 'Ladrilleros');
INSERT INTO Hotel VALUES(10, 'Hotel Bicentenario', 'Rionegro');

INSERT INTO Guest VALUES(1, 'Amina Romero', '2833 Grove Avenue');
INSERT INTO Guest VALUES(2, 'Damian Abreu', '349 Benedum Drive');
INSERT INTO Guest VALUES(3, 'Xavi Acedo', '3869 Ingram Road');
INSERT INTO Guest VALUES(4, 'Alonso Salas', '4873 Stoney Lane');
INSERT INTO Guest VALUES(5, 'Helena Peiro', '4252 Forest Drive');
INSERT INTO Guest VALUES(6, 'Josep Saldaña', '532 Birch Street');
INSERT INTO Guest VALUES(7, 'June Sampedro', '1830 Bryan Street');
INSERT INTO Guest VALUES(8, 'Claudio Benitez', '1095 Hillside Drive');
INSERT INTO Guest VALUES(9, 'Jamila Echevarria', '3462 Clover Drive');
INSERT INTO Guest VALUES(10, 'Bonifacio Sanz', '2769 Bartlett Avenue');

INSERT INTO Room VALUES(1, 1, 'SINGLE', 40);
INSERT INTO Room VALUES(1, 2, 'DOUBLE', 70);
INSERT INTO Room VALUES(2, 3, 'FAMILY', 100);
INSERT INTO Room VALUES(3, 3, 'SINGLE', 40);
INSERT INTO Room VALUES(4, 4, 'DOUBLE', 70);
INSERT INTO Room VALUES(4, 5, 'FAMILY', 100);
INSERT INTO Room VALUES(4, 6, 'SINGLE', 40);
INSERT INTO Room VALUES(5, 7, 'DOUBLE', 70);
INSERT INTO Room VALUES(6, 8, 'FAMILY', 100);
INSERT INTO Room VALUES(7, 9, 'SINGLE', 40);

INSERT INTO Booking VALUES(1, 1, 1, TO_DATE('20/04/2022', 'DD/MM/YYYY'), TO_DATE('20/05/2022', 'DD/MM/YYYY'));
INSERT INTO Booking VALUES(1, 2, 2, TO_DATE('20/04/2022', 'DD/MM/YYYY'), TO_DATE('20/05/2022', 'DD/MM/YYYY'));
INSERT INTO Booking VALUES(2, 3, 3, TO_DATE('20/04/2022', 'DD/MM/YYYY'), TO_DATE('20/05/2022', 'DD/MM/YYYY'));
INSERT INTO Booking VALUES(3, 3, 4, TO_DATE('20/04/2022', 'DD/MM/YYYY'), TO_DATE('20/05/2022', 'DD/MM/YYYY'));
INSERT INTO Booking VALUES(4, 4, 5, TO_DATE('20/04/2022', 'DD/MM/YYYY'), TO_DATE('20/05/2022', 'DD/MM/YYYY'));
INSERT INTO Booking VALUES(4, 5, 6, TO_DATE('20/04/2022', 'DD/MM/YYYY'), TO_DATE('20/05/2022', 'DD/MM/YYYY'));
INSERT INTO Booking VALUES(4, 6, 7, TO_DATE('20/04/2022', 'DD/MM/YYYY'), TO_DATE('20/05/2022', 'DD/MM/YYYY'));
INSERT INTO Booking VALUES(5, 7, 8, TO_DATE('20/04/2022', 'DD/MM/YYYY'), TO_DATE('20/05/2022', 'DD/MM/YYYY'));
INSERT INTO Booking VALUES(6, 8, 9, TO_DATE('20/04/2022', 'DD/MM/YYYY'), TO_DATE('20/05/2022', 'DD/MM/YYYY'));
INSERT INTO Booking VALUES(7, 9, 10, TO_DATE('20/04/2022', 'DD/MM/YYYY'), TO_DATE('20/05/2022', 'DD/MM/YYYY'));
